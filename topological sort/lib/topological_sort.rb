require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms
# 

#  Kahn's Algorithm

# def topological_sort(vertices)
# 	result = []
# 	queue = []
# 	degree_hash = {}

# 	vertices.each do |vertex|
# 		in_degree = vertex.in_edges.length
# 		degree_hash[vertex] = in_degree
# 		queue << vertex if in_degree == 0	
# 	end

# 	until queue.empty? 
# 		curr_vertex = queue.shift
# 		result << curr_vertex
# 		curr_vertex.out_edges.each do |edge| 
# 			to_vertex = edge.to_vertex
# 			degree_hash[to_vertex] -= 1
# 			queue << to_vertex if degree_hash[to_vertex] == 0
# 		end
# 	end
# 	result 
# end

# Tarjan's Algorithm 

def  topological_sort(vertices) 
	result = []
	explored = Set.new 

	vertices.each do |vertex|
		dfs!(vertex, explored, result) unless explored.include?(vertex)
	end 
	result
end

def dfs!(vertex, explored, result) 
	explored.add(vertex)
	vertex.out_edges.each do |edge|
		new_vertex = edge.to_vertex
		dfs!(new_vertex, explored, result) unless explored.include?(new_vertex)
	end

	result.unshift(vertex)
end