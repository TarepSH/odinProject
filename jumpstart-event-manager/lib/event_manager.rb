require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

#Clean up zipcodes
def verify_zip(zip)
	zip.to_s.rjust(5, "0")[0..4]
end

#Get information on legislators by zip from Sunlight
def legislators(zip)
	Sunlight::Congress::Legislator.by_zipcode(zip)
end

#Create output directory and an html template for each attendee
def save_results(id, form_letter)
	Dir.mkdir("output") unless Dir.exists?("output")

	filename = "output/thanks_#{id}.html"

	File.open(filename, 'w') do |file|
		file.puts form_letter
	end
end

#Clean phone numbers of non-numeric characters and clear out all bad numbers that are less than 10 digits or more than 10 digits. 
def clean_numbers(number)
	num = number.gsub!(/\D/, "")

	if num.nil?
		return ""
	elsif num.length < 10
		return ""
	elsif num.length == 10
		return num
	elsif num.length == 11 && num[0].eql?(1)
		num = num.strip!(0, 1)
		return num
	elsif num.length == 11
		return ""
	else
		return ""
	end
end


#Check to see if the CSV file exists
if File.exist? "event_attendees.csv"

	#open file
	contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
	
	#open template and create anew ERB template file
	template_letter = File.read "form_letter.erb"
	erb_template = ERB.new template_letter

	#run through the contents of the file row by row
	contents.each do |row|
		id = row[0]
		name = row[:first_name]

		zipcode = verify_zip(row[:zipcode])
		
		legislators = legislators(zipcode)

		phone = clean_numbers(row[:homephone])

		#output data
		print "#{name}, #{zipcode}, #{phone} \n"

		#Uncomment the next three lines to save the output to the ERB form letter
		#form_letter = erb_template.result(binding)	
		#puts form_letter
		#save_results(id, form_letter)

	end
else
	puts "Oops, that file does not exist."
end
