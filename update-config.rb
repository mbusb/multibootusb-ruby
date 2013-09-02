#!/usr/bin/env ruby

require_relative "update-config-lib"

def update_config(distro,install_dir)
	#$LOADER_PREFIX = [".", "..", "../.."][syslinux_cfg_file($live_mount).count("/")]
	#puts "Load Prefix :: " + $LOADER_PREFIX
	$LOADER_PREFIX = "/multibootusb/#{$distro_dir}"
	$KERNEL_PREFIX = "/multibootusb/#{$distro_dir}"
	$USB_UUID = $selected_usb_uuid
	$ISO_IMAGE = $distro
	$PERSIST = ENV["PERSIST"]
	if not distro.to_s == '' and File.directory? install_dir # and 
		@ui.label.text = "Updating config files..."
		Dir[install_dir + "/**/*.cfg"].each { |file| syslinuxconfig(distro, file, file) }
		@ui.label.text = ""
	 end
end

def custom_menu(distro)
	case distro
	when "slackel"
		$line1 = "#start " + $distro_dir
		$line2 = "LABEL " + $distro_dir
		$line3 = "MENU LABEL " + $distro_dir
		$line4 = "kernel /multibootusb/#{$distro_dir}/vmlinuz"
  		$line5 = "initrd /multibootusb/#{$distro_dir}/initrd.xz root=/dev/ram0 rw quiet max_loop=20 fromiso=/multibootusb/#{$distro_dir}/#{$distro} autologin"
		$line6 = "#end " + $distro_dir
	when "salixlive"
		$line1 = "#start " + $distro_dir
		$line2 = "LABEL " + $distro_dir
		$line3 = "MENU LABEL " + $distro_dir
		$line4 = "kernel /multibootusb/#{$distro_dir}/vmlinuz"
  		$line5 = "initrd /multibootusb/#{$distro_dir}/initrd.xz root=/dev/ram0 rw quiet max_loop=20 fromiso=/multibootusb/#{$distro_dir}/#{$distro} autologin"
		$line6 = "#end " + $distro_dir
	when "windows-7"
		$line1 = "#start " + $distro_name
		$line2 = "LABEL " + $distro_name
		$line3 = "MENU LABEL " + $distro_name
		$line4 = "KERNEL chain.c32 hd0 1 ntldr=/bootmgr"
		$line6 = "#end " + $distro_name
	end
end

