### ej 3.9 ###

library(bayesrules)
library(tidyverse)

## a 

mean_salesperson_1 <- 8/(8+2)
mode_salesperson_1 <- (8-1)/(8+2-2)
sd_salesperson_1 <- sqrt((8*2)/((8+2)**2*(8+2+1)))

mean_salesperson_2 <- 1/(1+20)
mode_salesperson_2 <- (1-1)/(1+20-2)
sd_salesperson_2 <- sqrt((1*20)/((1+20)**2*(1+20+1)))

## b

# salesperson_1
plot_beta(8,2)

# salesperson_2
plot_beta(1,20)

## c
# s1 dice que hay un el 80% aprox de la gente dice pop
# s2 dice que hay un el 5% aprox de la gente dice pop

