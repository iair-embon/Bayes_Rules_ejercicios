# Load packages
library(tidyverse)
library(janitor)
library(rstan)
library(bayesplot)
library(bayesrules)
library(broom.mixed)

# STEP 1: DEFINE the model
model_a <- "
  data {
    int<lower = 0, upper = 1000> Y;
  }
  parameters {
    real<lower = 0, upper = 1> pi;
  }
  model {
    Y ~ binomial(1000, pi);
    pi ~ beta(1, 2);
  }
"

# STEP 2: SIMULATE the posterior
bb_sim <- stan(model_code = model_a, data = list(Y = 150), 
               chains = 4, iter = 10000*2, seed = 84735)

tidy(bb_sim, conf.int = T, conf.level = .95)

# Calculate posterior summaries of pi
bb_sim_df <- as.data.frame(bb_sim, pars = "lp__", include = FALSE)
dim(bb_sim_df)

bb_sim_df %>% 
  summarize(post_mean = mean(pi), 
            post_median = median(pi),
            post_mode = sample_mode(pi),
            lower_95 = quantile(pi, 0.025),
            upper_95 = quantile(pi, 0.975))

# Tabulate pi values that are upper  0.10
bb_sim_df %>% 
  mutate(exceeds = pi > 0.10) %>% 
  tabyl(exceeds)

### a

set.seed(1)

# Predict a value of Y' for each pi value in the chain
bb_sim_df <- bb_sim_df %>% 
  mutate(y_predict = rbinom(length(pi), size = 100, prob = pi))

# Check it out
bb_sim_df %>% 
  head(3)

# Plot the 40,000 predictions
ggplot(bb_sim_df, aes(x = y_predict)) + 
  stat_count()

# summarize
bb_sim_df %>% 
  summarize(mean = mean(y_predict),
            lower_80 = quantile(y_predict, 0.1),
            upper_80 = quantile(y_predict, 0.9))

# c
sum(bb_sim_df >= 20)/ nrow(bb_sim_df)
