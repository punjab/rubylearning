#!/usr/bin/env ruby -wKU
=begin
  Name: 5e_game.rb
  Description: Game State
  Author: Arvinder Kang
  Date: 2014-08-24
  Licensed under the MIT license
=end

def save_game(file)
  score = 1000
  open(file, 'w') do |f|
    f.puts score, Time.new.to_i
  end
end

def load_game(file)
  score, time = IO.readlines(file)
  if time.to_i ==  File.ctime(file).to_i
    puts "Your saved score is #{score.to_i}."
  else
    raise "I suspect you of cheating."
  end
end

if __FILE__ == $0
  save_game("game.sav")
  sleep(2)
  load_game("game.sav")
  
  # Now let's cheat by increasing our score to 9000
  open("game.sav", "r+b") { |f| f.write("9") }
  load_game("game.sav") # RuntimeError: I suspect you of cheating.
end