# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def hamming_distance(x, y)
    dist = 0
    while x > 0|| y > 0
    	dist += 1 if x % 2 != y%2
    	x /= 2
    	y /= 2
    end
    return dist 
end

p hamming_distance(1,4)