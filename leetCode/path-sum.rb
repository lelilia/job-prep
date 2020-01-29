# https://leetcode.com/problems/path-sum/

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Boolean}


def has_path_sum(root, sum)
	if root == nil
		return false
	else
		ans = false
		if sum - root.val == 0 and root.left == nil and root.right == nil
			return true
		end
		if root.left != nil
			path = has_path_sum(root.left, sum - root.val)
			ans = ans || path
		end
		if root.right != nil
			path = has_path_sum(root.right, sum - root.val)
			ans = ans || path
		end
		return ans
	end
end

