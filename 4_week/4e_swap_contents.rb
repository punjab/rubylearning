#!/usr/bin/env ruby -wKU
=begin
  Name: 4e_swap_contents.rb
  Description: Swap content
  Author: Arvinder Kang
  Date: 2014-08-16
  Licensed under the MIT license
=end

file1, file2 = 'text1.txt', 'text2.txt'
tmp = IO.read(file1)
IO.write(file1, IO.read(file2))
IO.write(file2, tmp)

