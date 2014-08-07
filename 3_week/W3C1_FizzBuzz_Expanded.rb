#!/usr/bin/env ruby -wKU
=begin
  Name: W3C1_FizzBuzz_Expanded.rb
  Description: FizzBuzz expanded challenge
  Author: Arvinder Kang
  Date: 2014-08-05
  Licensed under the MIT license
=end

def fizzbuzz(num, rules={})
  defaults = {3 => 'Fizz', 5 => 'Buzz', 11 => 'Kezz'}
  rules = rules.merge defaults
  result = ''
  rules.sort.map do |key, value|
    result << value if num % key == 0
  end
  result.empty? ? num : result
end

# fizz = Proc.new{|number| number % 3 == 0}
# buzz = Proc.new{|number| number % 5 == 0}
# dazz = Proc.new{|number| number % 7 == 0}
# kezz = Proc.new{|number| number % 11 == 0}

1.upto(100) do |num|
  puts fizzbuzz(num) << "and" << fizzbuzz(num, {7 => "Dazz"})
end

