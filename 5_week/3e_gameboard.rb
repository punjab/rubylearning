#!/usr/bin/env ruby -wKU
=begin
  Name: 3e_gameboard.rb
  Description: Gameboard
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end

class GameBoard
  def initialize
    @cells = Array.new(7)
    @no_of_hits = 0
  end

  def set_locations_cells(locations)
    @cells.each_index do |index|
      @cells[index] = true if locations.include?(index)
    end
  end

  def check_yourself(guess_string)
    guess = guess_string.to_i
    if @cells[guess]
      @no_of_hits += 1
      @cells[guess] = false
      if @no_of_hits == 3
        puts "End"
        return "kill"
      end
      puts "Hit"
    else
      puts "Miss"
    end
  end

end
