def ftoc(temp)
	if temp == 32
		return 0
	end
	if temp == 212
		return 100
	end
	if temp != 21 or temp != 212
		return ((temp-32)*5)/9.0
	end
end

def ctof(temp)
	if temp == 0
		return 32
	end
	if temp == 100
		return 212
	end
	if temp!= 0 or temp != 100
		return ((temp*9)/5.0) + 32.0
	end
end