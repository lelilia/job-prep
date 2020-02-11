# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

class Solution

=begin
    @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node.
    :type head: ListNode
=end
    def initialize(head)
        @vals = []
        while head != nil
        	@vals.push head.val
        	head = head.next
        end
    end


=begin
    Returns a random node's value.
    :rtype: Integer
=end
    def get_random()
        random = rand(0..@vals.length-1)
        return @vals[random]
    end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(head)
# param_1 = obj.get_random()

head = ListNode.new(1)
head.next = ListNode.new(2)
head.next.next = ListNode.new(3)
p head 

solution = Solution.new(head)
p solution.get_random