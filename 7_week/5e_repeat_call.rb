#!/usr/bin/env ruby -wKU
=begin
  Name: 5e_repeat_call.rb
  Description: Repeat command to shell
  Author: Arvinder Kang
  Date: 2014-08-28
  Licensed under the MIT license
=end

def call_to_shell(&block)
  loop do
    yield block
    sleep 5
  end
end

a = ->(command){ puts "Command Executed"}
call_to_shell(&a)
