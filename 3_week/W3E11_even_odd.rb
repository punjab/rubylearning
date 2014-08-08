#!/usr/bin/env ruby -wKU
=begin
  Name: W3E11_even_odd.rb
  Description: Even or Odd
  Author: Arvinder Kang
  Date: 2014-08-05
  Licensed under the MIT license
=end

collection = [12, 23, 456, 123, 4579]

# post coffee code
def odd_or_even(num)
  # num.even? ? "even" : "odd"
  {true => "even", false => "odd"}[num.even?]
end

collection.each do |number|
  puts "#{number} :  #{odd_or_even(number)}"
end