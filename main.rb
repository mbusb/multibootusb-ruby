#!/usr/bin/env ruby
require 'Qt4'
require 'fileutils'
require 'find'
require 'dbus'
require 'rbconfig'
require_relative 'install-syslinux'
require_relative 'multibootusb_ui'
require_relative 'update-config'
require_relative 'copy-progress'
require_relative 'detect-distro'
require_relative 'uninstall-distro'
require_relative 'qemu'
require_relative 'cfgdir'

include RbConfig


case CONFIG['host_os']

  when /mswin|windows/i
    $Os = "Windows"
  when /linux|arch/i
    $Os = "Linux"
        $pro_dir = File.join(Dir.home, ".multibootusb")
        $live_mount = File.join(Dir.home, ".multibootusb", "live")
        if not File.exists?($pro_dir)
            Dir.mkdir($pro_dir)
            puts "Creating #$pro_dir"
            Dir.mkdir ($live_mount)
            puts "Creating #$live_mount"
        else
            puts "#$pro_dir not created"
            # Clean up code here...
        end
    #puts Os
  when /sunos|solaris/i
    $Os = "Solaris"
  when /darwin/i
    $Os = "MAC"
  else
    $Os = "None"
end


class MainForm < Qt::Dialog

  slots 'browse_iso()', 'create_mbusb()', 'update_combobox()', 'uninstall_distro()', 'install_syslinux()', 'edit_syslinux()', 'qemu_iso()', 'get_qemu_iso()', 'qemu_usb()'

  def initialize
    super
    @ui = Ui::Dialog.new
    @ui.setup_ui(self)
    $version = File.read("./version.txt").to_i
    puts $version
    if $Os == "Linux"
        pass_ui
            if not File.exists?($live_mount)
                Dir.mkdir($live_mount)
                puts "Creating #$live_mount"
        else
            puts "unmounting live directory."
            `echo "#{$pass}" | sudo -S umount "#{$live_mount}"`
        end
    end

    if $Os == "Windows"
        oFS = WIN32OLE.new("Scripting.FileSystemObject")
        oDrives = oFS.Drives
        oDrives.each() do |usb|
        #driveType 1 is removable disk
            if usb.DriveType == 1 && usb.IsReady
            @ui.comboBox.addItem usb.DriveLetter + ":\\ ,  " + usb.VolumeName
            end
            end
    elsif $Os == "Linux"
        bus = DBus::SystemBus.instance
        udisk_service = bus.service("org.freedesktop.UDisks")
        udisk_udisk = udisk_service.object("/org/freedesktop/UDisks")
        udisk_udisk.introspect
        udisk_udisk.default_iface = "org.freedesktop.UDisks"
        disk_list = udisk_udisk.EnumerateDevices[0]
        disk_list.each { |disk|
        udisk_udisk = udisk_service.object("#{disk}")
        udisk_udisk.introspect
        udisk_udisk_i = udisk_udisk["org.freedesktop.UDisks.Device"]
            if udisk_udisk_i["DriveConnectionInterface"] == "usb" && udisk_udisk_i["DeviceIsPartition"]
            #puts disk #Debug
            @ui.comboBox.addItem "#{udisk_udisk_i["DeviceFile"]}" + ",  " + "#{udisk_udisk_i["IdLabel"]}"
            puts "Device file: #{udisk_udisk_i["DeviceFile"]}"
            $deviceFile = udisk_udisk_i["DeviceFile"]
            puts $deviceFile
#           puts "Is device mounted: #{udisk_udisk_i["DeviceIsMounted"]}"
#           puts "Is device mount path: #{udisk_udisk_i["DeviceMountPaths"]}"
#           $usb_mount_path = "#{udisk_udisk_i["DeviceMountPaths"][0]}"
#           puts "Device mount path:  #$usb_mount_path"
#           puts "Device uuid: #{udisk_udisk_i["IdUuid"]}"
#           puts "Device label: #{udisk_udisk_i["IdLabel"]}"
#           puts "Device Type: #{udisk_udisk_i["IdType"]}"
#           puts "Device Size: #{udisk_udisk_i["PartitionSize"]}"
#           puts ""
                if "#{udisk_udisk_i["DeviceFile"]}"
                    get_usb_details()
                end
            end
        }

    update_list_box()
    elsif $Os == "MAC"
        # Some body can code for mac OS here.
    elsif $Os == "Solaris"
        # Some body can code for Solaris here.  
    end
    @ui.label.text = "Status OK."
    @ui.lineEdit_2.setFocus()
    @ui.lineEdit.setFocus()
    #Qt::Object.connect(@ui.browse_iso, SIGNAL('clicked()'), self, SLOT('browse_iso()'))
    @ui.browse_iso.connect(SIGNAL :clicked) { browse_iso() }
    Qt::Object.connect(@ui.create, SIGNAL('clicked()'), self, SLOT('create_mbusb()'))
    Qt::Object.connect(@ui.comboBox, SIGNAL('currentIndexChanged(int)'), self, SLOT('update_combobox()'))
    #@ui.comboBox.connect(SIGNAL :'currentIndexChanged(int)') { update_combobox() }
    Qt::Object.connect(@ui.uninstall, SIGNAL('clicked()'), self, SLOT('uninstall_distro()'))
    Qt::Object.connect(@ui.install_syslinux, SIGNAL('clicked()'), self, SLOT('install_syslinux()'))
    Qt::Object.connect(@ui.edit_syslinux, SIGNAL('clicked()'), self, SLOT('edit_syslinux()'))
    Qt::Object.connect(@ui.browse_iso_qemu, SIGNAL('clicked()'), self, SLOT('get_qemu_iso()'))
    Qt::Object.connect(@ui.boot_iso_qemu, SIGNAL('clicked()'), self, SLOT('qemu_iso()'))
    Qt::Object.connect(@ui.boot_usb_qemu, SIGNAL('clicked()'), self, SLOT('qemu_usb()'))
           
    @ui.close.connect(SIGNAL :clicked) {
                                                @ui.label.text = "Please wait..."
                                                if not Dir["#$live_mount/*"].empty?
                                                    puts "unmounting iso directory..."
                                                    umount_iso = `echo "#{$pass}" | sudo -S umount "#{$live_mount}"`
                                                    sleep 0.5
                                                    #Dir.rmdir ($live_mount)
                                                    `sync`
                                                else
													@ui.label.text = "Please wait..."
                                                    puts "Cleaning temp directory..."
                                                    Dir.rmdir ($live_mount)
                                                    puts "synchronizing..."
                                                    `sync`
                                                end
                                                Qt::Application.instance.quit }
    self.show
  end
 
 
  def browse_iso()
    if @ui.comboBox.currentText()
        @ui.lineEdit.setText ""
        iso_link = Qt::FileDialog.getOpenFileName(self, tr("Choose an iso..."), Dir.home, "ISO (*.iso)")
        if iso_link
            @ui.lineEdit.insert "#{iso_link}"
            puts iso_link
        else
            puts "No iso choosen."
        end
    else
    puts "No USB found (Step 1)."
    Qt::MessageBox.critical self, "No USB.", "No USB found (Step 1)."
    end
  end
    
    def create_mbusb()
        if @ui.comboBox.currentText()
            selected_usb = @ui.comboBox.currentText()[0,9]
            if not @ui.lineEdit.text() == ""
                iso_link = @ui.lineEdit.text()
                $selected_iso = iso_link.chomp
                p $selected_iso
                $distro = File.basename($selected_iso)
                $distro_dir = File.basename($selected_iso, ".iso")
                @ui.lineEdit.setText ""
                mount_iso = `echo "#{$pass}" | sudo -S mount -o loop "#{$selected_iso}" "#{$live_mount}"` 
                puts mount_iso
                #$detect_distro = detect_distro($live_mount)
                $distro_name = detect_distro($live_mount)
                if $distro_name
                    puts $distro_name
                        $isosize = sizeiso(iso=$selected_iso)
                        puts "ISO size is : #{$isosize}"
                        usb_avl_space = freespace(device=$selected_usb_device)
                        puts "Available USB size is : #{usb_avl_space}"
                        if not usb_avl_space > $isosize
                            puts "Not enough space on #$selected_usb_device"
                            Qt::MessageBox.critical self, "No space.", "Not enough space on #$selected_usb_device"
                        else
                            puts "Enough space is available on #$selected_usb_device"
                            reply = Qt::MessageBox.question(self, tr("Review selection..."),
                                        "Selected USB disk:: #{$selected_usb_device}\n" +
                                       "USB mount point:: #{$selected_usb_mount_path}\n" +
                                       "Selected distro:: #{$distro}\n\n" +
                                       "Would you like to install the selected distro?",
                                       Qt::MessageBox::Yes,
                                       Qt::MessageBox::No )
                            if reply == Qt::MessageBox::Yes
                                add_distro()
