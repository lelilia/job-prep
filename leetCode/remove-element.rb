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

nums = [2]
val = 2

l = remove_element(nums, val)



p nums
(0..l-1).each do |k|
	print nums[k]
	print " "
end
puts