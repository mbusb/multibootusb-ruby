#!/usr/bin/env ruby

def qemu_iso()
		package = ["kvm","qemu-system-x86_64"]
		package.each do |s|
		qemu = ` which #{s}`
			if not qemu.include? (qemu)
				puts "QEMU is not installed."
				Qt::MessageBox.information self, "No qemu.", "Please install qemu to avail this feature."
			else
			if not @ui.lineEdit_2.text() == ""
				iso_link = @ui.lineEdit_2.text()
				$selected_qemu_iso = iso_link.chomp
				puts $selected_qemu_iso
				@ui.lineEdit_2.setText ""
					if @ui.ram_iso_256.isChecked()
						ram = "256"
					elsif @ui.ram_iso_512.isChecked()
						ram = "512"
					elsif @ui.ram_iso_768.isChecked()
						ram = "768"
					elsif @ui.ram_iso_1024.isChecked()
						ram = "1024"
					elsif @ui.ram_iso_2048.isChecked()
						ram = "2048"
					end
					if ram
						thr_qemu = Thread.new  {`#{qemu} -no-acpi -boot d -m #{ram} -cdrom #{$selected_qemu_iso}`}
					else
						Qt::MessageBox.information self, "No RAM.", "Please select desired RAM."
						@ui.lineEdit_2.insert "#{iso_link}"
					end
			else
				puts "No iso choosen."
				Qt::MessageBox.information self, "No iso.", "Please select an iso."
			end
			break
			end
		end
end	

def qemu_usb()
		package = ["kvm","qemu-system-x86_64"]
		package.each do |s|
		qemu = ` which #{s}`
			if not qemu.include? (qemu)
				puts "QEMU is not installed."
				Qt::MessageBox.information self, "No qemu.", "Please install qemu to avail this feature."
			else
				if @ui.ram_usb_256.isChecked()
					ram = "256"
				elsif @ui.ram_usb_512.isChecked()
					ram = "512"
				elsif @ui.ram_usb_768.isChecked()
					ram = "768"
				elsif @ui.ram_usb_1024.isChecked()
					ram = "1024"
				elsif @ui.ram_usb_2048.isChecked()
					ram = "2048"
				end
				if ram
					device = $selected_usb_device[0..-2]
					puts device
					thr_qemu = Thread.new  {`echo #{$pass} | sudo -S qemu-system-x86_64 -no-acpi -boot c -hda #{device} -m #{ram}`}
				else
					Qt::MessageBox.information self, "No RAM.", "Please select desired RAM."
				end
			break
			end
		end
			
end	

def get_qemu_iso()
	$qemu_iso_link = Qt::FileDialog.getOpenFileName(self, tr("Choose an iso..."), Dir.home, "ISO (*.iso)")
	if $qemu_iso_link
		@ui.lineEdit_2.insert "#{$qemu_iso_link}"
		#puts $qemu_iso_link
		else
		puts "No iso choosen."
		Qt::MessageBox.information self, "No iso.", "Please choose an iso."
	end
end
	
