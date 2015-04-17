def add(a, b)
	a + b
end

def subtract(a, b)
	a - b
end

def sum(array)
	if array.length == 0
		0
	else
		sum = 0
		array.each {|a| sum+=a}
		return sum
	end
end

def multiply(*args)
	result = 1
	args.each {|args| result = result * args }
	result
end