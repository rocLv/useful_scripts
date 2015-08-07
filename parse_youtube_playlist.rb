#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'

ARGV.each { |arg| puts arg }

url = ARGV[0]

doc = Nokogiri::HTML(open(url))

fp = File.open(ARGV[1], 'a+')

doc.css('#pl-video-table tr').each do |e|
  fp.puts "#{ e['data-video-id'] }, #{ e['data-title'] }"
end

fp.close

