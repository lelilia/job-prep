# https://leetcode.com/problems/add-two-numbers
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    res = ListNode.new(0)
    dup = res
    add = 0 
    while l1 != nil or l2 != nil
        if l1 != nil
            val1 = l1.val
        else
            val1 = 0
        end
        if l2 != nil
            val2 = l2.val
        else
            val2 = 0
        end
        
        dup.next = ListNode.new((val1 + val2+ add)%10 )
        if (val1 + val2 + add)/10 == 1
            add = 1
        else
            add = 0
        end
        dup = dup.next
        l1 = l1.next if l1 != nil
        l2 = l2.next if l2 != nil
    end
    if add == 1
        dup.next = ListNode.new(1)
    end
    return res.next
end


