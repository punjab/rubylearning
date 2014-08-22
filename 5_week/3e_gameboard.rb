#!/usr/bin/env ruby -wKU
=begin
  Name: 3e_gameboard.rb
  Description: Gameboard
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end

class GameBoard
  def set_locations_cells(targets)
    @targets = targets
  end

  def check_yourself(guess_string)
    guess = guess_string.to_i
    if @targets.include? guess
      @targets.delete guess
      check_hit_status
    else
      puts "Miss"
    end
  end
  
  def check_hit_status
    if @targets.empty?
      puts "End"
      return "kill"
    else
      puts "hit"
    end
  end

end