#                               puts distro_name
                                puts $distro_install_path
                                if $syslinux_required == "yes"
                                    install_syslinux_common ($selected_usb_device)
                                end
                            elsif reply == Qt::MessageBox::No
                                puts "unmounting #{$live_mount}"
                                `echo "#{$pass}" | sudo -S umount "#{$live_mount}"`
                            end
                        end
                    else
                        puts  "#{$distro} is not supported at the moment."
                        Qt::MessageBox.information self, "Not supported.", "Sorry. #{$distro} is not supported at the moment."
                    end
            else
                puts "Please select an iso file (step 2)."
                Qt::MessageBox.critical self, "No iso.", "Please select an iso file (step 2)."
            end
        else
        puts "No USB found (Step 1)."
        Qt::MessageBox.critical self, "No USB.", "No USB found (Step 1)."
        end
    end

    def pass_ui
        $text = Qt::InputDialog.getText self, "Password","Enter user password",Qt::LineEdit::Password
 
        if !$text 
            puts "Nothing entered."
            exit 0
        end

        if $text != nil 
            $pass = $text.strip
            if not $pass.empty?
                sudo = `echo "#{$pass}" | sudo -k -S id -u`
                if sudo.chomp.eql? '0'
                    puts "User password success."
                else
                    puts "Incorrect user password."
                    Qt::MessageBox.critical self, "Incorrect.", "User password is incorrect. Enter correct password."
                    load 'main.rb'
                    exit
                end
            end
        end
    end

    def get_usb_details()
        if @ui.comboBox.currentText()
            if $Os == "Linux"
                selected_usb_part = @ui.comboBox.currentText()[5,4]
                puts selected_usb_part
                bus = DBus::SystemBus.instance
                udisk_service = bus.service("org.freedesktop.UDisks")
                udisk_udisk = udisk_service.object("/org/freedesktop/UDisks/devices/#{selected_usb_part}")
                udisk_udisk.introspect
                udisk_udisk_i = udisk_udisk["org.freedesktop.UDisks.Device"]
                $selected_usb_device = "#{udisk_udisk_i["DeviceFile"]}"
                @ui.usb_dev.text = "Device :: #{$selected_usb_device}"
                puts "Selected usb device: " + $selected_usb_device
                $selected_usb_mount_status = "#{udisk_udisk_i["DeviceIsMounted"]}"
                puts "Selected usb mount status: " + $selected_usb_mount_status
