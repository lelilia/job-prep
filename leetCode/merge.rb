require_relative 'assert'

# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
	intervals = intervals.sort
	i = 0
	while i < intervals.length-1
		if intervals[i][1] >= intervals[i+1][0] 
			intervals[i][1] = intervals[i+1][1] if intervals[i+1][1]>intervals[i][1]
			intervals.delete_at(i+1)

		else
			i += 1
		end

	end
	return intervals
end





def run_tests
	assert("test1", merge([[1,4],[4,5]]),[[1,5]])

	assert("test2", merge([[1,3],[2,6],[8,10],[15,18]]),[[1,6],[8,10],[15,18]])

	assert("test3", merge([[1,4],[1,4]]), [[1,4]])

	assert("test4", merge([[1,4],[0,4]]),[[0,4]])

	assert("test5", merge([[1,4],[2,3]]),[[1,4]])

	assert("test6", merge([[1,4],[0,2],[3,5]]),[[0,5]])
end
run_tests