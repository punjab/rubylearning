#!/usr/bin/env ruby -wKU
=begin
  Name: W2E3_leap_year.rb
  Description: Check for leap year.
  Author: Arvinder Kang
  Date: 2014-07-24
  Licensed under the MIT license
=end

=begin
  doctest: Check if 2000 is is leap or not
  >> leap_year?(2000)
  => true
  doctest: check 2004
  >> leap_year?(2004)
  => true
  doctest: check 1900
  >> leap_year?(1900)
  => false
  doctest: check 2005
  >> leap_year?(2005)
  => false
  doctest: Minutes in 2000 - leap year
  >> number_of_minutes(2000)
  =>  527040
  doctest: Minutes in 2005 - not leap
  >> number_of_minutes(2005)
  =>  525600
=end
class Fixnum
  def divisible_by?(number)
    self % number == 0
  end

  def not_divisible_by?(number)
    ! divisible_by?(number)
  end
end

def leap_year?(year)
  year.divisible_by?(400) || year.not_divisible_by?(100) && year.divisible_by?(4)
  # if (year % 100 == 0)
  #   return year % 400 == 0
  # end
  # year % 4 == 0
end

def number_of_minutes(year)
  days_in_year = leap_year?(year) ? 366 : 365
  hours_in_day = 24
  minutes_in_hour = 60
  days_in_year * hours_in_day * minutes_in_hour
end
