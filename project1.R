#attention: load sna first, then load igraph
#read data,need to set working directory first
edges1 <- read.table('roadNet-CA.txt') 
em <- as.matrix(edges1) #save data in matrix
v1 <- em[,1] #Save the first column of data to v1
v2 <- em[,2] #Save the second column of data to v2

relations <- data.frame(from=v1,to=v2) 
g<-graph.data.frame(relations,directed=FALSE)

#reduce the graph size here
#delete all the node with degree 1,2,3,4,5

#g <- g - V(g)[degree(g)<=4]

#a better reducing algorithm
#V:4947 E:16382 Connectedness:0.015
while(vcount(g)>5000){
  g <- g - V(g)[igraph::degree(g)<=4]
  i <- i+1
}

length(V(g))
length(E(g))

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

#15 other functions in igraph
bipartite.mapping(g) #decide whether a graph is bipartite
cliques(g)

#function
igraph::is.connected(g) #connection
connectedness(graph.matrix) #Krackhardt connectedness scores
transitivity(g)
gden(graph.matrix) #density
shortpath <- geodist(graph.matrix) #shortest path of node

is.simple(g)

print(shortpath)

#node <- V(g) #save all the node in g to "node"
#nodefreq <- as.data.frame(table(v1))
# charnode <-attr(node,"names")
# intnode <- as.numeric(charnode)
# for (i in intnode) {
#   if(nodefreq[nodefreq$v1==i,2]==1L)
#     {#delete_vertices(g,i)}
# }

#View(g)
  