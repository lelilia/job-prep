#https://leetcode.com/problems/valid-parentheses/

# @param {String} s
# @return {Boolean}
def is_valid(s)
    openers = ["(", "[", "{"]
    closers = [")", "]", "}"]
    stack = []
    s.split("").each do |item|
        if openers.include?(item)
            stack.push item
        else
            if stack.pop != openers[closers.index(item)]
                return false
            end
        end
    end
    return false if stack.empty? == false
    return true
end
