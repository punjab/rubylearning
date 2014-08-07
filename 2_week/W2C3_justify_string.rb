#!/usr/bin/env ruby -wKU
=begin
  Name: W2E2_String_Processing.rb
  Description: Write a String Processing Program
  Author: Arvinder Kang
  Date: 2014-07-24
  Licensed under the MIT license
=end

s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\nWelcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\nWelcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\nWelcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\nWelcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\nWelcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\nWelcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
index_width = s.lines.size.to_s.size
s.each_line.with_index(1) do |line, index|
  printf("Line %s: %s", index.to_s.rjust(index_width, '0'), line)
end
