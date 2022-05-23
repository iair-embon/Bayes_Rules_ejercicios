### ej 4.18 ### 

library(bayesrules)
library(tidyverse)

# pi: the probability that a user will click on the ad when shown

prior <- plot_beta(4,3)

# employee 1: y = 0 ; n = 1
# employee 2: y = 3 ; n = 10
# employee 3: y = 20 ; n = 100

# a

# day 1: 
plot_beta(4,4)
# day 2: 
plot_beta(7,11)
# day 3: 
plot_beta(27,91)

# b

# day 1: 
# pi has the same probability to be over or under the mean, with mean in 0.5

# day 2: 
# pi has a slightly bigger probability to be under the mean that over it.

# day 3: 
# pi has plenty probability to be under the mean that over it.

# c
plot_beta(27,91)

