#!/usr/bin/env ruby -wKU
=begin
  Name: 1c_quick_and_dirty_repl.rb
  Description: Quick and easy prompt
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end

if ARGV.first == '--help'
  puts <<END

  Usage: ruby 1c_quick_and_dirty_repl.rb [s]

    where
      s :  is the number of seconds to wait before launch. Defaults to 3.

END
  exit
end

class Prompt
  def countdown(seconds=3)
    counter = seconds
    print "Launchin in ..."
    seconds.times { print "#{counter}..."; counter -= 1; sleep 1}
    puts
  end

  def run
    ARGV.empty? ? countdown : countdown(ARGV[0].to_i)
    puts "Welcome to MY-RB. You are using #{`ruby -v`.chomp}. Have fun ;)"
    response = ''
    until response =~ /^exit$/
      prompt = ">> "
      print prompt
      response = STDIN.gets
      response = Interpreter.new(response)
      puts response
    end
    puts "You are exiting our REPL"
  end
end

class Interpreter
  def initialize(input)
    @input = input
  end

  def to_s
    begin
      output ||= eval(@input)
      result = "#=> \033[37m#{output}\033[0m"
    rescue => e
      result =  "\033[31m#{e.class} : #{e.message}\033[0m"
    end
    # Strip colot if < 8 bit color
    `tput colors`.to_i < 8 ? result.gsub(/\033\[\d+m/, "") : result
  end
end

if __FILE__ == $0
  prompt = Prompt.new
  prompt.run
end

