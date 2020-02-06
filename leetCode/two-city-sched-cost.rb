require_relative 'assert'

# @param {Integer[][]} costs
# @return {Integer}
def two_city_sched_cost(costs)
    costs = costs.sort_by {|a| a[0]-a[1]}
    p costs
    cost = 0
    n = costs.length / 2
    (0..n-1).each do |i|
    	cost += costs[i][0]
    end
    (n..2*n-1).each do |i|
    	cost += costs[i][1]
    end
    return cost
end

def run_tests
	desc = "test1"
	result = two_city_sched_cost([[10,20],[30,200],[400,50],[30,20]])
	correct = 110
	assert(desc, result, correct)
end

run_tests