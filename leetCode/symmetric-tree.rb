# https://leetcode.com/problems/symmetric-tree/

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
def is_symmetric(root)
	# empty trees are always symmetrical
	return true if root == nil
	left = [root.left]
	right = [root.right]
	while left != [] and right != []	
		n = left.length-1
		(0..n).each do |i|
			if (left[i] == nil) ^ (right[n-i] == nil)
				return false
			elsif (left[i] == nil) and (right[n-i] == nil)
			elsif left[i].val != right[n-i].val
				return false
			end
		end
		left =  make_layer(left)
		right = make_layer(right)
	end
    return true
end

# go through the tree layer by layer to compare them
def make_layer(layer)
	new_layer =[]
	while layer != []
		c = layer.shift
		if c != nil
			new_layer.push c.left 
			new_layer.push c.right
		end
	end
	return new_layer
end

# build tree from array
def build_tree(arr, root, i)
	n = arr.length
	if i < n
		root = TreeNode.new(arr[i])
		root.left = build_tree(arr, root.left, i*2+1)
		root.right = build_tree(arr, root.right, i*2+2)
	end
	return root
end

def run_tests
	desc = "[1,2,2,3,4,4,3]"
	tree_array = [1,2,2,3,4,4,3]
	result = is_symmetric(build_tree(tree_array, nil, 0))
	correct = true
	assert(desc, result, correct)

	desc = "[1,2,2,nil,3,nil,3]"
	tree_array = [1,2,2,nil,3,nil,3]
	result = is_symmetric(build_tree(tree_array, nil, 0))
	correct = false
	assert(desc, result, correct)

	desc = "[]"
	tree_array = []
	result = is_symmetric(build_tree(tree_array, nil, 0))
	correct = true
	assert(desc, result, correct)

	desc = "[1]"
	tree_array = [1]
	result = is_symmetric(build_tree(tree_array, nil, 0))
	correct = true
	assert(desc, result, correct)

	
	tree_array = [1,2,2,3,4,4,3,5]
	desc = tree_array.to_s
	result = is_symmetric(build_tree(tree_array, nil, 0))
	correct = false
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end

run_tests