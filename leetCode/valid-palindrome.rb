# https://leetcode.com/problems/valid-palindrome/

require_relative 'assert'

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
	string = ""
	s.downcase.split("").each do |letter|
		p 
		if ('a'..'z').include?(letter) or ("0".."9").include?(letter)

			string<<letter

		end
	end
    return string == string.reverse
end

def run_tests
	desc = "A man, a plan, a canal: Panama"
	result = is_palindrome(desc)
	correct = true
	assert(desc, result, correct)

	desc = "race a car"
	result = is_palindrome(desc)
	correct = false
	assert(desc, result, correct)

	desc = "0P"
	result = is_palindrome(desc)
	correct = false
	assert(desc, result, correct)
end

run_tests