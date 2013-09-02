#!/usr/bin/env ruby

def copy(src,dst)
	space_initial_i = `df -k #{$selected_usb_device}`.split(/\b/)[22].to_i
	size_iso = `du -k #{$selected_iso}`.split[0].to_i
	$isosize
	if File.file?(src)
		thr_copy = Thread.new  {`cp -rvvf #{src} #{dst}/`}
	elsif File.directory?(src)
		thr_copy = Thread.new  {`cp -rf #{src}/. #{dst}/`}
	end
	@ui.label.text = "Installing..."
		while thr_copy.status
			space_current_i = `df -k #{$selected_usb_device}`.split(/\b/)[22].to_i
			diff = space_current_i - space_initial_i
			persentage = (100.0 * diff / size_iso).round(2)
			#puts persentage
			@ui.progressBar.value = persentage
			#print "\rcopying #{src} to #{dst} ... #{format("%5.1f%%", 100.0 * dst_size / src_size)}"
			sleep 0.5
		end
		puts "100"
		@ui.progressBar.value = 0
		@ui.label.text = ""
end
#copy(src,dst)
