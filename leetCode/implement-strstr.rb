# https://leetcode.com/problems/implement-strstr/
# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
	return 0 if needle == ""
	(0..haystack.length - needle.length).each do |i|
		if haystack[i..i+needle.length-1] == needle
			return i
		end
	end
    return -1
end



def run_tests
	desc = 'hello - ll'
	result = str_str("hello", "ll")
	correct = 2
	assert(desc, result, correct)

	desc = "aaaaa - bba"
	result = str_str("aaaaa","bba")
	correct = -1
	assert(desc, result, correct)

	desc = "a - ''"
	result = str_str("a","")
	correct = 0
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end

run_tests