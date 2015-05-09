#Brute Force
def merge_sort(array)
	first = array[0..array.length/2].sort
	second = array[array.length/2+1..-1].sort
	length = first.length + second.length
	final = []

	while final.length < length
		if first.length == 0 || second.length == 0
			if first.length == 0
				final << second[0]
				second = second[1..-1]
			else
				final << first[0]
				first = first[1..-1]
			end
		elsif first[0] < second[0]
			final << first[0]
			first = first[1..-1]
		elsif first[0] > second[0]
			final << second[0]
			second = second[1..-1]
		end
	end
	print final
end

print merge_sort([5,4,7,8,12,9,0,34,78,3,56])

# Recursive
def merge_sort(array, final = [])
	if array.length > 1
		first = array[0..array.length/2-1].sort
		second = array[array.length/2..-1].sort
		working_array = []

		if first[0] < second[0]
			final << first[0]
			working_array = first[1..-1] + second
		elsif
			final << second[0]
			working_array = second[1..-1] + first
		end
		merge_sort(working_array, final)
	else
		final << array[0]
		final
	end
end

p merge_sort([5,4,6,9,82,99,1,0,100,1000,5])
