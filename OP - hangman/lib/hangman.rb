#This is an implementation of hangman
require 'yaml'

class Game

	def initialize
		@guesses = 12
		@list = []
		@word_list = []
		@word_display
		@clue

		list = open_file("5desk.txt")
		@word = random_word(list)
		convert_word(@word)
		play
	end

	def open_file(input)
		a = File.open(input, "r")
		contents = a.readlines

		contents.each do |word|
			if word.length >= 5 && word.length <= 12
				@word_list << word
			end
		end
		return @word_list
	end

	def random_word(list)
		a = list.sample
		a = a.gsub("\n", "")
		return a
	end

	def convert_word(word)
		@clue = @word.downcase.split("")
		@word_display_array = "_______________".split("")
		@word_display_array = @word_display_array[0, @clue.length]
		#@word_display = @word_display_array.join(" ")
	end

	def play
		puts "Here is your clue: \n"
		puts "You have #{@guesses} guesses left. \n\n"
		puts @word_display_array.join(" ")

		while @guesses > 0
			puts ""
			puts "Please enter a letter or word: "
			input = gets.chomp
			puts ""
			take_guess(input)
		end		
		end_game
	end

	def take_guess(input)
		@guesses -= 1

		if input.length == 1
			list_of_guesses(input)
			evaluate_guess(input)
			return_update
		elsif input.upcase == "SAVE"
			save_game
		elsif input.upcase == "OPEN"
			load_game
		elsif input.length > 1
			correct_guess(input)

		else
			correct_guess(input)
		end
	end

	def list_of_guesses(letter)
		@list = @list.insert(@list.length, letter)
		return @list
	end

	def evaluate_guess(letter)
		@clue.each_with_index do |x, i|
			@word_display_array[i] = x if x == letter
		end
	end

	def correct_guess(word)
		if word.eql?(@clue.join(""))
			puts "You won!"
			exit
		else
			puts "\n Sorry that guess is wrong. \n"
			return_update
		end
	end

	def return_update
			print @word_display_array.join(" ")
			puts ""
			print "You have guessed #{@list.join(", ")} and have #{@guesses} guesses left. \n"
	end

	def end_game
		puts "Sorry but you are out of guesses. The word was #{@word}. Good bye."
		exit
	end
end

def save_game
	Dir.mkdir('games') unless Dir.exist? 'games'
	@filename = 'games/saved_game.yaml'
	File.open(@filename, 'w') do |file|
		file.puts YAML.dump(self)
	end
	puts "Your game has been saved as #{@filename}"
	exit
end

def load_game
	content = File.open('games/saved_game.yaml', 'r') {|file| file.read }
	YAML.load(content)
end

#main program
puts "\nWelcome to Hangman.\n"
puts "You can save a game at anytime by entering SAVE"
puts "Enter NEW to start a new game or OPEN to open a saved game."
response = gets.chomp

if response.upcase == "OPEN"
	game = load_game
	game.return_update
elsif response.upcase == "NEW"
	game = Game.new
end

game.play

