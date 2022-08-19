# Load packages
library(tidyverse)
library(janitor)
library(rstan)
library(bayesplot)
library(bayesrules)

### a

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

# B
# show the first 4 pi values  for each of the four chains 
as.array(bb_sim, pars = "pi") %>% 
  head(4)

mcmc_trace(bb_sim, pars = "pi", size = 0.1)

# para todas juntas
mcmc_dens(bb_sim, pars = "pi") + 
  yaxis_text(TRUE) + 
  ylab("density")

# para cada cadena por separado
mcmc_dens_overlay(bb_sim, pars = "pi") + 
  ylab("density")

plot_beta_binomial(1,2,150,1000)

# C
# effective sample size
neff_ratio(bb_sim, pars = c("pi"))

# R-hat ratio
rhat(bb_sim, pars = "pi")

# tanto el effective sample size como el R-hat ratio se ven bien y aceptables. 
