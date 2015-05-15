require 'spec_helper'

describe Ceaser do
	
	before :each do
		@ceaser = Ceaser.new("and", 1)
	end	

	describe "#new" do
		it "creates an instance of Ceaser" do
			expect(@ceaser).to be_a Ceaser
		end
	end

	describe "#new" do
		it "requires two arguments" do
			expect {ceaser = Ceaser.new }.to raise_error(ArgumentError)
		end
	end

	describe "#new" do
		it "converts word correctly" do
			expect { @ceaser.new_string} == "boe"
		end
	end

	describe "#new" do
		before :each do 
			ceaser = Ceaser.new("And", 1)
		end

		it "converts words with capital letters correctly" do
			expect { ceaser.new_string } == "Boe"
		end
	end

	describe "#new" do
		it "converts words that require looping through the end of the alphabet" do
			expect { ceaser = Ceaser.new("zzz", 1)} == "aaa"
		end
	end

	describe "#new" do
		it "converts words that have capitals and that loop through the end of the alphabet" do
			expect { ceaser = Ceaser.new("ZZZZZZZZZ", 2)} == "BBBBBBBBB"
		end
	end
 
end