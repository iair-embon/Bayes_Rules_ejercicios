### ej 4.9 ###

library(bayesrules)
library(tidyverse)

# pi = "proportion of people that prefers dogs to cat"

# prior
plot_beta(7,2)

# a
mean_prior <- 7/(7+2)

# b
plot_beta_binomial(7,2,19,20)
# esperaria con mucha certeza que el valor de pi este entre 0.75 y 1, con mayor 
# chances de que este en 0.90

# c
plot_beta_binomial(7,2,1,20)
# esperaria con mucha certeza que el valor de pi este entre 0.1 y 0.5, con mayor 
# chances de que este en 0.276

# d
plot_beta_binomial(7,2,10,20)
# esperaria con mucha certeza que el valor de pi este entre 0.3 y 0.8, con mayor 
# chances de que este en 0.586


