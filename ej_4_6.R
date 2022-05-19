### ej 4.6 ###

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
p1 <- ggplot(p1_posterior, aes(x = pi)) + 
  geom_histogram(bins = 100) + 
  geom_vline(xintercept =  mean(p1_posterior$pi))

## for prior 2 ##

set.seed(84735)
sim_p2 <- data.frame(pi = rbeta(10000, 0.5, 1)) %>% 
  mutate(y = rbinom(10000, size = 7, prob = pi))

# plot sim_p2
ggplot(sim_p2, aes(x = pi, y = y)) + 
  geom_point(aes(color = (y == 3)), size = 0.1)

# Keep only the simulated pairs that match our data
p2_posterior <- sim_p2 %>% 
  filter(y == 3)

# Plot the remaining pi values
p2 <- ggplot(p2_posterior, aes(x = pi)) + 
  geom_histogram(bins = 100) + 
  geom_vline(xintercept =  mean(p2_posterior$pi))

## for prior 3 ##

set.seed(84735)
sim_p3 <- data.frame(pi = rbeta(10000, 3, 10)) %>% 
  mutate(y = rbinom(10000, size = 7, prob = pi))

# plot sim_p3
ggplot(sim_p3, aes(x = pi, y = y)) + 
  geom_point(aes(color = (y == 3)), size = 0.1)

# Keep only the simulated pairs that match our data
p3_posterior <- sim_p3 %>% 
  filter(y == 3)

# Plot the remaining pi values
p3 <- ggplot(p3_posterior, aes(x = pi)) + 
  geom_histogram(bins = 100) + 
  geom_vline(xintercept =  mean(p3_posterior$pi))

## for prior 4 ##

set.seed(84735)
sim_p4 <- data.frame(pi = rbeta(10000, 2, 0.1)) %>% 
  mutate(y = rbinom(10000, size = 7, prob = pi))

# plot sim_p4
ggplot(sim_p4, aes(x = pi, y = y)) + 
  geom_point(aes(color = (y == 3)), size = 0.1)

# Keep only the simulated pairs that match our data
p4_posterior <- sim_p4 %>% 
  filter(y == 3)

# Plot the remaining pi values
p4 <- ggplot(p4_posterior, aes(x = pi)) + 
  geom_histogram(bins = 100) + 
  geom_vline(xintercept =  mean(p4_posterior$pi))

#### all together

library(gridExtra)

grid.arrange(p1, p2, p3 ,p4, ncol=2)

##################### ej 4.6 #################

## exact posterior and simulated
# 1)
plot_beta(4,6)
p1
exact_mean_1 <- 4/(4+6)
sim_mean_1 <- mean(p1_posterior$pi)
# 2) 
plot_beta(3.5,5)
p2
exact_mean_2 <- 3.5/(3.5+5)
sim_mean_2 <- mean(p2_posterior$pi)
# 3)
plot_beta(6,14)
p3
exact_mean_3 <- 6/(6+14)
sim_mean_3 <- mean(p3_posterior$pi)
# 4)
plot_beta(5,4.1)
p4
exact_mean_4 <- 5/(5+4.1)
sim_mean_4 <- mean(p4_posterior$pi)