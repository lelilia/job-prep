require_relative 'assert'

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
	i = 0
	j = nums.length-1
	while i <= j
		if nums[j] == val
			j -= 1
		else
			if nums[i] == val
				nums[i], nums[j] = nums[j], nums[i]
				i += 1
				j -= 1
			else
				i += 1
			end
		end
	end
	return i

	# return 1 if nums.length == 1 and nums[0] != val
 #    i = 0
 #    j = nums.length-1

 #    while i < j 
 #    	  p "#{i} #{j} #{nums}"
 #    	while nums[j] == val
 #    		j -= 1
 #    		# return 0 if j <= 0
 #    	end
 #    	if nums[i] == val
 #    		nums[i], nums[j] = nums[j], nums[i]
 #    	else
 #    		i += 1
 #    	end
 #    	# i += 1
 #    end
 #    return i 
end

def run_tests
	assert("test1", remove_element([3,2,2,3], 3), 2)

	assert("test2", remove_element([0,1,2,2,3,0,4,2], 2), 5)

	assert("test3", remove_element([1,1,1,1],1),0)

	assert("test4",remove_element([2],3),1)

	assert("test5", remove_element([1],1),0)

	assert("test6", remove_element([4,5],4),1)

	assert("test7", remove_element([3,3],5),2)
end
run_tests
