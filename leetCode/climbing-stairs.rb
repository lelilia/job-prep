# https://leetcode.com/problems/climbing-stairs/

# @param {Integer} n
# @return {Integer}

# naive fibonacci numbers
def climb_stairs_slow(n)
	# base case
	return 1 if n < 2

	return climb_stairs_slow(n-1) + climb_stairs_slow(n-2)
    
end

# a bit more clever version: 
# f(i) = f(i-1) + f(i-2) 
# => f(i-1) = f(i-2) + f(i-3) 
# => f(i) = 2*f(i-2) + f(i-3)
def climb_stairs_still_slow(n)
	# base cases
	return 1 if n < 2
	return 2 if n == 2

	return 2 * climb_stairs_still_slow(n-2) + climb_stairs_still_slow(n-3)
end

# https://www.nayuki.io/page/fast-fibonacci-algorithms

# dynamic solution modeled after one would do it by hand

def climb_stairs(n)
	# base cases
	fn1 = 1
	fn2 = 1
	i = 1
	while i < n
		fn1, fn2 = fn1 + fn2, fn1
		i += 1
	end
	return fn1
end


def run_tests
	desc = "2"
	result = climb_stairs(2)
	correct = 2
	assert(desc, result, correct)

	desc = "3"
	result = climb_stairs(3)
	correct = 3
	assert(desc, result, correct)

	assert("4", climb_stairs(4), 5)

	assert("1", climb_stairs(1), 1)

	assert("38", climb_stairs(38), 63245986)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end

run_tests