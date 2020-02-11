def combination_sum(candidates, target)
	return helper(candidates.sort, target, [], [], 0)
end

def helper(candidates, target, res, r, i)
	if target < 0
		return 
	end

	if target == 0
		res.push r.dup
		return res
	end

	while i < candidates.length && target - candidates[i] >= 0
		r.push candidates[i]
		

		helper(candidates, target - candidates[i], res, r, i)
		i += 1
		r.pop
	end
	return res
end

p combination_sum([8,7,4,3],11)