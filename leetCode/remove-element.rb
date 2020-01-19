# https://leetcode.com/problems/remove-element/

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
    numslength = nums.length
    return 0 if numslength == 0
    i = 0
    j = 0
    while i < numslength
    	if nums[i] == val
    		while nums[j] == val 
    			j += 1
    			return i if j == numslength
    		end
    		nums[i], nums[j] = nums[j], nums[i]
    	end
    	i += 1
    	j += 1
    	return i if j == numslength
    end
    return i
end

def run_tests
	desc = 'empty array'
	result = remove_element([], 2)
	assert(result, 0, desc)

	desc = 'delete whole array'
	result = remove_element([1, 1, 1], 1)
	assert(result, 0, desc)

	desc = 'delete nothing'
	result = remove_element([1,2,3], 5)
	assert(result, 3, desc)
end

def assert(result, correct, desc)
	puts "#{desc} ... #{result == correct ? 'PASS' : 'FAIL'}"
end

run_tests
