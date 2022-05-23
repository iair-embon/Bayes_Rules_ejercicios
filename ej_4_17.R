### ej 4.17 ### 

library(bayesrules)
library(tidyverse)

# pi: the probability that a user will click on the ad when shown

prior <- plot_beta(4,3)

# employee 1: y = 0 ; n = 1
# employee 2: y = 3 ; n = 10
# employee 3: y = 20 ; n = 100

# a
# they believe that pi is slightly over the mean.

# b

# employee 1: 
plot_beta(4,4)
# employee 2: 
plot_beta(7,10)
# employee 3: 
plot_beta(24,83)

# c

# employee 1:
plot_beta_binomial(4,3,0,1)

# employee 2:
plot_beta_binomial(4,3,3,10)

# employee 3:
plot_beta_binomial(4,3,20,100)

# d

# employee 1:
summarize_beta_binomial(4,3,0,1)

# employee 2:
summarize_beta_binomial(4,3,3,10)

# employee 3:
summarize_beta_binomial(4,3,20,100)

