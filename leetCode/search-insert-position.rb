# https://leetcode.com/problems/search-insert-position/

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
	(0..nums.length - 1).each do |i|
		return i if nums[i] >= target
	end
    return nums.length
end

def run_tests
	desc = "[1,3,5,6], 5"
	result = search_insert([1,3,5,6], 5)
	correct = 2
	assert(desc, result, correct)

	desc = "[1,3,5,6], 2"
	result = search_insert([1,3,5,6], 2)
	correct = 1
	assert(desc, result, correct)

	desc = "[1,3,5,6], 7"
	result = search_insert([1,3,5,6], 7)
	correct = 4
	assert(desc, result, correct)

	desc = "[1,3,5,6], 0"
	result = search_insert([1,3,5,6], 0)
	correct = 0
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end

run_tests