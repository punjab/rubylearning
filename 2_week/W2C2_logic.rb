#!/usr/bin/env ruby -wKU
=begin
  Name: W2C_logic.rb
  Description: Using logic instead of tertiary operator
  Author: Arvinder Kang
  Date: 2014-07-24
  Licensed under the MIT license
=end

puts 5 > 3 ? "yeah" : "boo" #=> nil
#> yeah
puts 5 < 3 ? "yeah" : "boo" #=> nil
#=> boo

# Re-attempt
puts 5 > 3 && "yeah" || "boo"
puts 5 < 3 && "yeah" || "boo"

# Another way, using spaceship operator
def logic_challenge(first, last)
    {-1 => 'boo', 0 => 'oh', 1 => 'yeah'}[first <=> last]
end
[[3, 5], [5, 3], ['a', 'z'], ['wow', 'wow']].each do |first, last|
    puts 'first = %s, last = %s, is %s' % [first, last, logic_challenge(first, last)]
end
