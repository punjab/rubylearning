#!/usr/bin/env ruby -wKU
=begin
  Name: 3e_month_days.rb
  Description: Number of Days in Month
  Author: Arvinder Kang
  Date: 2014-08-28
  Licensed under the MIT license
=end
require 'date'

def month_days(month, year = Date.today.year)
  last_day_of_month = Date.civil(year, month.to_i, -1)
  "#{last_day_of_month.day} (#{Date::ABBR_MONTHNAMES[last_day_of_month.month]} #{last_day_of_month.year})"
end

puts month_days(2)
puts month_days(2, 2000)
