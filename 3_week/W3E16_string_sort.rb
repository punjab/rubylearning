#!/usr/bin/env ruby -wKU
=begin
  Name: W3E16_string_sort.rb
  Description: Correct way of sorting string
  Author: Arvinder Kang
  Date: 2014-08-06
  Licensed under the MIT license
=end

a = ["Magazine", "Sunday", "Jump"]
a.sort { |s| p s }

# Answers:
# 1. a.sort => ["Jump", "Magazine", "Sunday"]

# 2. a.sort { |s| s } => results in error as block provides inadequate comparision
# 3. a.sort { |l, r| l <=> r } => same as a a.sort
# 4. a.sort { |l, r| l.length <=> r.length } => redefining spaceship operator changes comparision criteria ["Jump", "Sunday", "Magazine"]
# 5. a.sort_by { |s| s } => Same as 1 and 3
# 6. a.sort_by { |s| s.length } => same as 4