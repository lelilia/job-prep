#https://leetcode.com/problems/roman-to-integer/





# @param {String} s
# @return {Integer}
def roman_to_int(s)
    s = s.split("")
    n = s.length - 1
    result = 0
    (0..n).each do |i|
        if s[i] == "I"
        	# if I is used to lower V or X
            if ["V","X"].include?(s[i+1])
                result -= 1
            else
                result += 1
            end
        elsif s[i] == "V"
            result += 5
        elsif s[i] == "X"
        	# if X is used to lower L or C
            if ["L","C"].include?(s[i+1])
                result -= 10
            else
                result += 10
            end
        elsif s[i] == "L"
            result += 50
        elsif s[i] == "C"
        	# if C is used to lower D or M
            if ["D","M"].include?(s[i+1])
                result -= 100
            else
                result += 100
            
                
            end
        elsif s[i] == "D"
            result += 500
        elsif s[i] == "M"
            result += 1000
        
        end 
    end
    return result
end