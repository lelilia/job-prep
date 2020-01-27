# https://leetcode.com/problems/binary-tree-level-order-traversal-ii/

require_relative 'build_tree'
require_relative 'assert'

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order_bottom(root)
	# exception
	return [] if root == nil
	result = [[root.val]]
	q = [root]
	level = []
	level_length = 1
	while q != []
		current = q.shift
		if current.left != nil
			q.push current.left
			level.push current.left.val
		end
		if current.right != nil
			q.push current.right 
			level.push current.right.val
		end
		level_length -= 1
		if level_length == 0
			result.unshift level if level != []
			level_length = level.length
			level = []
		end

	end
	return result
end


def run_tests
	tree = [3,9,20,nil,nil,15,7]
	desc = tree.to_s
	result = level_order_bottom(build_tree(tree))
	correct = [[15,7],[9,20],[3]]
	assert(desc, result, correct)

	tree = [1, 2, 3, 4, nil, 5, 6, nil, nil,nil, nil, 7, nil, 8]
	desc = tree.to_s
	result = level_order_bottom(build_tree(tree))
	correct = [[7,8], [4, 5, 6], [2, 3], [1]]
	assert(desc, result, correct)

	tree = []
	desc = tree.to_s
	result = level_order_bottom(build_tree(tree))
	correct = []
	assert(desc, result, correct)
end


run_tests