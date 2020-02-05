require_relative 'assert'

# @param {String} input
# @return {Integer}
def length_longest_path(input)
	levels = input.split("\n")
	files = []
	dir = levels[0]
	while true 
		changed_someting = false
		levels.each_with_index do |entry,i|
			
			if entry.count("\t") == 0
				dir = entry
				
			elsif entry.count("\t") == 1
				levels[i] = dir +"/"+ entry[1..entry.length-1]
				changed_someting = true
			else
				levels[i] = entry[1..entry.length-1]
				changed_someting = true
			end
		end
		if changed_someting == false
			break
		end
	end

	longest = 0
	levels.each do |path|
		if path.count(".") > 0
			longest = [longest, path.length].max 
		end
	end
	return longest
    
end

def run_tests
	desc = "test1"
	result = length_longest_path("dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext")
	correct = 20
	assert(desc, result, correct)

	desc = "test2"
	result = length_longest_path("dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext")
	correct = 32
	assert(desc,result,correct)
end

run_tests