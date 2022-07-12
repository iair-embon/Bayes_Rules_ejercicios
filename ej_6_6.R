library(tidyverse)

### a

# Step 1: Define a grid of 501 lambda values
grid_data   <- data.frame(lambda_grid = seq(from = 0, to = 8,
                                            length = 9))

# Step 2: Evaluate the prior & likelihood at each lambda
grid_data <- grid_data %>% 
  mutate(prior = dgamma(lambda_grid, 20, 5),
         likelihood = dpois(0, lambda_grid) * 
           dpois(1, lambda_grid) * 
           dpois(0, lambda_grid))

# Step 3: Approximate the posterior
grid_data <- grid_data %>% 
  mutate(unnormalized = likelihood * prior,
         posterior = unnormalized / sum(unnormalized))

# Set the seed
set.seed(84735)

# Step 4: sample from the discretized posterior
post_sample <- sample_n(grid_data, size = 10000, 
                        weight = posterior, replace = TRUE)


# Histogram of the grid simulation with posterior pdf 
ggplot(post_sample, aes(x = lambda_grid)) + 
  geom_histogram(aes(y = ..density..), color = "white") + 
  stat_function(fun = dgamma, args = list(21,8)) + 
  lims(x = c(0, 6))

### b

# Step 1: Define a grid of 501 lambda values
grid_data   <- data.frame(lambda_grid = seq(from = 0, to = 8,
                                            length = 201))

# Step 2: Evaluate the prior & likelihood at each lambda
grid_data <- grid_data %>% 
  mutate(prior = dgamma(lambda_grid, 20, 5),
         likelihood = dpois(0, lambda_grid) * 
           dpois(1, lambda_grid) * 
           dpois(0, lambda_grid))

# Step 3: Approximate the posterior
grid_data <- grid_data %>% 
  mutate(unnormalized = likelihood * prior,
         posterior = unnormalized / sum(unnormalized))

# Set the seed
set.seed(84735)

# Step 4: sample from the discretized posterior
post_sample <- sample_n(grid_data, size = 10000, 
                        weight = posterior, replace = TRUE)


# Histogram of the grid simulation with posterior pdf 
ggplot(post_sample, aes(x = lambda_grid)) + 
  geom_histogram(aes(y = ..density..), color = "white") + 
  stat_function(fun = dgamma, args = list(21,8)) + 
  lims(x = c(0, 6))
