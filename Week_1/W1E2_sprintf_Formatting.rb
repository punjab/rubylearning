#!/usr/bin/env ruby -wKU
#
# Using sprintf to format string
#
puts "%05d" % 123
#=> Should print 00123,
# %[flags][width][.precision]type
# 0 - pad with zeros instead of spaces
# 5 - width
# d - decimal type
