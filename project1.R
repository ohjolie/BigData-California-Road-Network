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
g <- g - V(g)[degree(g)<=10]
# generate the plot
plot(g) 



#node <- V(g) #save all the node in g to "node"
#nodefreq <- as.data.frame(table(v1))
# charnode <-attr(node,"names")
# intnode <- as.numeric(charnode)
# for (i in intnode) {
#   if(nodefreq[nodefreq$v1==i,2]==1L)
#     {#delete_vertices(g,i)}
# }

#View(g)
  