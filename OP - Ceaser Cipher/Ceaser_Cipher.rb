def ceasercipher(input, value)
     value = value.to_i
     alphabet = "abcdefghijklmnopqrstuvwxyz"
     uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
     input_array =  input.split(//).to_a
     alph_array =  alphabet.split(//).to_a
     uppercase = uppercase.split(//).to_a
     new_string = input
     alph_ln = alph_array.length
     
     
    input.split("").each do |j|
        
            alph_array.each do |i|
                    if j.eql?(i.to_s.upcase) && (alph_array.index(i)+value < alph_array.length)
                        new_string[input.index(j)] = alph_array[alph_array.index(i)+value].upcase
                    end
                    
                    if j.eql?(i.to_s.upcase) && (alph_array.index(i) + value >= alph_array.length)
                        new_value = (alph_array.index(i) + value) - alph_array.length
                        new_string[input.index(j)] = alph_array[new_value].upcase
                        
                    end

                    if j.eql?(i) && (alph_array.index(i)+value < alph_array.length)
                        new_string[input.index(j)] = alph_array[alph_array.index(i)+value]
                    end
                    
                    if j.eql?(i) && (alph_array.index(i) + value >= alph_array.length)
                        new_value = (alph_array.index(i) + value) - alph_array.length
                        new_string[input.index(j)] = alph_array[new_value]
                        
                    end

            end
            
     end
     print "New Encoded String = " + new_string
     
 
end