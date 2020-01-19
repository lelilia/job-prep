# https://leetcode.com/problems/count-and-say/

# @param {Integer} n
# @return {String}
def count_and_say(n)
    res = [1]
    while n > 1
    	i = j = 0
    	new = []
    	while i < res.length
    		while res[i] == res[j]
    			j += 1
    		end
    		new.push j - i 
    		new.push res[i]
    		i = j 
    		j = j+1
    	end
    	n -= 1
    	res = new
    end
    return res.join("")
end



def run_tests
	desc = "Example 1"
	result = count_and_say(1)
	correct = "1"
	assert(desc, result, correct)

	desc = "Example 2"
	result = count_and_say(4)
	correct = "1211"
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct} "}"
end

run_tests