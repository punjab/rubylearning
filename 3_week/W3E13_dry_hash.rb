#!/usr/bin/env ruby -wKU
=begin
  Name: W3E13_dry_hash.rb
  Description: Drier Has
  Author: Arvinder Kang
  Date: 2014-08-05
  Licensed under the MIT license
=end

# The long way
record = Hash.new
record[:name] = "Satish"
record[:email] = "mail@satishtalim.com"
record[:phone] = "919371006659"

# Short way
record = {
  :name => "Satish",
  :email => "mail@satishtalim.com",
  :phone => "919371006659"
}

# Shortest way

record = {
  name: "Satish",
  email: "mail@satishtalim.com",
  phone: "919371006659"
}