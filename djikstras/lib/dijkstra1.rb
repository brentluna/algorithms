require_relative 'graph'

# O(|V|**2 + |E|).
def dijkstra1(source)
	locked_in_paths = {}
	possible_paths = {
		source => {cost: 0, prev_edge: nil}
	}

	until possible_paths.empty? 
		vertex = select_possible_path(possible_paths)
		locked_in_paths[vertex] = possible_paths[vertex]
		possible_paths.delete(vertex)

		update_possible_paths(vertex, locked_in_paths, possible_paths)
	end
	locked_in_paths
end

def select_possible_path(possible_paths)
	vertex, data = possible_paths.min_by { |(vertex, data)| data[:cost] }
	vertex
end


def update_possible_paths(vertex, locked_in_paths, possible_paths)
	path_cost = locked_in_paths[vertex][:cost]

	vertex.out_edges.each do |edge|
		to_vertex = edge.to_vertex

		next if locked_in_paths.has_key?(to_vertex)

		extened_cost = path_cost + edge.cost 

		next if possible_paths.has_key?(to_vertex) && 
		possible_paths[to_vertex][:cost] <= extened_cost

		possible_paths[to_vertex] = { cost: extened_cost, prev_edge: edge }
	end
end