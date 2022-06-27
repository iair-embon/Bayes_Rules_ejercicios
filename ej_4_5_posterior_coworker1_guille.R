
set.seed(84735)
sim_p1 <- data.frame(id = 1:10000, pi = rbeta(10000, 1, 2)) %>%
  group_by(id) %>% 
  mutate(y = rbinom(1, size = 7, prob = pi)) %>% 
  ungroup()


ggplot(sim_p1, aes(x = pi, y = y)) + 
  geom_point(aes(color = (y == 3)), size = 0.1)


p1_posterior <- sim_p1 %>% 
  filter(y == 3)

# Plot the remaining pi values
p1 <- ggplot(p1_posterior, aes(x = pi)) + 
  geom_histogram(bins = 100) + 
  geom_vline(xintercept =  mean(p1_posterior$pi))
