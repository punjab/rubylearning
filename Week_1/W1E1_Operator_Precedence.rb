#!/usr/bin/env ruby -wKU
#
# Understanding Operator Precedence
#
y = false
z = true
x = y or z
puts x #=> false, = has higher precedence than or
(x = y) or z
puts x #=> false, brackets have higher precedence than or
x = (y or z)
puts x #=> true, brackets have higher precedence than or
