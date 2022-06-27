library(bayesrules)
s <- 100
r <- 20
plot_gamma(s,r)
pgamma(10,s,r, lower.tail = F)

# a
y <- c(7, 3, 8, 9, 10, 12)

plot_poisson_likelihood(y)

# b
plot_gamma_poisson(s,r, sum(y), length(y))

# c
summarize_gamma_poisson(s,r, sum(y), length(y))



