### ej 3.6 ###

library(bayesrules)
library(tidyverse)

## a 
plot_beta(50,0.00001, mean = F, mode = T)

# la media mas grande es la de 0.999999..

## b
plot_beta(50,999999, mode = T)

# la moda mas chica es 0.00000...01

## c

# smallest sd seria cuando para a=b=+infinito 
plot_beta(10000,10000)

# biggest sd seria cuando a y b son menores a 1, hacia - infinito
plot_beta(0.00001,0.00001)
# en estos casos, sd= 0.25



