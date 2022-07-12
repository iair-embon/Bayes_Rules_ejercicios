library(tidyverse)

### a

# Step 1: Define a grid of lambda values
grid_data   <- data.frame(lambda_grid = seq(from = 5, to = 15,
                                            length = 11))

# Step 2: Evaluate the prior & likelihood at each lambda
grid_data <- grid_data %>% 
  mutate(prior = dnorm(lambda_grid, 10, 1.2**2),
         likelihood = dnorm(7.1, lambda_grid, 1.3**2) * 
           dnorm(8.9, lambda_grid, 1.3**2) * 
           dnorm(8.4, lambda_grid, 1.3**2) *
           dnorm(8.4, lambda_grid, 1.3**2))

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
  geom_histogram(aes(y = ..density..), color = "white")

### b

# Step 1: Define a grid of lambda values
grid_data   <- data.frame(lambda_grid = seq(from = 5, to = 15,
                                            length = 201))

# Step 2: Evaluate the prior & likelihood at each lambda
grid_data <- grid_data %>% 
  mutate(prior = dnorm(lambda_grid, 10, 1.2**2),
         likelihood = dnorm(7.1, lambda_grid, 1.3**2) * 
           dnorm(8.9, lambda_grid, 1.3**2) * 
           dnorm(8.4, lambda_grid, 1.3**2) *
           dnorm(8.4, lambda_grid, 1.3**2))

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
  geom_histogram(aes(y = ..density..), color = "white")


