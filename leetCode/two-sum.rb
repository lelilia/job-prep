# https://leetcode.com/problems/two-sum/
def two_sum(nums, target)
    (0..nums.length - 2).each do |i|

        (i+1 .. nums.length - 1).each do |j|
            if nums[i] + nums[j] == target
                return [i,j]
            end
        end
    end
end

p two_sum([2,7,11,15], 9)