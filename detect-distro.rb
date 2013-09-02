#!/usr/bin/ruby

##### IDENTIFY DISTRIBUTION ISO #####
#
# WRITTEN BY IAN BRUCE FOR MULTIBOOTUSB
# LICENCE - GPL
#
# $1 is directory to operate on (optional)

require "find"


#if cfg = ARGV[0]

 # File.directory?(cfg) &&

  #  Dir.chdir(cfg) ||

   #   exit(false)

#end

$DISTRONAMES = {
"pmagic" => "parted-magic",
"partedmagic" => "parted-magic",
"puppy" => "puppy",
"ipcop" => "ipcop",
"archisolabel" => "arch",
"chakraisolabel" => "chakra",
"misolabel" => "arch",
"boot=live" => "debian",
"root=live:" => "fedora",
"root=mgalive:" => "magia",
"redhat" => "redhat",
"suse" => "suse",
"opensuse" => "opensuse",
"slitaz" => "slitaz",
"ophcrack" => "slitaz",
"systemrescuecd" => "systemrescuecd",
"tinycore" => "slitaz",
"xpud" => "slitaz",
"rescue.cpi" => "slitaz",
"untangle" => "slitaz",
"boot=casper" => "ubuntu",
"slax" => "slax",
"porteus" => "porteus",
"wifislax" => "wifislax",
"antix" => "antix",
"livecd=livecd" => "pclinuxos",
"looptype=squashfs" => "gentoo",
"knoppix" => "knoppix",
"finnix" => "finnix",
"sms" => "sms",
"wifiway" => "wifiway",
"unity" => "pclinuxos",
"slack" => "slack",
"salix" => "slackel",
"4mlinux" => "slitaz",
"partition wizard" => "slitaz",
"riplinux" => "slitaz",
"vector" => "sms",
"autoexec" => "sms",
"lebel dummy" => "slitaz"
}

def detect_distro(cfg)
#match = $DISTRONAMES.each_key.reduce { |m, s| "#{m}|#{Regexp.escape(s)}" }
match = $DISTRONAMES.each_key.reduce { |m, s| "#{m}|#{Regexp.escape(s)}" }

regex = Regexp.new(match, true)

count = {}


#Find.find(".") { |name|
Find.find($live_mount) { |name|

  Find.prune if name =~ /\/boot\/grub$/i

  if name =~ /\.cfg$/i

    config = open(name, "r") { |file| 
    if File.file?(file)
    file.read 
    end
    }

	if config

    config.scan(regex) { |key|

      key.downcase!
	
      if count[key]
        count[key] += 1
      else
        count[key] = 1
      end

    }
    end

  end

}


#puts count

if max = count.max { |x, y| x[1] <=> y[1] }

  puts $DISTRONAMES[max[0]]
  return $DISTRONAMES[max[0]]

else
        if File.directory?("#{$live_mount}/slackellive") 
                puts "slackel"
                return "slackel"
        elsif File.directory?("#{$live_mount}/salixlive") 
                puts "salixlive"
                return "salixlive"
        elsif File.exist?("#{$live_mount}/sources/boot.wim")
				puts "windows-7"
				return "windows-7"
        else
                puts "ISO not supported."
                return nil
        end

end
end
#detect_distro("/home/sundar/.multibootusb/live/")
