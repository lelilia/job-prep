

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
# @param {Integer} x
# @param {Integer} y
# @return {Boolean}
def is_cousins(root, x, y)
	# the root does not have any cousins
	return false if root.val == x || root.val == y
	# empty tree does not have any nodes so also no cosins
	return false if root == nil
    queue = [root]
    length_this_level = 1
    length_next_level = 0
    while queue != []
    	current = queue.shift
    	if current.right != nil && current.left != nil
    		# check if they are siblings
    		return false if current.left.val == x && current.right.val == y || current.left.val == y && current.right.val == x
    	end
    	# current is either x or y => look if the other cousin is in the queue
    	if current.val == x || current.val == y 
    		(0..length_this_level-2).each do |i|
    			return true if queue[i].val == x || queue[i].val == y 
    		end
    		return false 
    	end

    	if current.left != nil
    		queue.push current.left 
    		length_next_level += 1
    	end
    	if current.right != nil
    		queue.push current.right
    		length_next_level += 1
    	end
    	length_this_level -= 1
    	if length_this_level == 0
    		length_this_level = length_next_level
    		length_next_level = 0
    	end
    end
end