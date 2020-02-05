# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
	#base case
	return true if n == 1
	return false if n < 1
    while n >= 0
    	return false if n % 2 == 1
    	return true if n == 2
    	n = n / 2
    end
    
end

p is_power_of_two(1)
p is_power_of_two(16)
p is_power_of_two(218)