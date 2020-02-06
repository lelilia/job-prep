# @param {Integer[][]} grid
# @return {Integer}
require_relative 'assert'

def oranges_rotting(grid)
    time = 0
    old_grid = []
    while old_grid != grid
        one_one = false
        old_grid = Marshal.load( Marshal.dump(grid))
        grid.each_with_index do |row, i|
            row.each_with_index do |cell, j|
                if cell == 1
                    one_one = true
                    if i > 0
                        grid[i][j] = 2 if old_grid[i-1][j] == 2
                    end
                    if i < grid.length-1
                        grid[i][j] = 2 if old_grid[i+1][j] == 2
                    end
                    if j > 0
                        grid[i][j] = 2 if old_grid[i][j-1] == 2
                    end
                    if j < grid[0].length-1
                        grid[i][j] = 2 if old_grid[i][j+1] == 2
                    end
                end
            end
        end
        if one_one == false
            return time
        end
        time += 1

    end    

    return -1
end
#     time = 0
#     old_grid = nil
#     while grid != old_grid 
#     	old_grid = grid.clone
#     	grid.each_with_index do |row,i|
#     		row.each_with_index do |cell, j|
#     			if cell == 1
#     				if old_grid[[i-1,0].max][j] == 2 or old_grid[[i+1,grid.length-1].min][j] == 2 or old_grid[i][[j-1, 0].max] == 2 or old_grid[i][[j+1, grid[0].length-1].min] == 2
#     					grid[i][j] = 2
#     					p "here #{i} #{j} #{grid[i][j]}"
#     					p old_grid
#     				end
#     			end
#     		end
#     	end
#     	p grid
#     	time += 1
#     end
#     p grid
#     time
# end

def run_tests
	m = [[2,1,1],[1,1,0],[0,1,1]]
	desc = m.to_s
	result = oranges_rotting(m)
	correct = 4
	assert(desc, result, correct)

    m = [[2,1,1],[0,1,1],[1,0,1]]
    desc = m.to_s
    result = oranges_rotting(m)
    correct = -1
    assert(desc, result, correct)
end

run_tests