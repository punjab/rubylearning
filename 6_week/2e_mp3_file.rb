#!/usr/bin/env ruby -wKU
=begin
  Name: 2e_mp3_file.rb
  Description: Analyze MP3 files
  Author: Arvinder Kang
  Date: 2014-08-22
  Licensed under the MIT license
=end

class MP3
  SCHEMA = {
    title: 30,
    artist: 30,
    album: 30,
    year: 4,
    comment: 30
  }
  
  def initialize(song)
    @song = song
  end

  def id3_tags
    if tag_present?
      metadata = read_metadata
      index, tags = 0, {}
      SCHEMA.each do |tag_name, tag_length|
        tags[tag_name] = metadata.byteslice(index, tag_length).strip
        index += tag_length
      end
      tags
    end
  end

  private
    def tag_present?
      IO.read(@song)[-128..-126] == 'TAG'
    end
    
    def read_metadata
      IO.read(@song)[-125..-1]
    end
end

song = MP3.new('song.mp3')
tags = song.id3_tags
if tags
  tags.each do |tag, value|
    puts "#{tag} : #{value}"
  end
end

