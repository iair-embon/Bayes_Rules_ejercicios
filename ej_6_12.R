# Load packages
library(tidyverse)
library(janitor)
library(rstan)
library(bayesplot)

### a

# STEP 1: DEFINE the model
model_a <- "
  data {
    int<lower = 0, upper = 12> Y;
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
model_b <- "
  data {
    int<lower = 0> Y[3];
  }
  parameters {
    real<lower = 0> pi;
  }
  model {
    Y ~ poisson (pi);
    pi ~ gamma (4, 2);
  }
"

### c 

# STEP 1: DEFINE the model
model_c <- "
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