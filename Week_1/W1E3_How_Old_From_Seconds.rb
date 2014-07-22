#!/usr/bin/env ruby -wKU
=begin
  Name: W1E3_How_Old_From_Seconds.rb
  Description: Ruby program that displays how old I am, if I am 979000000 seconds old.
  Author: Arvinder Kang
  Date: 2014-07-22
  Licensed under the MIT license
=end

def age_in_years(age_in_seconds)
  days_in_year = 365.25
  hours_in_day = 24
  minutes_in_hour = 60
  seconds_in_minute = 60
  age_in_seconds/ (days_in_year * hours_in_day * minutes_in_hour * seconds_in_minute)
end

puts "Age in years: %.2f" % age_in_years(979000000)
