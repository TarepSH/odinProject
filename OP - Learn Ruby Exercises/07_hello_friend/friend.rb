class Friend

def greeting(*name)
	if name.empty?
		return "Hello!"
	elsif name.one?
		name.each do |i|
			return "Hello, #{i.to_s}!"
		end
	end
end

end