a = (1930...1951).to_a
puts a[rand(a.size)]

# The following values will never be displayed
# 1929 - Out of range
# 1951 - ... means excluding the upper range. Out of range
# 1952 - Out of range
#
# Splat appears to be swiff Army knife with many tools
# In this case it helps convert a range into array
# a = (1930...1951).to_a is same as
# a = *(1930...1951) which is same as
# a = [*1930...1951]
