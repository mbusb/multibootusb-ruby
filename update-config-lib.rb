#!/usr/bin/ruby

# Syslinux update script for MultiBootUSB
#
# written by Ian Bruce
# GPL licence
#
# parameters:
#
# $1 - distribution type/name
#
# $2 - input file, or STDIO
#
# $3 - output file, or same as input
#
# $LOADER_PREFIX (must not begin with "/")
#
# $KERNEL_PREFIX
#
# $USB_UUID
#
# $ISO_IMAGE


def update(config)

  v = [] ; i = 0

  while i = config.index(/^ *label/i, i)
    v += [i]
    i += 1
  end

  offset = 0 ; conflen = config.length

  v.each_index { |x|

    i = v[x] + offset

    j = (x+1 < v.size ? v[x+1] : conflen) + offset

    item = config[i...j] ; itemlen = item.length

    kernel = item[/^[ \t]*(kernel|linux)[ \t]+(.*?)[ \t]*$/i, 2]

    initrd = item[/^[ \t]*(initrd)[ \t]+(.*?)[ \t]*$/i, 2]

    option = item[/^[ \t]*(append)[ \t]+(.*?)[ \t]*$/i, 2]

      
    if ! initrd && option && (initrd = option[/(^|[ \t])initrd=(.*?)([ \t]|$)/i, 2])

      item.insert(item.index(/^[ \t]*append[ \t]/i), "#{item[/^([ \t]*)append[ \t]/i, 1]}initrd \n")

      option.sub!(/[ \t]initrd=.*?[ \t]/i, " ") ; option.sub!(/(^|[ \t])initrd=.*?([ \t]|$)/i, "")

    end


    yield [kernel, initrd, option]


    item.sub!(/^([ \t]*(kernel|linux)[ \t]+).*$/i, "\\1#{kernel}")

    item.sub!(/^([ \t]*(initrd)[ \t]+).*$/i, "\\1#{initrd}")

    item.sub!(/^([ \t]*(append)[ \t]+).*$/i, "\\1#{option}")

    config[i...j] = item

    offset += item.length - itemlen

  }

end


def mkbootopts(distro)

  case distro
# ISO image files

  when "ubuntu-iso"

    ->(option) { option.sub!(/^/, "iso-scan/filename=#{$ISO_IMAGE} ") }

  when "debian-iso"

    ->(option) { option.sub!(/^/, "fromiso=#{$ISO_IMAGE} " ) }

  when "fedora-iso"

    ->(option) { option.sub!(/^/, "root=live:#{$ISO_IMAGE} ") }

  when "systemrescuecd-iso"

    ->(option) { option.sub!(/^/, "isoloop=#{$ISO_IMAGE} ") }

