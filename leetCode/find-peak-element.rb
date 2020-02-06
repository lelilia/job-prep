require_relative 'assert'

# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
	return 0 if nums.length == 1
    (0..nums.length-1).each do |i|
    	if i == 0
    		return i if nums[i+1] < nums[i]
    	elsif i == nums.length-1
    		return i if nums[i-1] < nums[i]
    	else
    		return i if nums[i+1] < nums[i] && nums[i-1] < nums[i]
    	end
    end
end

def run_tests
	desc = "test1"
	input = [1,2,3,1]
	result = find_peak_element(input)
	correct = 2
	assert(desc, result, correct)
end

run_tests