def stock_picker(array)
    result = 0
    new_array = []
    final_array = []
    values_array = []
    result_array = []
    
	array.each do |value|
	   i = 1
	    
	   while array.index(value) + i < array.length do
	        second_value = array[array.index(value) + i].to_i
	        result = second_value - value
	        values_array << [array.index(value), array.index(second_value)]
	        result_array << [result]
	            
    	    i = i+1
	   end
	end
	
	final_array = result_array.zip(values_array).max.to_a
	final_array[1]
end