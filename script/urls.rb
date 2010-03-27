#!/usr/bin/env ruby

regexp = /.*HREF='([^']*)'.*/

while (line = gets) 
    if (match = line.match regexp)
        puts "http://www.visitukheritage.gov.uk"+match[1]
    end
end 