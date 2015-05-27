module Scrabble

	class Scrabble
	  # require your gems and classes here
	  # require_relative 'scrabble/whatevs'
	  
	  POINTS = {
	  	1 	=> "aeioulnrst",
	  	2 	=> "dg",
	  	3 	=> "bcmp",
	  	4 	=> "fhvwy",
	  	5 	=> "k",
	  	8 	=> "jx",
	  	10 	=> "qz"
	  }
	  VALID_LETTERS = "abcdefghijklmnopqrstuvwxyz"
	
	  def initialize
	  end

	  def self.valid_input?(word)
	  	# guard clause for empty string or nil input
	  	return false if word == "" || word == nil

	  	word_letters = word.downcase.split("")
		word_letters.each do |letter|
  			return false if !(VALID_LETTERS.include?(letter))
  		end
	  	true
	  end

	  def self.check_length(word)
	  	return false unless word.length <= 7
	  	true
	  end

	  def self.get_points(word)
	  	word_score = 0
	  	word_letters = word.downcase.split("")
	  	word_letters.each do |letter|
			POINTS.each do |points, letter_list|
				if letter_list.include?(letter)
					word_score += points
				end
			end
	  	end
	  	word_score
	  end

	  def self.score(word)
	  	# guard clause for non-alphabetic user input
  		return "ERROR" unless self.valid_input?(word)

  		# guard clause for word over 7 letters
  		return "ERROR -- too long" unless self.check_length(word)

  		# return score for valid word
  		self.get_points(word)
	  end


	  def self.highest_score_from(array_of_words)
	  	all_scores = []
	  	array_of_words.each do |word|
	  		all_scores << [Scrabble.score(word), word]
	  	end

	  	high_scores = all_scores.find_all { |score, word| score == all_scores.max[0] }

	  	seven_letter_word = high_scores.find { |score, word| word.length == 7 }
	  	if seven_letter_word
	  			return seven_letter_word.last
	  	else
	  		highest_word = high_scores.min_by { |score, word| word.length }
	  		highest_word.last
	  	end

	  end

	end
end
