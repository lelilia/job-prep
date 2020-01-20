# https://leetcode.com/problems/merge-sorted-array/

# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
	return nums1 if n == 0
    k = m + n - 1
    i = m - 1
    j = n - 1
    while k >= 0
    	if j < 0
    		nums1[k] = nums1[i]
    		i -= 1
    	elsif i < 0
    		nums1[k] = nums2[j]
    		j -= 1
    	elsif nums1[i] > nums2[j] 
    		nums1[k] = nums1[i]
    		i -= 1 
    	else
    		nums1[k] = nums2[j]
    		j -= 1 
    	end
    	k -= 1
    end
    return nums1		
end

def run_tests
	desc = "negative numbers"
	result = merge([-1, 0, 0, 3, 3, 3, 0, 0, 0], 6, [1,2,2], 3)
	correct = [-1, 0, 0, 1, 2, 2, 3, 3, 3]
	assert(desc, result, correct)

	desc = "empty 1"
	result = merge([0,0,0,0,0], 0, [1,2,3,4,5], 5)
	correct = [1,2,3,4,5]
	assert(desc, result, correct)

	desc ="test"
	result = merge([2,0],1,[1],1)
	correct = [1,2]
	assert(desc, result, correct)

	desc = "[1,2,3,0,0,0] + [2,5,6]"
	result = merge([1,2,3,0,0,0],3,[2,5,6],3)
	correct = [1,2,2,3,5,6]
	assert(desc, result, correct)

	desc = "short one"
	result = merge([1,2,3,0,0,0],3,[1,2,3],3)
	correct = [1,1,2,2,3,3]
	assert(desc, result, correct)

	desc = "longer one"
	result = merge([1,2,3,4,5,6,7,8,0,0,0,0,0,0,0,0], 8, [1,2,3,4,5,6,7,8], 8)
	correct = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]
	assert(desc, result, correct)

	desc = "one is empty"
	result = merge([1],1,[], 0)
	correct = [1]
	assert(desc, result, correct)

	desc = "first is empty"
	result = merge([0],0,[1],1)
	correct = [1]
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end

run_tests