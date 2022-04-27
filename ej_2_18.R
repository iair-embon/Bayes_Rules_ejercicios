### ej 2.18 ###

# library
library(dplyr)
library(janitor)
library(ggplot2)

# pi = prob de ser intolerante a la lactosa
# Y = "nro de adultos que tienen intolerancia a la lactosa"

# Define possible win probabilities
int_lactosa <- data.frame(pi = c(0.4, 0.5, 0.6, 0.7))

# Define the prior model
prior <- c(0.10, 0.2, 0.44, 0.26)

# Simulate 10000 values of pi from the prior
set.seed(123)
int_lactosa_sim <- sample_n(int_lactosa, size = 10000, weight = prior, 
                            replace = TRUE)

# veo que este bien
table(int_lactosa_sim$pi)/nrow(int_lactosa_sim)


# Simulate 10000 samples outcomes
int_lactosa_sim <- int_lactosa_sim %>% 
  mutate(y = rbinom(10000, size = 80, prob = pi))

# Check it out
int_lactosa_sim %>% 
  head(3)

# Summarize the prior
int_lactosa_sim %>% 
  tabyl(pi) %>% 
  adorn_totals("row")

# Plot y by pi
ggplot(int_lactosa_sim, aes(x = y)) + 
  stat_count(aes(y = ..prop..)) + 
  facet_wrap(~ pi)

# Focus on simulations with y = 1
p_hat_47 <- int_lactosa_sim %>% 
  filter(y == 47)

# Summarize the posterior approximation
p_hat_47 %>% 
  tabyl(pi) %>% 
  adorn_totals("row")

# Plot the posterior approximation
ggplot(p_hat_47, aes(x = pi)) + 
  geom_bar()

