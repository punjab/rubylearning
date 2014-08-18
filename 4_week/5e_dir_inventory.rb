#!/usr/bin/env ruby -wKU
=begin
  Name: 5e_dir_inventory.rb
  Description: Inventory of a given directory
  Author: Arvinder Kang
  Date: 2014-08-17
  Licensed under the MIT license
=end

# Print inventory one liner
# Dir.glob('**/*').sort.each {|f| puts f}

# Diff oneliner
puts diff =  IO.readlines('new_inventory.txt') - IO.readlines('old_inventory.txt')

