# https://leetcode.com/problems/minimum-depth-of-binary-tree/

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
def min_depth(root)
	return 0 if root == nil
	q = [root]
	height = 1
	# level_length is the number of nodes left to check on the given height
	level_length = 1
	# new_level_length stores the number of nodes in the next level
	new_level_length = 0
	while q != []
		current = q.shift
		level_length -= 1
		# no children = leaf
		return height if current.left == nil and current.right == nil

		if current.left != nil
			q.push current.left
			new_level_length += 1
		end
		if current.right != nil
			q.push current.right
			new_level_length += 1
		end
		if level_length == 0
			height += 1
			level_length = new_level_length
			new_level_length = 0
		end
	end
    
end