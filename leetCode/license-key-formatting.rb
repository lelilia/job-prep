require_relative 'assert'

# @param {String} s
# @param {Integer} k
# @return {String}
def license_key_formatting(s, k)
	s = s.split("-").join("").upcase

	s_length = s.length
	first_box_length = s_length % k 

	result_string = ""
	s.chars.each_with_index do |letter,i|
		if i == first_box_length 
			result_string << "-"if first_box_length != 0
		elsif ((i- first_box_length)%k) == 0
			result_string << "-"
		end
		result_string << letter

	end
	result_string

end

def run_tests
	desc = "2-5g-3-J, K = 2"
	result = license_key_formatting("2-5g-3-J", 2)
	correct = "2-5G-3J"
	assert(desc, result, correct)

	desc = "5F3Z-2e-9-w, K=4"
	result = license_key_formatting("5F3Z-2e-9-w",4)
	correct = "5F3Z-2E9W"
	assert(desc, result, correct)
end

run_tests