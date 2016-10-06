require_relative 'graph'
require_relative 'priority_map'

# O(|V| + |E|*log(|V|)).
def dijkstra2(source)

	possible_paths = PriorityMap.new { |a, b| a[:cost] <=> b[:cost] }
	shortest_paths = {}

	possible_paths[source] = {cost: 0, prev_edge: nil}

	until possible_paths.empty? 
		vertex, val = possible_paths.extract

		shortest_paths[vertex] = val
		path_cost = shortest_paths[vertex][:cost]

		vertex.out_edges.each do |edge|
			to_vertex = edge.to_vertex
			next if shortest_paths.has_key?(to_vertex)

			new_cost = path_cost + edge.cost
			next if possible_paths.has_key?(to_vertex) && 
			new_cost >= possible_paths[to_vertex][:cost]

			possible_paths[to_vertex] = {cost: new_cost, prev_edge: edge}
		end
		
	end
	shortest_paths
end
