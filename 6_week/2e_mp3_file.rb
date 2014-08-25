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
    comment: 28,
    track_number: 2,
    genre: 1
  }
  
  GENRE = [
  'Classic Rock',
  'Country',
  'Dance',
  'Disco',
  'Funk',
  'Grunge',
  'Hip-Hop',
  'Jazz',
  'Metal',
  'New Age',
  'Oldies',
  'Other',
  'Pop',
  'R&B',
  'Rap',
  'Reggae',
  'Rock',
  'Techno',
  'Industrial',
  'Alternative',
  'Ska',
  'Death Metal',
  'Pranks',
  'Soundtrack',
  'Euro-Techno',
  'Ambient',
  'Trip-Hop',
  'Vocal',
  'Jazz+Funk',
  'Fusion',
  'Trance',
  'Classical',
  'Instrumental',
  'Acid',
  'House',
  'Game',
  'Sound Clip',
  'Gospel',
  'Noise',
  'AlternRock',
  'Bass',
  'Soul',
  'Punk',
  'Space',
  'Meditative',
  'Instrumental Pop',
  'Instrumental Rock',
  'Ethnic',
  'Gothic',
  'Darkwave',
  'Techno-Industrial',
  'Electronic',
  'Pop-Folk',
  'Eurodance',
  'Dream',
  'Southern Rock',
  'Comedy',
  'Cult',
  'Gangsta Rap',
  'Top 40',
  'Christian Rap',
  'Pop / Funk',
  'Jungle',
  'Native American',
  'Cabaret',
  'New Wave',
  'Psychedelic',
  'Rave',
  'Showtunes',
  'Trailer',
  'Lo-Fi',
  'Tribal',
  'Acid Punk',
  'Acid Jazz',
  'Polka',
  'Retro',
  'Musical',
  'Rock & Roll',
  'Hard Rock'
  ]

  def initialize(song)
    @song = song
  end

  def id3_tags
    if tag_present?
      metadata = read_metadata
      @tags = Hash.new("No Information Known")
      parse(metadata)
      @tags[:track_number] = parse_track_tag
      @tags[:genre] = parse_genre_tag
    end
    @tags
  end

  private
    def read_metadata
      IO.read(@song)[-125..-1]
    end
    
    def tag_present?
      IO.read(@song)[-128..-126] == 'TAG'
    end
  
    def parse(metadata)
      index = 0
      SCHEMA.each do |tag_name, tag_length|
        tag_value = metadata.byteslice(index, tag_length)
        tag_value.strip! unless tag_name == :track_number
        @tags[tag_name] = tag_value unless tag_value.empty?
        index += tag_length
      end
    end
    
    def parse_track_tag
      zero_byte, track = @tags[:track_number].unpack('c*')
      zero_byte == 0 ? track : nil
    end
    
    def parse_genre_tag
      genre_code = @tags[:genre].unpack('c*')[0]
      GENRE[genre_code-1]
    end
end

song = MP3.new('song.mp3')
tags = song.id3_tags
if tags
  tags.each do |tag, value|
    puts "#{tag} : #{value}"
  end
end

