# https://leetcode.com/problems/plus-one/

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
	# setting carry_the_one to 1 for the first 1 we are adding
	carry_the_one = 1
	# go through the array from the back to the front
	(digits.length-1).downto(0) do |i|
		digits[i] = (digits[i] + carry_the_one) % 10
		# check if we have a 1 to carry
		if digits[i] == 0
			carry_the_one = 1
		else
			carry_the_one = 0
		end
		# break as soon as there is no one to carry because we are done
		return digits if carry_the_one == 0
	end
	# if we did not return during the loop there is still a one to carry so add it to the front
    return digits = [1] + digits
end

def run_tests
	desc = "123"
	input = [1,2,3]
	result = plus_one(input)
	correct = [1,2,4]
	assert(desc, result, correct)

	desc = "129"
	input = [1,2,9]
	result = plus_one(input)
	correct = [1,3,0]
	assert(desc, result, correct)

	desc = "9"
	input = [9]
	result = plus_one(input)
	correct = [1,0]
	assert(desc, result, correct)

	desc = "100"
	input = [1, 0, 0]
	result = plus_one(input)
	correct = [1, 0, 1]
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end

run_tests