# plot two sets of data on one graph
x = c(0, 1,2,3,4,5,6,7,8, 9)
y1 = 0.5*x
y2 = 0.5*x + 4



# plot the first as scatter plot in red with slightly larger axis's
plot(x, y1, main="title", sub="subtitle",
     xlab="X-axis label", ylab="y-axix label",
     xlim=c(-1, 10), ylim=c(-1, 10),
     col="red")
# plot the second as a line in green
lines(x, y2, col="green")

