#!/usr/bin/env ruby -wKU

def minutes_in_year
  days_in_year = 365
  hours_in_day = 24
  minutes_in_hour = 60
  days_in_year * hours_in_day *  minutes_in_hour
end

puts "There are #{minutes_in_year} minutes in one year."
