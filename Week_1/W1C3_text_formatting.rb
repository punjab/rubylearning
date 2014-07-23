#!/usr/bin/env ruby -wKU
=begin
  Name: W1C3_text_formatting.rb
  Description: Text Formatting Challenge
  Author: Arvinder Kang
  Date: 2014-07-22
  Licensed under the MIT license
=end

def decoration(number, line_length)
  ("=" * number * (line_length+1)) << "\n"
end

def multiplication_table(integer, heading = '', decorate = false)
  line_length =  (integer*integer).to_s.length

  table = ''
  table << heading << "\n"  unless heading.empty?
  table << decoration(integer, line_length).to_s if decorate
  if integer == 0
    table << "0\n"
  else
    (1..integer).map do |x|
      (1..integer).map do |y|
        table << "#{(x*y).to_s.rjust(line_length)} "
      end
      table << "\n"
    end
  end

  table << decoration(integer, line_length).to_s if decorate

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
