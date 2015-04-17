def translate(word)
	word_array = word.split
	final_string = ""

	if word_array.length == 1
	#vowels =~ /\A[^aeiou]/
		if word.chr.match(/\A[aeiou]/)
			final_string = (word + "ay")
		elsif word.start_with?("qu")
			final_string = (word[2, word.length] + word[0, 2] + "ay")
		#elsif word[0, 1].match(/\A[^aeiou]/) && word[1, 2].match(/\A[^aeiou]/) && word[2,3].match(/\A[^aeiou]/) && word[3,4].match(/\A[a]/)
		#	final_string = word[5, word.length] + word[0,4] + "ay"
		#elsif word[0, 1].match(/\A[^aeiou]/) && word[1,2].match(/\A[^aeiou]/) && 
		elsif word[0,4].match(/squa/)
			final_string = (word[3, word.length] + word[0, 3] + "ay")
		elsif word[0, 1].match(/\A[^aeiou]/) && word[1,2].match(/\A[^aeiou]/) && word[2,3].match(/\A[^aeiou]/)
			final_string = (word[3, word.length] + word[0, 3] + "ay")
		elsif word[0, 1].match(/\A[^aeiou]/) && word[1,2].match(/\A[^aeiou]/)
			final_string = (word[2, word.length] + word[0, 2] + "ay")
		elsif word.chr.match(/\A[^aeiou]/)
			final_string = (word[1, word.length] + word.chr + "ay")
		end
	return final_string

	elsif word_array.length >= 2
		#i = 0
		word_array.each { |word|
		#while i < word_array.length-1
			if word.chr.match(/\A[aeiou]/)
				final_string = final_string + ' ' + (word + "ay")
				#i = i+1
			elsif word.start_with?("qu")
				final_string = final_string + ' ' + (word[2, word.length] + word[0, 2] + "ay")
			elsif word[0, 1].match(/\A[^aeiou]/) && word[1,2].match(/\A[^aeiou]/)
				final_string = final_string + ' ' + (word[2, word.length] + word[0, 2] + "ay")
				#i = i+1
			elsif word.chr.match(/\A[^aeiou]/)
				final_string = final_string + ' ' + (word[1, word.length] + word.chr + "ay")
				#i = i+1
			end
		}
		return final_string.lstrip
	end

end
