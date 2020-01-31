# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/solution/

require_relative 'assert'


def max_profit(prices)
	maxprofit = 0
	minprice = prices[0]
	(0..prices.length-1).each do |i|
		minprice = [prices[i], minprice].min 
		maxprofit = [maxprofit, prices[i]-minprice].max

			
	end
	return maxprofit
end


def run_tests
	arr = [7,1,5,3,6,4]
	desc = arr.to_s
	result = max_profit(arr)
	correct = 5
	assert(desc, result, correct)
end

run_tests