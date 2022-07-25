# Load packages
library(tidyverse)
library(janitor)
library(rstan)
library(bayesplot)

### a

# STEP 1: DEFINE the model
model_a <- "
  data {
    int<lower = 0, upper = 10> Y;
  }
  parameters {
    real<lower = 0, upper = 1> pi;
  }
  model {
    Y ~ binomial(10, pi);
    pi ~ beta(3, 8);
  }
"

# STEP 2: SIMULATE the posterior
bb_sim <- stan(model_code = model_a, data = list(Y = 2), 
               chains = 3, iter = 6000*2, seed = 84735)


# show the first 4 pi values  for each of the four chains 
as.array(bb_sim, pars = "pi") %>% 
  head(4)

mcmc_trace(bb_sim, pars = "pi", size = 0.1)

# C
# porque las primeras 6000 iterasiones se descartan


# D

# para todas juntas
mcmc_dens(bb_sim, pars = "pi") + 
  yaxis_text(TRUE) + 
  ylab("density")

# para cada cadena por separado
mcmc_dens_overlay(bb_sim, pars = "pi") + 
  ylab("density")

# E 
plot_beta_binomial(3,8,2,10)
