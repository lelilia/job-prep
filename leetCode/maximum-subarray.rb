# https://leetcode.com/problems/maximum-subarray/

# @param {Integer[]} nums
# @return {Integer}

# naive solution that was not fast enough for very long tests
# def max_sub_array(nums)
# 	maxtotal = nums[0]
#     (0..nums.length - 1).each do |i|
#     	maxi = nums[i]
#     	new_sum = maxi
#     	(i+1..nums.length-1).each do |j|
#     		new_sum += nums[j]
#     		maxi = [maxi, new_sum].max
#     	end
#     	maxtotal = [maxtotal, maxi].max
#     end
#     return maxtotal
# end


# the hint said divide and conquer so I googled it and found https://www.geeksforgeeks.org/maximum-subarray-sum-using-divide-and-conquer-algorithm/


def max_crossing_sum(nums, start_point, middle, end_point)
	# include left of middle
	sm = 0
	left_sum = nums[middle]	
	middle.downto(start_point) do |i|
		sm += nums[i]
		left_sum = [left_sum, sm].max 
	end

	# include right of middle
	sm = 0
	right_sum = nums[middle+1] 
	(middle+1 .. end_point).each do |i|
		sm += nums[i]
		right_sum = [right_sum, sm].max 
	end
	return left_sum + right_sum
end

def max_sub_array_part(nums, start_point, end_point)
	# base case : only one element
	if start_point == end_point
		return nums[start_point]
	end

	# find the middle point
	middle = (start_point + end_point) / 2

	# return maximum of the left, right and middle subarray
	return [max_sub_array_part(nums, start_point, middle), 
		    max_sub_array_part(nums, middle + 1, end_point), 
		    max_crossing_sum(nums, start_point, middle, end_point)].max 
end


def max_sub_array(nums)
	return max_sub_array_part(nums, 0, nums.length - 1)
end

def run_tests
	desc = "[-2,1,-3,4,-1,2,1,-5,4]"
	result = max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
	correct = 6
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end

run_tests