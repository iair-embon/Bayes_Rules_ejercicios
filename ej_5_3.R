library(bayesrules)


## assuming a prior model of lambda ~ gamma(24,2)
s <- 24
r <- 2

posterior_gamma_poisson <- function(y,s,r){
  s <- s+sum(y)
  r <- r + length(y)
  posterior <- list(s,r)
  return(posterior)
}


# a
a_y <- c(3,7,19)
posterior_a_y <- posterior_gamma_poisson(a_y,s,r)
# b
b_y <- c(12,12,12,0)
posterior_b_y <- posterior_gamma_poisson(b_y,s,r)
# c
c_y <- 12
posterior_c_y <- posterior_gamma_poisson(c_y,s,r)
# d
d_y <- c(16,10,17,11,11)
posterior_d_y <- posterior_gamma_poisson(d_y,s,r)


