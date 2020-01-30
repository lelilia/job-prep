# https://leetcode.com/problems/pascals-triangle/

# @param {Integer} num_rows
# @return {Integer[][]}
require_relative 'assert'

def generate(num_rows)
	result = []
	while num_rows > 0
		new_line = [1]
		if result[-1] != nil 
			if result[-1].length > 1
				(1..result[-1].length - 1).each do |i|
					new_line.push result[-1][i-1]+result[-1][i]
					
				end
			end
			new_line.push 1
		end

		
		result.push new_line
		num_rows -= 1
	end
	return result
    
end

def run_tests
	n = 5
	desc = n.to_s
	result = generate(n)
	correct = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
	assert(desc, result, correct)

	n = 0
	desc = n.to_s
	result = generate(n)
	correct = []
	assert(desc, result, correct)
end

run_tests