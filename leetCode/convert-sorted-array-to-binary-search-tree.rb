# https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

require_relative 'assert'

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
	n = nums.length
	# base cases
	return nil if n == 0
	return TreeNode.new(nums[0]) if n == 1
	# the root has the value in the middle of the array 
	middle = n/2
	start = 0
	endpoint = nums.length-1
	root = TreeNode.new(nums[middle])
	# recursivle call the function on the subtrees
	if start != middle 
		root.left = sorted_array_to_bst(nums[start..middle-1])
	end
	if middle != endpoint
		root.right = sorted_array_to_bst(nums[middle+1..endpoint])
	end
	return root
end



def run_tests
	list = [-10, -3, 0, 5, 9]
	desc = list.to_s 
	result = sorted_array_to_bst(list)
	p desc
	p result

	list = []
	result = sorted_array_to_bst([])
	p list.to_s
	p result

end
run_tests