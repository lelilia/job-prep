# https://leetcode.com/problems/same-tree/

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}

# make array from tree -> did not need this at all but will leave it coz it works 
def build_array(root)
	arr = []
	q = []
	q.push root
	while q != []
		current = q.shift
		if current.left != nil
			q.push current.left 
		end
		if current.right != nil
			q.push current.right
		end
		arr.push current.val
	end
	return arr
end

# build tree from array
def build_tree(arr, root, i, n)
	if i < n
		root = TreeNode.new(arr[i])
		root.left = build_tree(arr, root.left, i*2+1, n)
		root.right = build_tree(arr, root.right, i*2+2, n)
	end
	return root
end


# compare two binary trees
def is_same_tree(p, q)
	if (p == nil) ^ (q == nil) 
		return false
	end
	q1 = []
	q2 = []
	q1.push p
	q2.push q
	while q1 != [] and q2 != []
		c1 = q1.shift
		c2 = q2.shift
		if c1 == nil and c2 == nil
		elsif (c1 == nil) ^ (c2 == nil)
			return false
		elsif c1.val != c2.val
			return false
		else
			q1.push c1.left
			q1.push c1.right
			q2.push c2.left
			q2.push c2.right
		end
	end
	if q1 != [] or q2 != []
		return false
	end
	return true
    
end



def run_tests
	desc = "Example 1"
	arr1 = [1,2,3]
	arr2 = [1,2,3]
	result = is_same_tree(build_tree(arr1,nil,0,arr1.length), build_tree(arr2,nil,0,arr2.length))
	correct = true
	assert(desc,result,correct)

	desc = "Example 2"
	arr1 = [1,2]
	arr2 = [1, nil, 2]
	result = is_same_tree(build_tree(arr1,nil,0,arr1.length), build_tree(arr2,nil,0,arr2.length))
	correct = false
	assert(desc,result,correct)

	desc = "Example 3"
	arr1 = [1,2,1]
	arr2 = [1,1,2]
	result = is_same_tree(build_tree(arr1,nil,0,arr1.length), build_tree(arr2,nil,0,arr2.length))
	correct = false
	assert(desc,result,correct)

	desc = "Example 4"
	arr1 = []
	arr2 = [0]
	result = is_same_tree(build_tree(arr1,nil,0,arr1.length), build_tree(arr2,nil,0,arr2.length))
	correct = false
	assert(desc,result,correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end


run_tests


