#!/usr/bin/env ruby -wKU
=begin
  Name: W3E12_quiz_students.rb
  Description: Number of students who attempted quiz
  Author: Arvinder Kang
  Date: 2014-08-05
  Licensed under the MIT license
=end

quiz = [0,0,0,1,0,0,1,1,0,1]

puts "The number of participants who did not attempt Quiz 1 is #{quiz.select{|e| e == 0}.count} out of #{quiz.count} total participants."