# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
    count = 0
    while n > 0
    	count += 1 if n % 2 == 1
    	n /= 2
    end
    return count 
end

p hamming_weight(11)