#!/usr/bin/env ruby -wKU
=begin
  Name: 4e_text_analyser_exception.rb
  Description: Text Analyzer with exception logging
  Author: Arvinder Kang
  Date: 2014-08-23
  Licensed under the MIT license
=end

class Analyzer
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
    output = <<REPORT
    ***********************
        Analysis Report    
    ***********************
REPORT
    analysis_result.each do |key, value|
      output << "#{key.to_s.gsub(/_/, ' ').capitalize} : #{value}\n"
    end
    output << "Average number of words per sentence: %.2f \n" % 
              (analysis_result[:word_count]/analysis_result[:sentence_count].to_f)
    output << "Average number of sentences per paragraph: %.2f \n" % 
              (analysis_result[:sentence_count]/analysis_result[:paragraph_count].to_f)
    output
  end
end


begin
  require 'logger'
  print "Please provide a name for log file. Default (log_file.log): "
  logfile = gets.chomp
  logfile = 'log_file.log' if logfile.empty?
  $LOG = Logger.new(logfile, 'monthly')
  $LOG.level = Logger::INFO
  
  print "File to be analyzed? "
  filename = gets.chomp
  begin
    corpora = IO.read(filename)
    a = Analyzer.new
    analysis_result = a.analyze_text(corpora)
    puts a.report(analysis_result)
    $LOG.info("Analysis report on #{filename} successful.")
  rescue Exception => e
    $LOG.error "#{e.class} error occured: #{e.message}"
    puts "#{e.class} error Occured. Refer log file for details!"
  end
end if  __FILE__ == $0
