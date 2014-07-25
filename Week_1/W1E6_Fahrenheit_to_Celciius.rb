#!/usr/bin/env ruby -wKU
=begin
  Name: W1E6_Fahrenheit_to_Celciius.rb
  Description: Fahrenheit to Celcius
  Author: Arvinder Kang
  Date: 2014-07-22
  Licensed under the MIT license
=end

=begin
   doctest: Test Fahrenheit to Celcius conversion
   >> convert(32)
   => 0.00
   >> convert(41)
   => 5.00

   >> -> {begin ; convert('Blah') ; rescue => e ; e.message.to_s ; end}.call.scan("undefined method")
   => ["undefined method"]
=end

def convert(temperature_in_fahrenheit)
    (temperature_in_fahrenheit.to_f - 32)* 5/9
end

if __FILE__ == $0
  puts "What is the temperature today in Fahrenheit?"
  STDOUT.flush
  temperature_in_fahrenheit = gets.to_f
  puts format("%.2f degree Fahrenheit is equivalent to %.2f degree celcius.", temperature_in_fahrenheit, convert(temperature_in_fahrenheit))
end
