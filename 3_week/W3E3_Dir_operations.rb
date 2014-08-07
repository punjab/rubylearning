#!/usr/bin/env ruby -wKU
=begin
  Name: W2E3_Dir_operations.rb
  Description: Make use of class Dir
  Author: Arvinder Kang
  Date: 2014-07-25
  Licensed under the MIT license
=end

puts orignal_directory = Dir.pwd
filename = 'tmp'
Dir.mkdir(filename) unless Dir.exist?(filename)
Dir.chdir(filename)
puts Dir.pwd
Dir.chdir(orignal_directory)
Dir.rmdir(filename)
