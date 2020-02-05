require_relative 'assert'

# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
	result = [nil]*nums.length
	nums.each do |n|
		result[n-1] = true
	end
	end_result = []
	n = nums.length
	(0..n-1).each do |i|
		if result[i] == nil
			end_result << i+1
		end
	end
	end_result
end

def test(nums)
    n = nums.length
    res = []
    while n >= 1
    	if nums.include?(n) == false
    		res.unshift(n)
    	end
    	n -= 1
    end
    return res
end

def run_tests
	input = [4,3,2,7,8,2,3,1]
	result = find_disappeared_numbers(input)
	correct = [5,6]
	assert("test1",result, correct)

	input = [2,2]
	result = find_disappeared_numbers(input)
	correct = [1]
	assert("test2",result, correct)


end
run_tests