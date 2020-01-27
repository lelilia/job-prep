# https://leetcode.com/problems/maximum-depth-of-binary-tree/

require_relative 'build_tree'

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}



def max_depth(root)
    # base case
    return 0 if root == nil

    return [max_depth(root.left)+1, max_depth(root.right)+1].max 

end

def run_tests
	tree = [3,9,20, nil, nil, 15, 7]
	desc = tree.to_s
	result = max_depth(build_tree(tree))
	correct = 3
	assert(desc, result, correct)

	tree = [1,2,3,4,5,6,7,8,9,10]
	desc = tree.to_s
	result = max_depth(build_tree(tree))
	correct = 4
	assert(desc, result, correct)

	tree = []
	desc = tree.to_s
	result = max_depth(build_tree(tree))
	correct = 0
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS': "FAIL: #{result} is not #{correct}"}"

end

run_tests