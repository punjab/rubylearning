#!/usr/bin/env ruby -wKU
=begin
  Name: W3E11_even_odd.rb
  Description: Even or Odd
  Author: Arvinder Kang
  Date: 2014-08-05
  Licensed under the MIT license
=end

collection = [12, 23, 456, 123, 4579]
even_or_odd = {true => "even", false => "odd"}
result = Hash[collection.zip(collection.map{|e| even_or_odd[e.even?]})]
result.each do |key, value|
  puts "#{key} : #{value}"
end