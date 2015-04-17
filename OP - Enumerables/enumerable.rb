module Enumerable
	def my_each
	return self unless block_given?	
		
	for i in self
		yield(i)
	end
	
	end

	def my_each_with_index
		return self unless block_given?
		my_each {|i| yield(i, self.index(i)) if i < self.length}

	end

	def my_select
		return self unless block_given?

		new_array = []
		my_each {|i| new_array << i if yield(i)}
	end

	def my_all?

		if block_given?
			my_each {|i| return false unless yield(i)}
		else
			my_each {|i| return false unless i}
		end
	end

	def my_any?
		#return false unless block_given?

		if block_given?
			my_each {|i| return true if yield(i)}
		else
			my_each {|i| return true if i}
		end
	end

	def my_none?

		if block_given?
			my_each {|i| return true unless yeild(i)}
		else
			my_each {|i| return true unless i}
		end
	end

	def my_count(num = nil)
		count = 0

		if num == nil && !block_given?
			my_each {|i| count = count + 1}
			return count
		end
		if num != nil && !block_given?
				my_each {|i| count = count + 1 if num == i}
				return count
		end
		if block_given?
			my_each {|i| count = count + 1}
			yield(count)
		end

	end

	def my_map someProc

		new_array = []
		if someProc
			my_each{|i| new_array << someProc.call(i)}
			return new_array
		else
			return self
		end
	end

	def my_inject(num = nil)
		total = num.nil? ? first : num
		my_each{|i| total = yield(total, i)}
		return total

	end

end

def multiply_els(array)
	array.my_inject(1) {|product, i| product * i}
end
