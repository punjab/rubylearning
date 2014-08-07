#!/usr/bin/env ruby -wKU
=begin
  Name: W3E10_sum_array.rb
  Description: Sum an array of integers
  Author: Arvinder Kang
  Date: 2014-08-05
  Licensed under the MIT license
=end

collection = [1, 2, 3, 4, 5]
puts collection.reduce(:+)