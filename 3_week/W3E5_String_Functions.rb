#!/usr/bin/env ruby -wKU
=begin
  Name: W3E5_String_Functions.rb
  Description: String Functions
  Author: Arvinder Kang
  Date: 2014-07-25
  Licensed under the MIT license
=end
s = 'key=value'
# s1, s2 = s.split('=') #=> ["key", "value"]
s1,_, s2 = s.scan(/\w+|=/)
# _ is legitimate var name, but usually used for throwaway values
