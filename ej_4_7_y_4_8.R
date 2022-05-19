### ej 4.7 y 4.8###

library(bayesrules)
library(tidyverse)


# a
plot_beta_binomial(1,4,8,10) # el likelihood influye mas en el posterior

# b
plot_beta_binomial(20,3,0,1) # el prior influye mas en el posterior

# c
plot_beta_binomial(4,2,1,3) # lo mismo

# d
plot_beta_binomial(3,10,10,13) # lo mismo

# e
plot_beta_binomial(20,2,10,200) # el likelihood influye mas en el posterior

