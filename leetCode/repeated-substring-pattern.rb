require_relative 'assert'

# @param {String} s
# @return {Boolean}
def repeated_substring_pattern(s)
    (0..s.length/2-1).each do |i|
    	times = s.length / (i+1)
    	return true if s == s[0..i]*times
    end
    return false
end

def run_tests
	desc = "abab"
	result = repeated_substring_pattern(desc)
	correct = true
	assert(desc, result, correct)

	desc = "aba"
	result = repeated_substring_pattern(desc)
	correct = false
	assert(desc, result, correct)
end
run_tests