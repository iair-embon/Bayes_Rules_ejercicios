### ej 4.1 ###

library(bayesrules)
library(tidyverse)


# a) => centering π on 0.5 
plot_beta(1.8,1.8)

# b) => somewhat favoring π > 0.5
plot_beta(3,2)

# c) =>  strongly favoring π < 0.5
plot_beta(1,10)

# d) =>  somewhat favoring π < 0.5
plot_beta(1,3)

# e) =>  strongly favoring π > 0.5
plot_beta(17,2)
