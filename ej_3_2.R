### ej 3.2 ###

library(bayesrules)
library(tidyverse)

 ## a 

ezp <- 0.8
var <- 0.0025
alfa <- 63.2040
beta <- 15.801

plot_beta(alfa,beta)

## b
ezp <- 0.9
var <- 0.08
alfa <- 0.314905
beta <- 0.034986

plot_beta(alfa,beta, mean = T)

## c

# es muy parecido a los otros, lo salteo para avanzar 

## d
plot_beta((7.5/8),(17.5/8), mean = T)



