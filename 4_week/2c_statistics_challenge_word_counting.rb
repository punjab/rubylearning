#!/usr/bin/env ruby -wKU
=begin
  Name: 2c_statistics_challenge_word_counting.rb
  Description: Text analyzer extended
  Author: Arvinder Kang
  Date: 2014-08-17
  Licensed under the MIT license
=end

def analyze_text(text)
  {
    :line_count => (text.split(/\n/).last.chomp.empty? ? text.scan(/\n/).count + 1 : text.scan(/\n/).count),
    :character_count => text.length,
    :character_count_excluding_spaces => text.scan(/\S/).length,
    :word_count => text.split(' ').length,
    :sentence_count => text.split(/[\.?!]/).length,
    :paragraph_count => text.split(/\n\r/).length
  }
end

def report(analysis_result)
  output = ''
  output << "***********************\n"
  output << "    Analysis Report    \n"
  output << "***********************\n"
  analysis_result.each do |key, value|
    output << "#{key.to_s.gsub(/_/, ' ').capitalize} : #{value}\n"
  end
  output << "Average number of words per sentence: %.2f \n" % (analysis_result[:word_count]/analysis_result[:sentence_count].to_f)
  output << "Average number of sentences per paragraph: %.2f \n" % (analysis_result[:sentence_count]/analysis_result[:paragraph_count].to_f)
  output
end

begin
  corpora = IO.read('text3.txt')
  analysis_result = analyze_text(corpora)
  puts report(analysis_result)
end if  __FILE__ == $0
