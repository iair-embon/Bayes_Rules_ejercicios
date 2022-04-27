### ej 2.19 ###

# library
library(dplyr)
library(janitor)
library(ggplot2)

# pi =  prob de que una cria sobreviva al menos una semana
# Y = "cantidad de crias que sobrevivieron al menos una semana"
# n = 15
# p_hat = 15/10

# Define possible win probabilities
sob_una_sem <- data.frame(pi = c(0.6,0.65,0.7,0.75))

# Define the prior model
prior <- c(0.3,0.4,0.2,0.1)

# Simulate 10000 values of pi from the prior
set.seed(123)
sob_una_sem_sim <- sample_n(sob_una_sem, size = 10000, weight = prior, 
                            replace = TRUE)

# veo que este bien
table(sob_una_sem_sim$pi)/nrow(sob_una_sem_sim)


# Simulate 10000 samples outcomes
sob_una_sem_sim <- sob_una_sem_sim %>% 
  mutate(y = rbinom(10000, size = 15, prob = pi))

# Check it out
sob_una_sem_sim %>% 
  head(3)

# Summarize the prior
sob_una_sem_sim %>% 
  tabyl(pi) %>% 
  adorn_totals("row")

# Plot y by pi
ggplot(sob_una_sem_sim, aes(x = y)) + 
  stat_count(aes(y = ..prop..)) + 
  facet_wrap(~ pi)

# Focus on simulations with y = 10
p_hat_10 <- sob_una_sem_sim %>% 
  filter(y == 10)

# Summarize the posterior approximation
p_hat_10 %>% 
  tabyl(pi) %>% 
  adorn_totals("row")

# Plot the posterior approximation
ggplot(p_hat_10, aes(x = pi)) + 
  geom_bar()


