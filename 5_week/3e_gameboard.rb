#!/usr/bin/env ruby -wKU
=begin
  Name: 3e_gameboard.rb
  Description: Gameboard
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end

class GameBoard
  def set_locations_cells(locations)
    @locations = locations
  end

  def check_yourself(guess) # This method returns 'kill' or nil
    @guess = guess.to_i
    puts guess_result = hit_or_miss
    remove_target if guess_result == "hit"
    finished?
  end
  
  private
    def hit_or_miss
      @locations.include?(@guess) ? "hit" : "miss"
    end
  
    def remove_target
      @locations.delete @guess
    end
  
    def finished?
      (puts "End"; "kill") if @locations.empty?
    end
  
end
