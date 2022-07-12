library(tidyverse)

### a

# Step 1: Define a grid of 101 pi values
grid_data  <- data.frame(pi_grid = c(0, 0.25, 0.5, 0.75, 1))

# Step 2: Evaluate the prior & likelihood at each pi
grid_data <- grid_data %>% 
  mutate(prior = dbeta(pi_grid, 3, 8),
         likelihood = dbinom(2, 10, pi_grid))

# Step 3: Approximate the posterior
grid_data <- grid_data %>% 
  mutate(unnormalized = likelihood * prior,
         posterior = unnormalized / sum(unnormalized))

# plotting
ggplot(grid_data, aes(x = pi_grid, y = posterior)) + 
  geom_point() + 
  geom_segment(aes(x = pi_grid, xend = pi_grid, y = 0, yend = posterior))


### b

# Step 1: Define a grid of 101 pi values
grid_data  <- data.frame(pi_grid = seq(0,1, length.out = 201))

# Step 2: Evaluate the prior & likelihood at each pi
grid_data <- grid_data %>% 
  mutate(prior = dbeta(pi_grid, 3, 8),
         likelihood = dbinom(2, 10, pi_grid))

# Step 3: Approximate the posterior
grid_data <- grid_data %>% 
  mutate(unnormalized = likelihood * prior,
         posterior = unnormalized / sum(unnormalized))

# plotting
ggplot(grid_data, aes(x = pi_grid, y = posterior)) + 
  geom_point() + 
  geom_segment(aes(x = pi_grid, xend = pi_grid, y = 0, yend = posterior))

