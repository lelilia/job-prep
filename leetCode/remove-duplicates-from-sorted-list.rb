# https://leetcode.com/problems/remove-duplicates-from-sorted-list/

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}

def delete_duplicates(head)
	i = head
	j = head
	while i != nil
		if j == nil
			i.next = nil
			return head
		elsif i.val == j.val
			j = j.next
		elsif i.val < j.val
			i.next = j
			i = i.next
			j = j.next
		end
	end
	return head
end

def build_list(arr)
	return nil if arr == []
	l = ListNode.new(0)
	list = l
	arr.each do |element|
		l.next = ListNode.new(element)
		l = l.next
	end
	return list.next
end

def array_list(l)
	return [] if l == nil
	arr = []
	while l != nil
		arr.push l.val
		l = l.next
	end
	return arr 
end


def run_tests
	desc = "1->2->3->4"
	result = array_list(delete_duplicates(build_list([1,2,3,4])))
	correct = [1,2,3,4]
	assert(desc, result, correct)

	desc = "1->1->2"
	result = array_list(delete_duplicates(build_list([1,1,2])))
	correct = [1,2]
	assert(desc, result, correct)

	desc = "1->1->2->3->3"
	result = array_list(delete_duplicates(build_list([1,1,2,3,3])))
	correct = [1,2,3]
	assert(desc, result, correct)

	desc = "[]"
	result = array_list(delete_duplicates(build_list([])))
	correct = []
	assert(desc, result, correct)

	desc = "1->1->1"
	result = array_list(delete_duplicates(build_list([1,1,1])))
	correct = [1]
	assert(desc, result, correct)
end

def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL: #{result} is not #{correct}"}"
end




run_tests

