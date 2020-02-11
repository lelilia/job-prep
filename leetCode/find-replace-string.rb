require_relative 'assert'

# @param {String} s
# @param {Integer[]} indexes
# @param {String[]} sources
# @param {String[]} targets
# @return {String}
def find_replace_string(s, indexes, sources, targets)

	new_array = indexes.zip(sources, targets).sort


    result = s.split("")
    (0..new_array.length-1).each do |i|

    	index, source, target = new_array[i]
    	len = source.length 
    	if s[index .. index + len-1] == source 
    		# result[index .. index + len-1] = target 
    		result[index] = target 
    		(index+1..index+len-1).each do |j|
    			result[j] = nil
    		end
    	end

    end
    return result.join("")

end

def run_tests
	assert("test1", find_replace_string("abcd", [0,2], ["ab","ec"], ["eee","ffff"]), "eeecd")
	assert("test2", find_replace_string("abcd", [0,2], ["a","cd"],["eee","ffff"]),"eeebffff")
	assert("test3", find_replace_string("vmokgggqzp",[3,5,1],["kg","ggq","mo"],["s","so","bfr"]), "vbfrssozp")
end
run_tests