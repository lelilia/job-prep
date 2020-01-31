# https://leetcode.com/problems/pascals-triangle-ii/

require_relative 'assert'

# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
    line = [1]
    while row_index > 0
    	new_line = [1]
    	(0..line.length-2).each do |i|
    		new_line.push line[i]+line[i+1]
    	end
    	new_line.push 1
    	line = new_line
    	row_index -= 1
    end
    return line
end



def run_tests
	n = 4
	desc = n.to_s
	result = get_row(n)
	correct = [1,4,6,4,1]
	assert(desc, result, correct)

	n = 0
	desc = n.to_s
	result = get_row(n)
	correct = [1]
	assert(desc, result, correct)

	n = 3
	desc = n.to_s
	result = get_row(n)
	correct = [1,3,3,1]
	assert(desc, result, correct)
end

run_tests