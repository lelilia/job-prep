# https://leetcode.com/problems/balanced-binary-tree/

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
    result = height(root)
    return false if result ===false
    return true if result.class == Integer
end

def height(root)
	# base case 
	return 0 if root == nil

	left_height = height(root.left)
	right_height = height(root.right)
    return false if (left_height == false) or (right_height == false)
    return false if (left_height - right_height).abs > 1
    return [left_height, right_height].max + 1
end
    
