require 'jumpstart_auth'
require 'bitly'

Bitly.use_api_version_3

class MicroBlogger
	attr_reader :client

	def initialize
		#@puts "Initializing MicroBlogger"
		@client = JumpstartAuth.twitter
	end

	def run
		puts "Welcome to the JSL Twitter client!"
		command = ""
		while command != "q"
			printf "enter command: "
			input = gets.chomp

			parts = input.split(" ")
			command = parts[0]
			post = parts[1..parts.length].join(" ")

			case command
			when 'q' then puts "Goodbye!"
			when 't' then tweet(post)
			when 'dm' then dm(parts[1], parts[2..-1].join(" "))
			when 'elt' then everyones_last_tweet
			when 'spam' then spam_my_followers(parts[2..-1].join(" "))
			when 's' then shorten(url)
			when 'turl' then tweet(parts[1..-2].join(" "), shorten(parts[-1]))
			else
				puts "Sorry I don't know how to #{command}."
			end
		end
	end

	def followers_list
		screen_names = []
		@client.followers.each {|follower| screen_names << @client.user(follower).screen_name}
		return screen_names
	end

	def spam_my_followers(message)
		followers = followers_list
		followers.each {|follower| dm(follower, message)}
	end

	def everyones_last_tweet
		puts "Made it to the Last Tweet method"
		friends = @client.friends.sort_by {|friend| friend.screen_name.downcase}


		friends.each do |friend|
			timestamp = friend.status.created_at
			puts "Made it to the loop"
			
			tweet = friend.status.text
			print "#{friend.screen_name} said..."
			print "#{tweet} at #{timestamp.srftm("%A, %b, %d")}"
			puts ""
		end
	end

	def tweet(message)
		if message.length <= 140
			@client.update(message)
		else
			print "This message is too long. Please shorten your message and repost."
		end
	end

	def dm(target, message)

		screen_names = @client.followers.collect {|follower| @client.user(follower).screen_name}

		if screen_names.include?(target)
			puts "Trying to send #{target} this message:"
			puts message
			message = "d @#{target} #{message}"
			tweet(message)
		else
			puts "Sorry but you cannot send a message to an account that is not following you."
		end
	end

	def shorten(url)
		bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
		puts "Shortening this URL: #{url}."
		puts bitly.shorten('http://jumpstartlab.com/courses/').short_url
	end
end

blogger = MicroBlogger.new
blogger.tweet("This is a test")
blogger.run
