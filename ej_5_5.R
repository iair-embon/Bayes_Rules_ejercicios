library(bayesrules)

# a
s <- 100
r <- 20
plot_gamma(s,r)

# b
pgamma(10,s,r, lower.tail = F)