#               $selected_usb_mount_path = "#{udisk_udisk_i["DeviceMountPaths"]}"[1...-1]
                $selected_usb_mount_path = "#{udisk_udisk_i["DeviceMountPaths"][0]}"
                @ui.usb_mount.text = "Mount :: #{$selected_usb_mount_path}"                             
                puts "Selected usb mount path: " + $selected_usb_mount_path
                $selected_usb_uuid = "#{udisk_udisk_i["IdUuid"]}"
                #@ui.usb_size_avl.text = "UUID :: #{$selected_usb_uuid}"
                puts "Selected usb uuid: " + $selected_usb_uuid
                $selected_usb_label = "#{udisk_udisk_i["IdLabel"]}"
                @ui.usb_label.text = "Label :: #{$selected_usb_label}"              
                puts "Selected usb label: " + $selected_usb_label
                $selected_usb_size = "#{udisk_udisk_i["PartitionSize"]}"
                puts $selected_usb_size
                @ui.usb_size_avl.text = "Size :: #{$selected_usb_size}"
                $selected_usb_file_system = "#{udisk_udisk_i["IdType"]}"
                @ui.usb_size_ttl.text = "Filesystem :: #{$selected_usb_file_system}"
                puts "Selected usb filesystem: " + $selected_usb_file_system
            elsif $Os == "Windows"
                # Code for windows to be put here.
            else
            puts "No USB found (Step 1)."
            end
        end
    end
    def add_distro()
		if $selected_distro == "windows-7"
			$distro_install_path = "windows-7"
		else
        $distro_install_path = $selected_usb_mount_path + "/multibootusb/" + $distro_dir
        end
        if not File.exist?($selected_usb_mount_path + "/multibootusb/syslinux.cfg")
            $syslinux_required = "yes"
            puts "Copying multibootusb directory."
            FileUtils.cp_r ("./multibootusb"), $selected_usb_mount_path
        end

        if File.directory? ($distro_install_path)
            puts "Distro install directory already exist."
            Qt::MessageBox.information self, "Distro exist.", "#{$distro} is already installed."
        else
            puts "Creating distro install path."
            Dir.mkdir($distro_install_path)
            puts "Copying #$distro files to #{$distro_install_path}"
