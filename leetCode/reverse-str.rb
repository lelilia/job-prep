require_relative 'assert'

# @param {String} s
# @param {Integer} k
# @return {String}
def reverse_str(s, k)
	result = ""
    (0..s.length-1).step(k) do |i|
    	result += s[i..i+k-1].reverse if (i/k)%2 == 0
    	result += s[i..i+k-1] if (i/k)%2 == 1
    end
    result
end

def run_tests
	desc = "test1"
	result = reverse_str("abcdefg",2)
	correct = "bacdfeg"
	assert(desc, result, correct)
end

run_tests