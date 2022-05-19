### ej 4.10 ###

library(bayesrules)
library(tidyverse)

# Y = a_pos - a_pri
# n = b_pos + Y - b_pri

# a
plot_beta_binomial(0.5,0.5,8,10)

# b
plot_beta_binomial(0.5,0.5,3,13)

# c
plot_beta_binomial(10,1,2,16)

# d
plot_beta_binomial(8,3,7,10)

# e
plot_beta_binomial(2,2,3,6)

# f
plot_beta_binomial(1,1,29,31)
