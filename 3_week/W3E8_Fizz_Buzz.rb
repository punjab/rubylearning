#!/usr/bin/env ruby -wKU
=begin
  Name: W3E8_Fizz_Buzz.rb
  Description: Print Fizz for multiples of 3, Buzz for 5
  Author: Arvinder Kang
  Date: 2014-08-05
  Licensed under the MIT license
=end

def fizzbuzz(num)
  result = ''
  result << 'Fizz' if num % 3 == 0
  result << 'Buzz' if num % 5 == 0
  result.empty? ? num : result
end

1.upto(100) do |num|
  puts fizzbuzz num
end