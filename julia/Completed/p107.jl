# Minimal network
# Problem 107

using DataStructures

type Edge
    u :: Int
    v :: Int
    w :: Int
end

# Read in the data file
file = "../data/p107_network.txt"
data = readcsv(file)

# Set up the data
n = size(data, 1)
nodes = [1:n]
edges = Edge[]
for u in 1:n-1, v in u+1:n 
    if data[u, v] != "-"
        push!(edges, Edge(u, v, int(data[u,v])))
    end
end

# Sort the edges ascending
sort!(edges, by=f->f.w)


# Create a disjoint set of the nodes
forest = IntDisjointSets(40)

# Kruskals mst
mst = Edge[]
for e in edges
    if !in_same_set(forest, e.u, e.v)
        push!(mst, e)
        union!(forest, e.u, e.v) 
    end
end

edgesum = sum(f->f.w, edges)
mstsum = sum(f->f.w, mst)

println(edgesum - mstsum)



