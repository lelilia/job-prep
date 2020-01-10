# Shortest Path with every connection having the same cost/weight of 1

network =  {a: [:b, :c, :d], b: [:a, :d], c: [:a, :e], d: [:a, :b], e: [:c], f: [:g], g: [:f]}

class Node 
	attr_reader :dist, :name, :prev, :neighbors
	def initialize(name, neighbors)
		@name = name
		@dist = 1/0.0		# infinity
		@prev = nil
		@neighbors = neighbors
	end
	def set_dist(x)
		@dist = x
	end
	def set_prev(x)
		@prev = x
	end
end

def get_path(graph, start_node, end_node)
	if start_node == end_node
		return [start_node]
	end
	queue = []
	done = []
	graph.each do |key, val|
		queue << Node.new(key, val)
	end
	p queue
	queue.select{|x| x.name == end_node}[0].dist 	# this line is just here to raise an error if the end_node is not part of the garph
	queue.select{|x| x.name == start_node}[0].set_dist(0) # set dist[source] to 0

	while queue != []
		current = queue.min_by{|x| x.dist}	# find node with min_dist
		queue.delete(current)				# remove it from the queue
		done << current 
		current.neighbors.each do |n|
			
			new_route = current.dist + 1
			neighbor = queue.select{|x| x.name == n}[0] 
			if neighbor != nil 
				if new_route < neighbor.dist 
					neighbor.set_dist(new_route)
					neighbor.set_prev(current.name)
				end
			end
		end
		if current.name == end_node
			if current.prev == nil
				return nil
			end
			path = [current.name]
			if current.prev != nil or current.name == start_node
				while current.name != start_node
					path << current.prev 
					current = done.select{|x| x.name == current.prev}[0]
				end
			end
			return path.reverse
		end
		
	end
end

p get_path(network, :a, :e)
