### ej 4.14 ### SEGUIR PENSANDO, NO ESTA TERMIANDO

library(bayesrules)
library(tidyverse)

# c Trying by simulation

set.seed(84735)
sim_p <- data.frame(pi = rbeta(10000, 3, 3)) %>% 
  mutate(y = rbinom(10000, size = 100, prob = pi))

# Keep only the simulated pairs that match our data
p_posterior <- sim_p %>% 
  filter(y == 0)

# Plot the remaining pi values
mean(p_posterior$pi)

# plot sim_p
ggplot(sim_p, aes(x = pi, y = y)) + 
  geom_point(size = 0.1)
