	#https://leetcode.com/problems/reverse-integer/
def reverse(x)
    if x < 0
        negative = true
        x = -x
    end
    res = 0
    while x > 0
        res = res * 10 + x%10
        x /= 10
    end
    if res > 2147483647
        return 0
    elsif negative 
        return -res
    end
    res
end

p reverse(123)