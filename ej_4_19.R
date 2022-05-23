### ej 4.19 ### 

library(bayesrules)
library(tidyverse)
library(dplyr)

# pi: the proportion of films that pass the Bechdel test

data(bechdel, package = "bayesrules")

# a
prior <- plot_beta(1,1)

set.seed(84735)
bechdel_1980 <- bechdel %>%
  filter(year >= 1980)

y <-sum(bechdel_1980$binary == "PASS")
n <- nrow(bechdel_1980)

plot_beta_binomial(1,1,y,n)
summarize_beta_binomial(1,1,y,n)

# b
prior <- plot_beta(790,952)

set.seed(84735)
bechdel_1990 <- bechdel %>%
  filter(year >= 1990)

y <-sum(bechdel_1990$binary == "PASS")
n <- nrow(bechdel_1990)

plot_beta_binomial(790,952,y,n)
summarize_beta_binomial(790,952,y,n)

# c
prior <- plot_beta(1543,1814)

set.seed(84735)
bechdel_2000 <- bechdel %>%
  filter(year >= 2000)

y <-sum(bechdel_2000$binary == "PASS")
n <- nrow(bechdel_2000)

plot_beta_binomial(1543,1814,y,n)
summarize_beta_binomial(1543,1814,y,n)

# d
prior <- plot_beta(1,1)

y <- sum(bechdel_1980$binary == "PASS") +
  sum(bechdel_1990$binary == "PASS") +
  sum(bechdel_2000$binary == "PASS")

n <- nrow(bechdel_1980) +
  nrow(bechdel_1990) +
  nrow(bechdel_2000)

plot_beta_binomial(1,1,y,n)
summarize_beta_binomial(1,1,y,n)