# unpacked ISO filesystems

  when "parted-magic"

    ->(option) {
      option.sub!(/^/, "directory=#{$KERNEL_PREFIX}/ ")
     }
     
   when "ipcop"

    ->(option) {
      option.sub!(/ipcopboot=cdrom\S*/, "ipcopboot=usb") 

     }

  when "fedora"

    ->(option) {
      option.sub!(/root=\S*/, "root=UUID=#{$USB_UUID}")
      option.sub!(/^/, "live_dir=#{$KERNEL_PREFIX}/LiveOS ")
    }
    
    when "magia"

    ->(option) {
      option.sub!(/root=\S*/, "root=UUID=#{$USB_UUID}")
      option.sub!(/^/, "live_dir=#{$KERNEL_PREFIX}/loopbacks ")
    }
    

  when "systemrescuecd"

    ->(option) { option.sub!(/^/, "subdir=#{$KERNEL_PREFIX}/ ") }

  when "arch"

    ->(option) {
      option.sub!(/(arch|chakra|m)isolabel=\S*/, "\\1isodevice=/dev/disk/by-uuid/#{$USB_UUID}")
      option.sub!(/(arch|chakra)isobasedir=\S*/, "\\1isobasedir=#{$KERNEL_PREFIX}/\\1")
      option.sub!(/(m)isobasedir=\S*/, "\\1isobasedir=#{$KERNEL_PREFIX}/manjaro")
    }
    
  when "chakra"
    
	->(option) {
      option.sub!(/(arch|chakra|m)isolabel=\S*/, "\\1isodevice=/dev/disk/by-uuid/#{$USB_UUID}")
      option.sub!(/(arch|chakra)isobasedir=\S*/, "\\1isobasedir=#{$KERNEL_PREFIX}/\\1")
      option.sub!(/(m)isobasedir=\S*/, "\\1isobasedir=#{$KERNEL_PREFIX}/manjaro")
	  option.sub!(/^/, "chakraisobasedir=#{$KERNEL_PREFIX}/chakra ")
    }
	  
  when "porteus"

    ->(option) { option.sub!(/^/, "from=#{$KERNEL_PREFIX}/ fromusb ") }
  
  when "puppy"

    ->(option) { 
			option.sub!(/^/, "psubdir=#{$KERNEL_PREFIX}/ ")
			option.sub!(/pmedia=cd\S*/, "pmedia=usbflash") 
			}

  when "slax"

    ->(option) { option.sub!(/^/, "from=#{$KERNEL_PREFIX}/slax fromusb ") }

  when "wifislax"

    ->(option) { option.sub!(/^/, "from=#{$KERNEL_PREFIX}/Wifislax fromusb ") }

  when "wifiway"

    ->(option) { option.sub!(/^/, "from=#{$KERNEL_PREFIX}/wifiway fromusb ") }

  when "sl-live"

    ->(option) {
      option.sub!(/^/, "sgnfile=#{$KERNEL_PREFIX}/livecd.sgn from=#{$KERNEL_PREFIX}/ fromusb ")
    }

  when "slampp"

    ->(option) { option.sub!(/^/, "slax from=#{$KERNEL_PREFIX}/ fromusb ") }

  when "antix"

    ->(option) { option.sub!(/^/, "image_dir=#{$KERNEL_PREFIX}/antiX ") }

  when "pclinuxos"

    ->(option) {
     option.sub!(/^/, "fromusb ")
    }

  when "gentoo"

    ->(option) {
      option.sub!(/cdroot_type\S*/, "")
      option.sub!(/^/, "subdir=#{$KERNEL_PREFIX} ")
    }

  when "knoppix"

    ->(option) { option.sub!(/^/, "knoppix_dir=#{$KERNEL_PREFIX}/KNOPPIX ") }

  when "finnix"

    ->(option) { option.sub!(/^/, "finnix_dir=#{$KERNEL_PREFIX}/finnix ") }

  when "debian"

    ->(option) { option.sub!(/^/, "ignore_bootid live-media-path=#{$KERNEL_PREFIX}/live ") }

  when "slitaz"

    ->(option) { }

  when "sms"

    ->(option) { option.sub!(/^/, "from=#{$KERNEL_PREFIX}/ fromusb ") }
    
  when "opensuse"
  
	->(option) { option.sub!(/^/, "loader=syslinux isofrom=/dev/disk/by-uuid/#{$USB_UUID}:/#{$ISO_IMAGE} ") }
      
  when "ubuntu"

    ->(option) {
      option.sub!(/file=\/cdrom\//, "file=/cdrom/#{$KERNEL_PREFIX.sub(/^\//, "")}/")
      option.sub!(/^/,
                  "cdrom-detect/try-usb=true floppy.allowed_drive_mask=0 " +
                  "ignore_uuid ignore_bootid root=UUID=#{$USB_UUID} " +
                  "live-media-path=#{$KERNEL_PREFIX}/casper ")
    }

  else

    ->(option) { }

  end

end



def syslinuxconfig(distro, input, output)

#output = input

bootopts = mkbootopts(distro)

config = ""

if input == "-"
  $stdin.read(nil, config)
else
	if File.file?(input)
		open(input, "r") { |f| f.read(nil, config) }
	end
end


update(config) { |kernel, initrd, option|

#  puts "'#{kernel}'\n'#{initrd}'\n'#{option}'\n\n"

  #kernel.gsub!(/(^|,)\//, "\\1#{$LOADER_PREFIX}/") if kernel
  if kernel
	#kernel.gsub!(/(^|,)\//, "\\1#{$LOADER_PREFIX}/")
	#initrd.gsub!(/(^|,)\//, "\\1#{$LOADER_PREFIX}/") if initrd
	initrd.gsub!(/(,)\//, "\\1#{$LOADER_PREFIX}/") if initrd
    bootopts[option] if option
  end

#  initrd.gsub!(/(^|,)\//, "\\1#{$LOADER_PREFIX}/") if initrd

 # bootopts[option] if option

}

config.gsub!(/([ \t])\//, "\\1#{$LOADER_PREFIX}/")


if output == "-"
  $stdout.write(config)
else
	if File.file?(output)
		open(output, "w") { |f| f.write(config) }
	end
end

end