#           FileUtils.cp_r ("#{$live_mount}" + "/."), $distro_install_path
            if $distro_name == "opensuse"
                copy($selected_iso, $distro_install_path + "/")
                copy("#{$live_mount}/boot", $distro_install_path)
            elsif $distro_name == "slackel"
                copy($selected_iso, $distro_install_path + "/")
                copy("#{$live_mount}/boot", $distro_install_path)
			elsif $distro_name == "salixlive"
                copy($selected_iso, $distro_install_path + "/")
                copy("#{$live_mount}/boot", $distro_install_path)
            elsif $distro_name == "windows-7"
				copy("#{$live_mount}", $selected_usb_mount_path)
            else
                copy("#{$live_mount}", $distro_install_path)
            end
                puts "File copy finished."
                puts "unmounting " + $live_mount
                update_cfg()
                if not $cfg_file_path == nil
                    update_config($distro_name,$distro_install_path + "/")
                end
                Qt::MessageBox.information self, "Copy...", $distro + " is successfully installed"          
                umount_iso = `echo "#{$pass}" | sudo -S umount "#{$live_mount}"`
        end 
    end
    
      def update_combobox()
      get_usb_details()
      update_list_box()
      end

    def freespace(device=".")
      lines = %x(df -k "#{device}").split("\n")
      n = lines.last.split[3].to_i #* 1024
    end
    def totalspace(device=".")
      lines = %x(df -k "#{device}").split("\n")
      n = lines.last.split[1].to_i #* 1024
    end
    def sizeiso(iso=".")
      line = %x(du -k "#{iso}")#.split("\n")
      n = line.split.first.to_i #* 1024
    end

    def update_cfg()
        $cfg_file_path = Dir.glob( $distro_install_path + "/**/*isolinux.cfg" )[0]
        if $cfg_file_path == nil
        $cfg_file_path = Dir.glob( $distro_install_path + "/**/*syslinux.cfg" )[0]
        end
        if not $cfg_file_path == nil
            $cfg_file_path.slice! $selected_usb_mount_path
            puts $cfg_file_path
            $cfg_file_path_dir = File.dirname($cfg_file_path)
            puts $cfg_file_path_dir
        #FileUtils.cp_r Dir.glob('./multibootusb/*.c32'), $selected_usb_mount_path + $cfg_file_path_dir
			puts "Checking isolinux version..."
            $isolinux_bin = Dir.glob( $distro_install_path + "/**/*isolinux.bin" )[0]
			$isolinux_bin_path = File.dirname($isolinux_bin)
			version = `cat #{$isolinux_bin} | grep -a -i "isolinux 3"`
				if version.downcase.include? ("isolinux 3")
					puts "Found older version of isolinux (3))"
					puts "Copying necessary com files..."
            		copy_com_file = `cp -rvf ./multibootusb/*.c32 #{$isolinux_bin_path}`
            		puts copy_com_file
            	else
            		puts "Found latest version of isolinux"
				end
            $line1 = "#start " + $distro_dir
            $line2 = "LABEL " + $distro_dir
            $line3 = "MENU LABEL " + $distro_dir
            $line4 = "CONFIG " + $cfg_file_path
            $line5 = "APPEND " + $cfg_file_path_dir
            $line6 = "#end " + $distro_dir
        else
            #custom_menu()
            custom_menu($distro_name)
        end
            File.open($selected_usb_mount_path + "/multibootusb/syslinux.cfg", 'a') do |file|
            file.puts $line1
            file.puts $line2
            file.puts $line3
            file.puts $line4
            file.puts $line5
            file.puts $line6
            #end
        end
    update_list_box()
    end

    def update_list_box()
        if not $deviceFile
            Qt::MessageBox.information self, "No USB.", "No USB found. Please insert USB and rerun multibootusb."
            Qt::Application.instance.quit
            abort
        else
            @ui.listWidget.clear()
            sys_cfg = $selected_usb_mount_path + "/multibootusb/syslinux.cfg"
            if File.exists?(sys_cfg) 
                File.readlines(sys_cfg).each do |line|
                if (line['#start'])
                installed_distro = line.split(' ')[1..-1].join(' ')
                @ui.listWidget.addItem installed_distro
                end
                end
            end
        end
    end 

end


if $0 == __FILE__
  a = Qt::Application.new(ARGV)
  MainForm.new
  a.exec
end

