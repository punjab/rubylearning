#!/usr/bin/env ruby -wKU
=begin
  Name: W1C3_text_formatting.rb
  Description: Text Formatting Challenge
  Author: Arvinder Kang
  Date: 2014-07-22
  Licensed under the MIT license
=end

def decorate(integer, max_number_of_chars)
  decoration_string = ''
  integer.times do
    decoration_string << ("=" * (max_number_of_chars+1))
  end
  (decoration_string << "\n")
end

def multiplication_table(integer, heading = '', decorate = false)
  max_number_of_chars = (integer*integer).to_s.length

  table = ''
  table << heading << "\n"  unless heading.empty?

  table << decorate(integer, max_number_of_chars) unless ! decorate

  (1..integer).map do |x|
    (1..integer).map do |y|
      table << "#{(x*y).to_s.rjust(max_number_of_chars)} "
    end
    table << "\n"
  end

  table << decorate(integer, max_number_of_chars) unless ! decorate

  table.to_s
end

table1 = multiplication_table 9, 'Times Table to 9', true
table2 = multiplication_table 20
table3 = multiplication_table 1, '1x1', true
table4 = multiplication_table 0, '0x0', true


puts table1
puts
puts table2
puts
puts table3
puts
puts table4
