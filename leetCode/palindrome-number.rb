#https://leetcode.com/problems/palindrome-number/
def is_palindrome(x)
    return x.to_s == x.to_s.reverse
end
p is_palindrome(1234321)