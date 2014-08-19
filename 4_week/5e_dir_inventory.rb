#!/usr/bin/env ruby -wKU
=begin
  Name: 5e_dir_inventory.rb
  Description: Inventory of a given directory
  Author: Arvinder Kang
  Date: 2014-08-17
  Licensed under the MIT license
=end

# Print inventory one liner
def make_inventory
  Dir.glob('**/*').sort.each {|f| puts f}
end

# Diff oneliner
def diff(old_file, new_file)
  IO.readlines(new_file) - IO.readlines(old_file)
end

puts diff('new_inventory.txt','old_inventory.txt')

