### ej 2.20 ###

# library
library(dplyr)
library(janitor)
library(ggplot2)

# p(ai_c|c) = 0.8 ; ai_c = artif. intell. said cat; c = real cat
# p(ai_c|c_c) = 0.5 ; c_c = real cat complement (i.e. not cat)
# p(c) = 0.08
# p(c|ai_c) = ?

p_c <- 0.08
sample_cant_p <-  c(p_c, 1-p_c)
cat <- data.frame(pi = c(1,0)) # 1 = real cat , 0 = not a cat
p_ai_c_c <- 0.8
p_ai_c_c_c <- 0.5 

# Simulate 10000 values of pi from the prior
cat_sim <- sample_n(cat, size = 10000, weight = sample_cant_p, 
                            replace = TRUE)

# veo que este bien
table(cat_sim$pi)/nrow(cat_sim)

# simulo una clasificacion
#set.seed(123)
pi_ai <- ifelse(cat_sim$pi == 1,
                        sample(cat$pi,size = 1,
                               prob = c(p_ai_c_c, 1-p_ai_c_c)),
                        sample(cat$pi,size = 1,
                               prob = c(p_ai_c_c_c, 1-p_ai_c_c_c)))

pi_ai_prueba <- c()

for (i in 1:nrow(cat_sim)) {
  if(cat_sim$pi[i] == 1){
    pi_ai_prueba <- c(pi_ai_prueba, sample(cat$pi,size = 1, 
                                           prob = c(p_ai_c_c, 1-p_ai_c_c)))}
  if(cat_sim$pi[i] == 0){
    pi_ai_prueba <- c(pi_ai_prueba, sample(cat$pi,size = 1,
                             prob = c(p_ai_c_c_c, 1-p_ai_c_c_c)))}
}

cat_sim$pi_ai <- pi_ai_prueba

table(cat_sim$pi_ai)/nrow(cat_sim)

la <- cat_sim %>% 
  filter(cat_sim$pi_ai ==1) %>%
  nrow()

d <- cat_sim %>%
  filter(cat_sim$pi_ai == 1 & cat_sim$pi == 1) %>%
  nrow()

p_c_ai_c <- d / la

print(p_c_ai_c)