require_relative 'assert'

# @param {String} s
# @return {Boolean}
def check_record(s)
    return false if s.count("A")>1
    s = s.split("")
    (0..s.length-3).each do |i|
    	return false if s[i..i+2]== %w(L L L)
    end
    return true 
end

def run_tests
	assert("test1", check_record("PPALLP"), true)

	assert("test2", check_record("PPALLL"), false)
end
run_tests