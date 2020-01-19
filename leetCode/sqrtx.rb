# https://leetcode.com/problems/sqrtx/

# @param {Integer} x
# @return {Integer}

def my_sqrt(x)
	# base case
	return x if x < 2
	i = i2 = 1
	while i2 <= x
		i += 1
		i2 = i * i 
	end
	return i-1
end

def run_tests
	desc = "4"
	result = my_sqrt(4)
	correct = 2
	assert(desc, result, correct)

	desc = "8"
	result = my_sqrt(8)
	correct = 2
	assert(desc, result, correct)

	desc = "9"
	result = my_sqrt(9)
	correct = 3
	assert(desc, result, correct)

	desc = "1"
	result = my_sqrt(1)
	correct = 1
	assert(desc, result, correct)

	desc = "0"
	result = my_sqrt(0)
	correct = 0
	assert(desc, result, correct)

	desc = "2"
	result = my_sqrt(2)
	correct = 1
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end

run_tests