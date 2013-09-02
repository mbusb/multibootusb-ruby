#!/usr/bin/ruby
require 'fileutils'
require 'find'

def uninstall_distro() 
	if @ui.listWidget.currentItem()
   		$selected_distro = @ui.listWidget.currentItem().text()
		reply = Qt::MessageBox.question(self, tr("Review selection..."),
                                       "Are you sure to uninstall #{$selected_distro}",
                                       Qt::MessageBox::Yes,
                                       Qt::MessageBox::No )
        if reply == Qt::MessageBox::Yes
			puts $selected_distro
			puts $selected_usb_mount_path + "/multibootusb/" + $selected_distro
			@ui.label.text = "Uninsalling..."
			if not File.directory?($selected_usb_mount_path + "/multibootusb/" + $selected_distro) 
				gsub_paragraph(:file_in => $selected_usb_mount_path + "/multibootusb/syslinux.cfg", :pattern_start => '#start ' + $selected_distro, :pattern_stop => '#end ' + $selected_distro)
				update_list_box()
			elsif File.directory?($selected_usb_mount_path + "/multibootusb/" + $selected_distro) 
				if $selected_distro == "windows-7"
					size_folder = `du -ck #{$selected_usb_mount_path}/sources | grep total`.split[0].to_i
					`rm -rf #{$selected_usb_mount_path}/[boot]`
					`rm -rf #{$selected_usb_mount_path}/boot`
					`rm -rf #{$selected_usb_mount_path}/efi`
					`rm -rf #{$selected_usb_mount_path}/support`
					`rm -rf #{$selected_usb_mount_path}/upgrade`
					`rm -rf #{$selected_usb_mount_path}/autorun.inf`
					`rm -rf #{$selected_usb_mount_path}/bootmgr`
					`rm -rf #{$selected_usb_mount_path}/readme.txt`
					`rm -rf #{$selected_usb_mount_path}/setup.exe`
					thr_remove = Thread.new {`rm -rf #{$selected_usb_mount_path}/sources`}
				else
					size_folder = `du -ck #{$selected_usb_mount_path}/multibootusb/#{$selected_distro} | grep total`.split[0].to_i
					thr_remove = Thread.new {`rm -rf #{$selected_usb_mount_path}/multibootusb/#{$selected_distro}`}
				end
				space_initial_i = `df -k #{$selected_usb_device}`.split(/\b/)[22].to_i
			while thr_remove.status
					space_current_i = `df -k #{$selected_usb_device}`.split(/\b/)[22].to_i
					diff = space_initial_i - space_current_i
					persentage = (100.0 * diff / size_folder).round(2)
					#puts persentage
					@ui.progressBar.value = persentage
				sleep 0.5
			end
			#puts "100"
			@ui.progressBar.value = 100
			@ui.progressBar.value = 0
			@ui.label.text = "Updating syslinux.cfg."
			gsub_paragraph(:file_in => $selected_usb_mount_path + "/multibootusb/syslinux.cfg", :pattern_start => '#start ' + $selected_distro, :pattern_stop => '#end ' + $selected_distro)
			update_list_box()
			end
			@ui.label.text = ""			
			Qt::MessageBox.information self, "Finished...", "#{$selected_distro} has been uninstalled successfully."
			
        elsif reply == Qt::MessageBox::No
        puts "No selected."
        end
	else
		puts "Please choose a distro from the list."
		Qt::MessageBox.information self, "No distro selection.", "Please choose a distro from the list."
	end
	
end

def gsub_paragraph(options)
	regex_start = /^.*#{options[:pattern_start]}.*$/
  	regex_stop = /^.*#{options[:pattern_stop]}.*$/

	f_read = File.new(options[:file_in], 'r')
  	true until (line_pattern = regex_start.match(f_read.gets))
  	pos_start = f_read.pos - line_pattern[0].length - 1
  	f_read.rewind
  	part_start = f_read.read(pos_start)

  	true until (line_pattern = regex_stop.match(f_read.gets))
  	pos_stop = f_read.pos
  	part_stop = f_read.read(pos_stop)
  	f_read.close

  	f_write = File.new((options[:file_out] || options[:file_in]), 'w+')
  	replacement = options[:replacement] || ''
	if part_stop.nil?
  		f_write.puts part_start + replacement #+ part_stop
  	else
    	f_write.puts part_start + replacement + part_stop
    end
  	f_write.close
end
#gsub_paragraph(:file_in => $selected_usb_mount_path + "/multibootusb/syslinux.cfg", :pattern_start => '#start ' + $selected_distro, :pattern_stop => '#end ' + $selected_distro)
