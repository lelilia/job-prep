require_relative 'assert'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search(nums, target)
    return false if nums.length == 0

    if nums[0] < target 
    	# look from the beginning
    	i = 0
    	while nums[i] <= target 
    		return true if nums[i] == target
    		return false if i == nums.length-1
    		i += 1
    	end

    elsif nums[0] > target
    	# look from the back
    	i = nums.length-1
    	while nums[i] >= target
    		return true if nums[i] == target
    		return false if i == 0
    		i -= 1
    	end
    else
    	# equal
    	return true
    end
    
    return false
end

def run_tests
	assert('test1', search([2,5,6,0,0,1,2],0), true)

	assert('test2', search([2,5,6,0,0,1,2],3), false)

	assert('empty', search([],2), false)

	assert('test3', search([2,5,6],2), true)

	assert('test4', search([2,5,6],5), true)

	assert('test5', search([1],0), false)

	assert('test6', search([1],2), false)

	assert('test7', search([1,3], 3), true)
end

run_tests