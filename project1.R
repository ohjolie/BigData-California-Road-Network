#attention: load sna first, then load igraph
#read data,need to set working directory first
edges1 <- read.table('roadNet-CA.txt') 
em <- as.matrix(edges1) #save data in matrix
v1 <- em[,1] #Save the first column of data to v1
v2 <- em[,2] #Save the second column of data to v2

relations <- data.frame(from=v1,to=v2) 
g<-graph.data.frame(relations,directed=TRUE)

#reduce the graph size here
#delete all the node with degree 1,2,3,4,5

#g <- g - V(g)[degree(g)<=4]

#a better reducing algorithm
#V:4947 E:16382 Connectedness:0.015

i <- 0
while(vcount(g)>5000){
  g <- g - V(g)[igraph::degree(g)<=4]
  i <- i+1
}

print(i)

vcount(g)
ecount(g)

# generate the plot
plot(g) 

#convert graph to adjaceny matrix
matrix <- get.adjacency(g)
graph.matrix <- as.matrix(matrix)

#10 functions
is.connected(g) #connection
connectedness(graph.matrix) #Krackhardt connectedness scores
density <- gden(graph.matrix) #density
shortpath <- geodist(graph.matrix) #shortest path of all node
ego <- ego.extract(graph.matrix)
egocentric <- ego[2]
closeness(g) #closeness of all node
vertex_attr(g)
is.simple(g)
page_rank(g)#Calculates the Google PageRank for the specified vertices.
print(shortpath)
centr_betw(g)

#15 other functions in igraph
bipartite.mapping(g) #decide whether a graph is bipartite
cliques(g)#The functions find cliques
centralization.betweenness(g)#Centralize a graph according to the betweenness of vertices
centralization.closeness(g)#Centralize a graph according to the closeness of vertices
articulation.points(g)#Articulation points of a graph

average.path.length(g)#
automorphisms(g)#Number of automorphisms
blockGraphs(g)#Calculate Cohesive Blocks
cohesion(g)#Vertex connectivity
coreness(g)#The k-core of graph is a maximal subgraph in which each vertex has at least degree k. The coreness of a vertex is k if it belongs to the k-core but not to the (k+1)-core.

efficiency(graph.matrix)#Compute Graph Efficiency Scores
gtrans(graph.matrix)#Compute the Transitivity of an Input Graph or Graph Stack
isolates(graph.matrix)#List the Isolates in a Graph or Graph Stack
loadcent(graph.matrix)#Compute the Load Centrality Scores of Network Positions
g.reach<-reachability(graph.matrix)#producing the associated reachability matrices
stresscent(graph.matrix)#Compute the Stress Centrality Scores of Network Positions

#(a) central person 
graph.degree <- degree(g)
sort(graph.degree,TRUE) #only vertice 534751
#(b) longest path 
get_diameter(g) #distance 25 #multiple longest path???
#(c) largest clique 
largest_cliques(g) #multiple
#(d) ego
ego <- ego.extract(graph.matrix)
sort(ego_size(g),TRUE) #max ego size 11 ,only one person

#(e) betweenness centrality and power centrality.
centBetweeness <- centr_betw(g)
power_centrality(g)

# Question 7
vc<-ego_size(g, 3, V(g),mindist = 0)
od<-order(vc,decreasing = TRUE)[1:20]
topGraphs <- ego(g, 3, V(g)[c(od)],mindist = 0)

for(i in 1:19){
  for(j in i:20){
    #intersection(topGraphs[i],  topGraphs[j], byname = "auto", keep.all.vertices = FALSE)
    print(intersect(topGraphs[i], topGraphs[j]))
    
  }
}
