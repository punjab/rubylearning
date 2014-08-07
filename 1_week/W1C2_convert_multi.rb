#! / usr / bin / env ruby -wKU
=begin
  Name: W1C2_convert_multi.rb
  Description: Test temperature scale conversion
  Author: Arvinder Kang
  Date: 2014-07-22
  Licensed under the MIT license
=end

require './test_W1C2_convert_multi.rb'

def to_kelvin(temperature, initial_scale)
  case initial_scale
  when 'c'
    return temperature + 273.15
  when 'r'
    return temperature * 5 / 9
  when 'f'
    return (temperature + 459.67) * 5 / 9
  when 'k'
    return temperature
  else
    return "Unknown Scale"
  end
end

def from_kelvin(temperature, final_scale)
  case final_scale
  when 'c'
    return temperature - 273.15
  when 'r'
    return temperature * 9 / 5
  when 'f'
    return (temperature * 9 / 5) - 459.67
  when 'k'
    return temperature
  else
    return "Unknown scale"
  end
end

def convert(temperature, initial_scale, final_scale)
  midvalue = to_kelvin(temperature, initial_scale.downcase)
  from_kelvin(midvalue, final_scale.downcase)
end

if __FILE__ == $0
  puts "Welcome to temperature converter."
  puts "What is your INPUT scale (valid inputs are C for Celsius, F for Fahrenheit, and K for Kelvin): "
  STDOUT.sync = true
  input_scale = gets.chomp

  puts "Enter the temp value: "
  temperature = gets.to_f

  puts "What is your OUTPUT scale (valid inputs are C for Celsius, F for Fahrenheit, and K for Kelvin): "
  output_scale = gets.chomp

  print "#{temperature} in #{input_scale} is equivalent to %.2f #{output_scale}.\n" % [convert(temperature, input_scale, output_scale), output_scale]
end
