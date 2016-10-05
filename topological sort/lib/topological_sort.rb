require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)

	queue = []
	vertices.each do |node|
		in_degree = node.in_edges.length
		queue << node if in_degree == 0	
	end

	until queue.empty? 
		curr_node = queue.shift
		curr_node.destroy!
		

end
