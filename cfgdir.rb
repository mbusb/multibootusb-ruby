#!/usr/bin/ruby


def syslinux_cfg_file(mount)

  dir = ["syslinux", "isolinux"]

  file = ["syslinux.cfg", "isolinux.cfg"]


  l2 = dir.map { |d| file.map { |f| "boot/#{d}/#{f}" } }.flatten

  l1 = dir.map { |d| file.map { |f| "#{d}/#{f}" } }.flatten

  l0 = file


  (l2 + l1 + l0).each { |f| return(f) if File.exists?("#{mount}/#{f}") }

  return nil

end
