#!/usr/bin/env ruby

def install_syslinux_common (dev)
	if dev
		if $syslinux_required == "yes"
			if $selected_usb_file_system = "vfat" || "ntfs"
				puts "Installing syslinux..."
				syslinux_install = `echo #{$pass} | sudo -S syslinux -i -d /multibootusb #{$selected_usb_device}`
				puts syslinux_install
				#$?
				install_mbr = `echo #{$pass} | sudo -S dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/mbr.bin of=#{$selected_usb_device[0..-2]}` 
				puts install_mbr
			elsif $selected_usb_file_system = "ext2" || "ext3" || "ext4" || "btrf"
				puts "Installing syslinux..."
				syslinux_install = `echo #{$pass} | sudo -S syslinux -i -d /multibootusb #{$selected_usb_device}`
				puts syslinux_install
				#$?
				install_mbr = `echo #{$pass} | sudo -S dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/mbr.bin of=#{$selected_usb_device[0..-2]}`
			end
		end
	end
end

def install_syslinux ()
	if @ui.install_sys_all.isChecked()
		if $selected_usb_file_system = "vfat" || "ntfs"
			puts "Installing syslinux..."
			syslinux_install = `echo #{$pass} | sudo -S syslinux -i -d /multibootusb #{$selected_usb_device}`
			puts syslinux_install
			#$?
			install_mbr = `echo #{$pass} | sudo -S dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/mbr.bin of=#{$selected_usb_device[0..-2]}` 
			puts install_mbr
			puts "Copying multibootusb directory."
			FileUtils.cp_r ("./multibootusb"), $selected_usb_mount_path
		elsif $selected_usb_file_system = "ext2" || "ext3" || "ext4" || "btrf"
			puts "Installing syslinux..."
			syslinux_install = `echo #{$pass} | sudo -S syslinux -i -d /multibootusb #{$selected_usb_device}`
			puts syslinux_install
			#$?
			install_mbr = `echo #{$pass} | sudo -S dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/mbr.bin of=#{$selected_usb_device[0..-2]}`
		end
	elsif @ui.install_sys_only.isChecked()
		if $selected_usb_file_system = "vfat" || "ntfs"
			puts "Installing syslinux..."
			syslinux_install = `echo #{$pass} | sudo -S syslinux -i -d /multibootusb #{$selected_usb_device}`
			puts syslinux_install
			#$?
			install_mbr = `echo #{$pass} | sudo -S dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/mbr.bin of=#{$selected_usb_device[0..-2]}` 
			puts install_mbr
		elsif $selected_usb_file_system = "ext2" || "ext3" || "ext4" || "btrf"
			syslinux_install = `echo #{$pass} | sudo -S syslinux -i -d /multibootusb #{$selected_usb_device}`
			puts syslinux_install
			#$?
			install_mbr = `echo #{$pass} | sudo -S dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/mbr.bin of=#{$selected_usb_device[0..-2]}`
		end
	else
		Qt::MessageBox.information self, "No select.", "Please select an option to install syslinux."
	end
end

def edit_syslinux()
	if File.exist?($selected_usb_mount_path + "/multibootusb/syslinux.cfg")
		editors = ["gedit","kate", "kwrite", "leafpad", "jedit"]
		editors.each do |s|
		package = `which #{s}`
		if package.include? (s)
			puts package
			syslinux_link = package.chomp + " " + $selected_usb_mount_path + "/multibootusb/syslinux.cfg"
			puts syslinux_link
			`#{syslinux_link}`
			break
		end
		end
	else
		Qt::MessageBox.information self, "No file.", "syslinux.cfg file is not found under multibootusb directory."
	end
end	

