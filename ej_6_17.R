# Load packages
library(tidyverse)
library(janitor)
library(rstan)
library(bayesplot)
library(bayesrules)

### a
# STEP 1: DEFINE the model
nn_model <- "
  data {
    real<lower = -100, upper = 100> Y;
  }
  parameters {
    real<lower = -100, upper = 100> mu;
  }
  model {
    Y ~ normal (mu,1.3**2);
    mu ~ normal (0, 1.2**2);
  }
"

# STEP 2: SIMULATE the posterior
nn_sim <- stan(model_code = nn_model, data = list(Y = c(7.1, 8.9, 8.4, 8.6)), 
               chains = 4, iter = 5000*2, seed = 84735)

### b
# Trace plots of the 4 Markov chains
mcmc_trace(gp_sim, pars = "lambda", size = 0.1)

# Histogram of the Markov chain values
mcmc_hist(gp_sim, pars = "lambda") + 
  yaxis_text(TRUE) + 
  ylab("count")

# Density plot of the Markov chain values
mcmc_dens(gp_sim, pars = "lambda") + 
  yaxis_text(TRUE) + 
  ylab("density")

### c
# pareceria ser 2.5

### d
plot_gamma_poisson(20,5,1,3)
