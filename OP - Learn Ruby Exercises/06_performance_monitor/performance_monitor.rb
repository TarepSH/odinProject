def measure(n=1)
	duration = []
	elapsed_time = 0

	n.times do
		start = Time.now
		yield
		stop = Time.now
		elapsed_time = stop - start
		duration << (stop - start)
	end

	return duration.reduce(:+) /n
end