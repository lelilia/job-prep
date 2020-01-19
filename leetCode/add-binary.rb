# https://leetcode.com/problems/add-binary/

# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
	carry_the_one = 0
	res = ""
	while a.length > 0 or b.length > 0
		a, ai = a[0..-2], a[-1]
		b, bi = b[0..-2], b[-1]
		sum = ai.to_i + bi.to_i + carry_the_one

		if sum == 3
			res = "1" + res
			carry_the_one = 1
		elsif sum == 2
			res = "0" + res
			carry_the_one = 1
		elsif sum == 1
			res = "1" + res
			carry_the_one = 0
		else
			res = "0" + res
			carry_the_one = 0
		end
    end
    if carry_the_one == 1
    	return "1" + res
    end
    return res
end

def run_tests
	desc = "11 + 1"
	result = add_binary("11", "1")
	correct = "100"
	assert(desc, result, correct)

	desc = "1010 + 1011"
	result = add_binary("1010", "1011")
	correct = "10101"
	assert(desc, result, correct)

	desc = "100 + 1"
	result = add_binary("100", "1")
	correct = "101"
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end

run_tests