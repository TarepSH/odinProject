class Ceaser
	attr_accessor :input, :value, :new_string

	def initialize input, value
		@input = input
		@input_downcase = input.downcase.split("")
		@input_array = input.downcase.split("")
		@value = value.to_i
		@alphabet = "abcdefghijklmnopqrstuvwxyz"
		@uppercase = @alphabet.upcase.split("")
		@alphabet = @alphabet.split("")
		@new_string = ""

		# convert_word
		# print_word
	end

	def convert_word 
		@input_downcase.each do |j|
			@alphabet.each do |i|
				index = @alphabet.index(i) + value
				length = @alphabet.length

				if j.eql?(i) && (index < length)
					@new_string[@input_array.index(j)] = @alphabet[index]
				end

				if j.eql?(i) && index >= length
					new_value = index - length
					@new_string[input_array.index(j)] = @alphabet[new_value]
				end
			end
		end

		upcase_letters(input)
	end

	def is_uppercase?(char)
		char == char.upcase
	end

	def upcase_letters(word)
		word = word.split("")
		puts "#{word}"
		word.each do |letter|
			if letter == letter.upcase
				@new_string[word.index(letter)] = @new_string[word.index(letter)].upcase
			end
		end

	end

	def print_word
		return "#{@new_string}"
	end

end