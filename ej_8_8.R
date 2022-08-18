# load HDInterval library in order to perform a high density interval
library(HDInterval)
# a
v <- rgamma(10000,1,5)
hdi(v, credMass=0.95)
# b
qgamma(c(0.025,0.975), 1,5)

# c
# pienso que el mas apropiado seria el a por la asimetria, no?

# d
v <- rnorm(10000, -13,2)
hdi(v, credMass=0.95)

# e
qnorm(c(0.025,0.975), -13,2)

# f
# da medio lo mismo por la asimetria


