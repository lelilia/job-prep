# https://leetcode.com/problems/length-of-last-word/

# @param {String} s
# @return {Integer}
def length_of_last_word(s)
    return 0 if s == " "*s.length 
    s = s.split(" ")
    return s[-1].length

end

def run_tests
	desc = "only space"
	result = length_of_last_word("    ")
	correct = 0
	assert(desc, result, correct)

	desc ="single word"
	result = length_of_last_word("Hallo")
	correct = 5
	assert(desc, result, correct)

	desc = "two words"
	result = length_of_last_word("Hallo World")
	correct = 5
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end

run_tests