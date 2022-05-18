### ej 4.5 ###

library(bayesrules)
library(tidyverse)

## coworkers
# 1)
plot_beta(1,2)
# 2) 
plot_beta(0.5,1)
# 3)
plot_beta(3,10)
# 4)
plot_beta(2,0.1)


###### simulate the posterior

## for prior 1 ##

set.seed(84735)
sim_p1 <- data.frame(pi = rbeta(10000, 1, 2)) %>% 
  mutate(y = rbinom(10000, size = 7, prob = pi))

# plot sim_p1
ggplot(sim_p1, aes(x = pi, y = y)) + 
  geom_point(aes(color = (y == 3)), size = 0.1)

# Keep only the simulated pairs that match our data
p1_posterior <- sim_p1 %>% 
  filter(y == 3)

# Plot the remaining pi values
ggplot(p1_posterior, aes(x = pi)) + 
  geom_density()





