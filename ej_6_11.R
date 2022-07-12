# Load packages
library(tidyverse)
library(janitor)
library(rstan)
library(bayesplot)

### a

# STEP 1: DEFINE the model
bb_model <- "
  data {
    int<lower = 0, upper = 20> Y;
  }
  parameters {
    real<lower = 0, upper = 1> pi;
  }
  model {
    Y ~ binomial(20, pi);
    pi ~ beta(1, 1);
  }
"

### b

# STEP 1: DEFINE the model
bb_model <- "
  data {
    int<lower = 0, upper = 20> Y;
  }
  parameters {
    real<lower = 0, upper = 20> pi;
  }
  model {
    Y ~ poisson (pi);
    pi ~ gamma (4, 2);
  }
"

### c 

# STEP 1: DEFINE the model
bb_model <- "
  data {
    real<lower = -15, upper = 15> Y;
  }
  parameters {
    real<lower = -15, upper = 15> pi;
  }
  model {
    Y ~ normal (pi,1**2);
    pi ~ normal (0, 10**2);
  }
"