#!/usr/bin/env ruby -wKU
=begin
  Name: W1C2_convert_multi.rb
  Description: Test temperature scale conversion
  Author: Arvinder Kang
  Date: 2014-07-22
  Licensed under the MIT license
=end

=begin
doctest: Test temperature scale conversions
>> "%0.2f" % convert(80, 'c', 'K')
=> "353.15"
>> "%0.2f" % convert(80, 'K', 'c')
=> "-193.15"
>> "%0.2f" % convert(80, 'F', 'c')
=> "26.67"
>> "%0.2f" % convert(80, 'F', 'k')
=> "299.82"
>> "%0.2f" % convert(80, 'k', 'f')
=> "-315.67"
=end

def to_kelvin(temperature, initial_scale)
  case initial_scale
  when 'c'
    return temperature.to_f + 273.15
  when 'r'
    return temperature.to_f * 5/9
  when 'f'
    return (temperature.to_f + 459.67) * 5/9
  when 'k'
    return temperature.to_f
  else
    return "Unknown Scale"
  end
end

def from_kelvin(temperature, final_scale)
  case final_scale
  when 'c'
    return temperature.to_f - 273.15
  when 'r'
    return temperature.to_f * 9/5
  when 'f'
    return (temperature.to_f * 9/5) - 459.67
  when 'k'
    return temperature.to_f
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
  iscale = gets.chomp

  puts "Enter the temp value: "
  STDOUT.sync = true
  temperature = gets.chomp

  puts "What is your OUTPUT scale (valid inputs are C for Celsius, F for Fahrenheit, and K for Kelvin): "
  oscale = gets.chomp

  print "#{temperature} in #{iscale} is equivalent to %.2f #{oscale}.\n" % [convert(temperature, iscale, oscale), oscale]
end
