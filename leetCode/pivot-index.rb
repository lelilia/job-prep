require_relative 'assert'

# @param {Integer[]} nums
# @return {Integer}
def pivot_index(nums)
    return -1 if nums == []
    left = 0
    right = nums.sum - nums[0] 
    (0..nums.length-1).each do |i|
    	return i if left == right
    	left += nums[i]

    	right -= nums[i+1] if i < nums.length-1
    end
    return -1
end

def run_tests
	desc ="test1"
	result = pivot_index([1,7,3,6,5,6])
	correct = 3
	assert(desc, result, correct)

	desc = "test2"
	result = pivot_index([1,2,3])
	correct = -1
	assert(desc, result, correct)

	desc = "test3"
	result = pivot_index([])
	correct = -1
	assert(desc, result, correct)

	desc = "test4"
	result = pivot_index([-1,-1,0,1,1,0])
	correct = 5
	assert(desc, result, correct)
end

run_tests