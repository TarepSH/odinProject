def substrings(phrase, dictionary)
    @dictionary = dictionary.join(", ").downcase
    phrase = phrase.downcase
    
    hash = {}
    
    dictionary.each do |word|
        if phrase.scan(word).length > 0
            hash[word] = phrase.scan(word).length
        #puts "This word #{word} was found #{phrase.scan(word).length} times"
        end
    end
    puts hash
end