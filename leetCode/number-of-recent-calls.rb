# https://leetcode.com/problems/number-of-recent-calls/

require_relative 'assert'

class RecentCounter
    def initialize()
        @array = []
    end


=begin
    :type t: Integer
    :rtype: Integer
=end
    def ping(t)
        @array << t 
        while @array[0] < t - 3000
        	@array.shift
        end
        return @array.length

    end


end

# Your RecentCounter object will be instantiated and called as such:
# obj = RecentCounter.new()
# param_1 = obj.ping(t)

