#!/usr/bin/env ruby -wKU
=begin
  Name: 2e_mp3_file.rb
  Description: Analyze MP3 files
  Author: Arvinder Kang
  Date: 2014-08-22
  Licensed under the MIT license
=end

class MP3
  def initialize(song)
    @song = song
  end
  def id3
    @tag = IO.read(@song)[-128..-1]
    @tag.unpack('xxxA30')
  end
end

song = MP3.new('song.mp3')
p song.id3
