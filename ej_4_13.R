### ej 4.13 ###

library(bayesrules)
library(tidyverse)

# b
# la probabilidad de pi varia entre 0.5 y 1

# c Trying by simulation

set.seed(84735)
sim_p <- data.frame(pi = runif(10000, 0.5, 1)) %>% 
  mutate(y = rbinom(10000, size = 100, prob = pi))

# plot sim_p
ggplot(sim_p, aes(x = pi, y = y)) + 
  geom_point(aes(color = (y == 0)), size = 0.1)

# Keep only the simulated pairs that match our data
p_posterior <- sim_p %>% 
  filter(y == 0)

# Plot the remaining pi values
p <- ggplot(p_posterior, aes(x = pi)) + 
  geom_histogram(bins = 100) + 
  geom_vline(xintercept =  mean(p_posterior$pi))
p

# d 
# al tener un prior tan rigido con 0 probab de pi para valores entre
# 0 y 0.5, el modelo no contempla que pueda existir el resultado de y = 0; n = 100

