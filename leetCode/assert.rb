def assert(desc, result, correct)
	puts "#{desc} ... #{result == correct ? 'PASS' : "FAIL #{result} is not #{correct}"}"
end