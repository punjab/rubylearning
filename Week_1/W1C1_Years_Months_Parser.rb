#!/usr/bin/env ruby -wKU
=begin
  Name: W1C1_Years_Months_Parser.rb
  Description: Years Months Parser
  Author: Arvinder Kang
  Date: 2014-07-22
  Licensed under the MIT license
=end

=begin
doctest: Check age in years and months  when given in seconds
>> age_in_years_months(47336400)
=> [1,6]
>> age_in_years_months(63115200)
=> [2,0]
=end

def age_in_years_months(age_in_seconds)
  age_in_years = age_in_seconds/(60*60*24*365.25)
  years = age_in_years.floor
  months = ((age_in_years - years) * 12).floor
  [years, months]
end

seconds = [979000000, 2158493738, 246144023, 1270166272, 1025600095]
seconds.each do |num|
  result = age_in_years_months(num)
  output = "If you are #{num} seconds old, you are "
  output << "%s years " % result[0] if result[0] >= 1
  output << "%s months " % result[1] if result[1] >= 1
  output << "old."
  puts output
end
