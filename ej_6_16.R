# Load packages
library(tidyverse)
library(janitor)
library(rstan)
library(bayesplot)
library(bayesrules)

### a
# STEP 1: DEFINE the model
gp_model <- "
  data {
    int<lower = 0> Y[3];
  }
  parameters {
    real<lower = 0> lambda;
  }
  model {
    Y ~ poisson(lambda);
    lambda ~ gamma(5, 5);
  }
"

# STEP 2: SIMULATE the posterior
gp_sim <- stan(model_code = gp_model, data = list(Y = c(0,1,0)), 
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
plot_gamma_poisson(5,5,1,3)
