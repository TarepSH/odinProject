class Mastermind

   def initialize
      @colors = ["BLACK", "WHITE", "RED", "YELLOW", "GREEN"]
   	  @guesses = 0
   	  @max_guesses = 12

   	  welcome
   end

   def welcome
       puts "Welcome to MasterMind. Would you like to play a game?"
   	   response = gets.chomp.upcase

   	   validate_guess(response)

   	    if response == "YES"
   	    	puts ""
   		    get_name
   	    else
   	    	exit_game
   	    end
   end

   def validate_guess(response)
   	@response = response   	  

   	until response == "YES" || response == "NO"
   	   	puts ""
   	   	puts "Sorry I didn't recognize that, please enter yes or no."
   	   	response = gets.chomp.upcase
   	   	guesses = guesses + 1
   	   end
   	end


   def get_name
       puts "What is your name?"
   	   @name = gets.chomp
   	   puts ""
   	   view_instructions
   end

   def view_instructions
   	   puts "#{@name} do you know how to play Mastermind?"
   	   response = gets.chomp.upcase

   	   validate_guess(response)

   	   if response == "YES"
   	      start_game
   	   else if response == "NO"
   	   	  show_instructions
   	   	end
   	   end
   	end

   	def start_game
   		@a = Game.new
   	    @new_code = @a.new_code
   	    take_guess
   	end

   def show_instructions
   	puts ""
       puts "Would you like to view instructions?"
       response = gets.chomp.upcase

       if response == "YES"
          instructions
          puts ""
          puts "Would you like to play?"
          new_response = gets.chomp.upcase
          if new_response == "YES"
          	start_game
          else
          end
       else
       	puts ""
       	  puts "Enter \"play\" to play a game or \"exit\" to leave the game"
       	  playexitresponse = gets.chomp.upcase

       	  if playexitresponse == "PLAY"
       	  	play_game
       	  elsif playexitresponse == "EXIT"
       	  	exit_game
       	  else
       	  	puts "Sorry I didn't recognize that input."
       	  	show_instructions
       	  end
       end
   end #end show_instructions method

   	def exit_game
      	puts ""
      	puts "Thank you for checking out Mastermind. Good Bye"
      	puts ""
      	puts ""
      	exit
    end

    def instructions
    	puts ""
   		puts "During this game you will be asked to break a code consisting of four four randomly chosen colors. Hints will be provided. You have 13 rounds to guess. If you guess correctly you win. If not, you will lose. Enjoy!"
    	puts ""
    	puts "After each guess you will be provided with either a red indicator peg (correct color and position), a white indicator peg (correct color, incorrect position) or a blank response (incorrect color)."

    end

    def take_guess
    	while @guesses < @max_guesses
    		@guesses = @guesses + 1
   			puts "Please take a guess: "
   			@guess = gets.chomp.upcase.split(", ")
   			check_valid(@guess)
   			puts ""
   			puts "You have #{@max_guesses - @guesses} guesses left."
   			puts ""
   		end
   	end

   	def check_valid(guess)
		#@colors = @colors.join(", ")
		#@colors.split(", ")
		#puts @guess

   		if guess.count == 4 && guess.all? {|x| @colors.include?(x)}
   			evaluate_guess(@guess, @new_code)
   		else
   			incorrect_entry
   		end
   	end

   	def evaluate_guess(guess, code)

   		if guess.eql?(code)
   			announce_winner
   		else
   			puts ""
   			for i in 0..(guess.length-1)
   				if guess[i] == code[i]
   					puts "Red Indicator Peg for #{guess[i]}"
   				elsif
   					code.include?(guess[i])
   					puts "White Indicator Peg for #{guess[i]}."
   				else
   					puts "BLANK"
   				end
   			i += 1
   			end
   		end
   	end


   	def announce_winner
   		puts "You won!"
   		new_game?
   	end

   	def new_game?
   		@guesses = 0
   		puts ""
   		puts "Would you like to play again? Please enter yes or no."
   		response = gets.chomp.upcase

   		until response == "YES" || response == "NO"
   			puts "We're sorry we didn't recognize that entry. Please enter yes to play again or no to end your game"
   			response = gets.chomp.upcase.
   		end

   			if response == "YES"
   				puts "A new code has been generated. You have 13 guesses!"
   				new_game
   			elsif response == "NO"
   				puts "Your game is over. Good bye!"
   				puts ""
   				puts ""
   				exit
   			end
   		end
   	end

   	def incorrect_entry
   		puts "Sorry but your guess was not accepted. Guesses must include four entries and can only include these colors: #{@colors.join(", ").downcase}."
   	end

   	def max_guesses
   		return 13
   	end

   class Game
   	attr_accessor :new_code

   		def initialize
   	   	@colors = ["BLACK", "WHITE", "RED", "YELLOW", "GREEN"]
   	   	@new_code = @colors.sample(4)
   	   	puts ""
   	   	end

   end #end play_game method

end #end Mastermind class

a = Mastermind.new #start a new game