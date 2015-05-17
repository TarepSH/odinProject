require 'spec_helper'
require_relative '../enumerable.rb'

describe Enumerable do
	
	describe "#my_each" do
		it "returns the same result as the each method" do
			expect { "word".my_each == "word".each}
		end
	end

	describe "#my_any" do
		it "returns true if my_any matches the any method" do
			expect {%[ant bear cat].my_any? {|word| word.length == 3} == true}
		end
	end

	describe "#my_any" do
		it "returns false if there is not match" do
			expect {%[ant bear cat].my_any? {|word| word.length > 5} == false}
		end
	end

	describe "#my_all" do
		it "returns all if every entry in the array meets the requirements set in the block" do
			expect {%[ant bear cat].my_all? {|word| word.length > 3} == true}
		end
	end

	describe "#my_all" do
		it "returns false if any single entry does not meeet the block requirement" do
			expect {%[ant bear cat panda].my_all? {|word| word[0] == "z"} == false}
		end
	end

	describe "#my_count" do 
		it "returns an accurate count of items in an array" do 
			expect {%[me myself and I].my_count == 4}
		end
	end

	describe "#my_count" do
		it "does not return the wrong count of items in an array" do
			expect {%[my myself and I].my_count == 2}
		end
	end

	describe "#my_count" do
		it "returns the correct count when past a block" do
			expect {%[my myself and I].my_count {|word| word.length > 3}  == 1}
		end
	end


end