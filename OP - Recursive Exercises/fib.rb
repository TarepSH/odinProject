def fibs (n)
	fib_array = [0, 1]

	print fib_array[0] if n == 0
	print fib_array if n == 1

	if n >=2
		until fib_array.length - 1 == n
			fib_array << (fib_array[-1] + fib_array[-2])
		end
	print fib_array
	end
end

fibs(2)

def fibs_rec(n, array = [0,1])
	return array[0] if n == 0
	return array if n == 1 || array.length > n
	fibs_rec(n, (array << (array[-1] + array[-2])))

end

print fibs_rec(10)