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
    schema = {
      title: 30,
      artist: 30,
      album: 30,
      year: 4,
      comment: 30
    }
    if tag_present?
      last_125_bytes = IO.read(@song)[-125..-1]
      index = 0
      tags = {}
      schema.each do |tag, size|
        tags[tag] = last_125_bytes.byteslice(index, size).strip
        index += size
      end
      tags
    end
  end

  private
    def tag_present?
      IO.read(@song)[-128..-126] == 'TAG'
    end
end

song = MP3.new('song.mp3')
tags = song.id3_tags
if tags
  tags.each do |tag, value|
    puts "#{tag} : #{value}"
  end
end

