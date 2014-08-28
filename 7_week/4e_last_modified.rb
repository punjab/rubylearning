#!/usr/bin/env ruby -wKU
=begin
  Name: 4e_last_modified.rb
  Description: Last modified time
  Author: Arvinder Kang
  Date: 2014-08-28
  Licensed under the MIT license
=end

def last_modified(file)
  seconds_diff = Time.now.to_i - File.new(file).mtime.to_i
  days_diff = seconds_diff / (60 * 60 * 24.0)
  "#{file} was last modified #{days_diff} days ago"
end

puts last_modified('0_yahoo_stocks.rb')
