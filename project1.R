#read data,need to set working directory first
edges1 <- read.table('roadNet-CA.txt') 
em <- as.matrix(edges1) #save data in matrix
v1 <- em[,1] #Save the first column of data to v1
v2 <- em[,2] #Save the second column of data to v2

relations <- data.frame(from=v1,to=v2) 
g<-graph.data.frame(relations,directed=TRUE)

node <- V(g) #save all the node in g to "node"
View(g) # show g
nodefreq <- as.data.frame(table(v1))
#need to reduce the graph size here

result <- nodefreq[8,2]  
#delete all the node with degree 1
for (i in node) {
  if(nodefreq[i+1,2] == 1)
    {delete_vertices(g,i)}
}
View(g)

plot(g) # generate the plot
  