# https://leetcode.com/problems/longest-substring-without-repeating-characters/
require_relative 'assert'

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
	s_length = s.length
    return s_length if s_length < 2
    max_length_substring = 1
    start_point = 0
    end_point = 0
    while end_point < s_length-1
    	if s[start_point..end_point].include?(s[end_point+1])
    		start_point += 1
    	else
    		end_point += 1
    		max_length_substring = [max_length_substring, (end_point - start_point+1)].max 

    	end

    end
    return max_length_substring
end

def run_tests
	
	assert("abcabcbb", length_of_longest_substring("abcabcbb"),3)
	assert("bbbbb", length_of_longest_substring("bbbbb"),1)

	assert("empty",length_of_longest_substring(""),0)
	assert("one letter", length_of_longest_substring("a"),1)
	assert("all", length_of_longest_substring("abc"),3)
end
run_tests