def echo(a)
	return a
end

def shout(a)
	return a.upcase
end

def repeat(a, *num)
	if num.length == 0
		return a + ' ' + a
	elsif num.length == 1
		return (a + ' ')*(num[0]-1) + a
	end			
end

def start_of_word(word, num)
	return word[0, num]
end

def first_word(input)
	input = input.split(/ /)
	return input[0]
end

def titleize(input)
	#response = input.split.map(&:capitalize).join(' ')
	stop_words = %w{and over the}
	input.split.each_with_index.map{|word, index| stop_words.include?(word) && index > 0 ? word : word.capitalize }.join(" ")
end