require_relative 'assert'

# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
    a = []
    (0..n-1).each do 
    	line = []
    	(0..n-1).each do 
    		line << nil
    	end
    	a << line
    end
    k,l = 0,0
    m,n = n-1,n-1
    val = 1
    while k <=m and l <= n
    	(l..n).each do |i|
    		a[k][i] = val
    		val += 1
    	end
    	k += 1
    	(k..m).each do |i|
    		a[i][n] = val
    		val += 1
    	end
    	n -= 1
    	if k <= m
    		(n).downto(l) do |i|
    			a[m][i] = val
    			val += 1
    		end
    		m -= 1
    	end
    	if l <= n
    		(m).downto(k) do |i|
    			a[i][l] = val 
    			val += 1
    		end
    		l += 1
    	end
    end
    a
end

def run_tests
	desc = "3"
	result = generate_matrix(3)
	correct = [[ 1, 2, 3 ],[ 8, 9, 4 ],[ 7, 6, 5 ]]
	assert(desc, result, correct)
end

run_tests