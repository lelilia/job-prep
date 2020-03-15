# https://leetcode.com/problems/min-stack/

class MinStack

=begin
    initialize your data structure here.
=end
    def initialize()
        @stack = []
    end


=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
        @stack << x
    end


=begin
    :rtype: Void
=end
    def pop()
        @stack = @stack[0..-2]


    end


=begin
    :rtype: Integer
=end
    def top()
        return @stack[-1]
    end


=begin
    :rtype: Integer
=end
    def get_min()
        return @stack.min
    end


end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()