#!/usr/bin/env ruby
require 'yaml'

regexp = %r{<font face="Arial, Helvetica, sans-serif" size="-1">([^:]*):</font></b></td><td (?:[^<]*)>\s+([^<]*)</td>}mi

all_files = Dir.glob('scrape_sample/*')
all_files.each do  |filename|
  f = File.read(filename)
  if (matches = f.scan regexp) 
    artwork = {}
    matches.each {|m|
      field,value = m[0],m[1]
      clean_field_name = field.downcase.gsub(" ","_")
      artwork[clean_field_name] = value
    }
    File.open("scrape_parse1/"+artwork["unique_id"]+".yaml","w") do |out|
      out << artwork.to_yaml
    end
  end
end
