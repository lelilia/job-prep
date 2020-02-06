require_relative 'assert'


# @param {String} a
# @param {String} b
# @return {Boolean}
def rotate_string(a, b)
    n = a.length
    return false if a.length != b.length
    return true if a == "" && b ==""

    while n > 0
    	a = a[1..a.length-1]+a[0]
    	return true if a == b

    	n -= 1
    end
    return false
end

def run_tests
	desc = "abcde cdeab"
	result = rotate_string("abcde","cdeab")
	correct = true
	assert(desc, result,correct)
end
run_tests