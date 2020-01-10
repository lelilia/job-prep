# Shortest Path with every connection having the same cost/weight of 1

network =  {a: [:b, :c, :d], b: [:a, :d], c: [:a, :e], d: [:a, :b], e: [:c], f: [:g], g: [:f]}

class Node 
	attr_reader :dist, :name, :prev, :neighbors
	def initialize(name, neighbors, dist, prev)
		@name = name
		@dist =	dist
		@prev = prev
		@neighbors = neighbors
	end
end

def get_path(graph, start_node, end_node)
	if start_node == end_node
		return [start_node]
	end
	queue = []
	queue << Node.new(start_node, graph[start_node], 0, [])
	nodes_we_visted = []

	while queue != []
		current = queue[0]
		queue.shift
		nodes_we_visted << current.name
		current.neighbors.each do |neighbor|
			if not nodes_we_visted.include?(neighbor)
				previous = current.prev + [current.name]
				queue << Node.new(neighbor, graph[neighbor], current.dist + 1, previous)
			end
		end
		if current.name == end_node
			return current.prev + [current.name]
		end
	end
	return NameError
end

p get_path(network, :a, :f)
