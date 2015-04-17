def bubble_sort(array)
	return array if array.size <= 1

	x = true

	while x do
		0.upto(array.size-2) do |i|
			x = false

			if yield(array[i], array[i+1]) < 1
				array[i], array[i+1] = array[i+1], array[i]
				x = true
			end
		end
	end
	return array
		
end