require_relative 'assert'

require 'set'
# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
	n = nums.length/3
	result = []
	count = {}
	nums.each do |num|
		count[num] ||= 0
		count[num] += 1
		result << num if count[num] > n and result.include?(num) == false
	end
	return result 

end


def run_tests
	input = [3,2,3]
	result = majority_element(input)
	correct = [3]
	assert(input.to_s, result, correct)

	input = []
	result = majority_element([])
	correct = []
	assert(input.to_s, result, correct)

	input = [0,-1,2,-1]
	result = majority_element(input)
	correct = [-1]
	assert(input.to_s, result, correct)
end
run_tests