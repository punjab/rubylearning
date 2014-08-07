#!/usr/bin/env ruby -wKU
=begin
  Name: W3E14_hash_methods.rb
  Description: Identify hash methods
  Author: Arvinder Kang
  Date: 2014-08-05
  Licensed under the MIT license
=end

h = { "Ruby" => "Matz", "Perl" => "Larry", "Python" => "Guido" }

#Answers:
#
# 1. h.member?("Matz") #=> false, because method check keys
# 2. h.member?("Python") #=> true
# 3. h.include?("Guido") #=> false, checks keys
# 4. h.include?("Ruby") #=> true
# 5. h.has_value?("Larry") #=> true
# 6. h.exists?("Perl")  #=> Method does not exist
#
#
#
