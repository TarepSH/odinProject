require 'spec_helper'

describe Ceaser_Cipher do

	before :each do
		@ceaser = Ceaser_Cipher.new
	end

	describe "#ceasercipher" do
		it "requires two parameters" do
		expect { @ceaser.ceasercipher }.to raise_error(ArgumentError)
		end
	end

end