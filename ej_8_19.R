library(bayesrules)

### a
# Gamma poisson

### b

# mean = 200 mm
# sd = 60 mm

plot_gamma(11.11111,0.0555556, mean = T)

### c
str(penguins_bayes)

n <- penguins_bayes %>%
  filter(species == "Adelie") %>%
  nrow()

penguins_bayes %>%
  filter(species == "Adelie") %>%
  drop_na() %>%
  summarise(mean_sample = mean(flipper_length_mm))
  
### d

