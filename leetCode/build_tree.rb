
# this function builds a tree with only the list given by callig the recursive function that needs more input 
def build_tree(list)
	# empty list => empty tree
	return nil if list == [] 
	return build_tree_recursive(list, nil, list.length, 0)
end

# recursively building a binary tree from a list of values
def build_tree_recursive(list, root, list_length, i)
	#base case
	return nil if list[i] == nil
	if i < list_length 
		root = TreeNode.new(list[i])
		root.left = build_tree_recursive(list, root, list_length, 2*i + 1)
		root.right = build_tree_recursive(list, root, list_length, 2*i + 2)
	end
	return root
end