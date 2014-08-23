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
  
  def id3_tags
    if tag_present?
      tags = []
      last_125_bytes = IO.read(@song)[-125..-1]
      last_125_bytes.force_encoding('UTF-8').scan(/.{30}/).each do |tag|
        tags << tag.unpack('A30')[0]
      end
      return tags
    end
    return "No TAG id3 tag found!"
  end
  
  private
    def tag_present?
      IO.read(@song)[-128..-126] == 'TAG'
    end
end

song = MP3.new('song.mp3')
p song.id3_tags


