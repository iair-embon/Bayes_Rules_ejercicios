### ej 2.21 ###

# library
library(dplyr)
library(janitor)
library(ggplot2)

# p(pos|e) = 0.93 ; 
# p(pos|e_c) = 0.07 ; 
# p(e) = 0.03
# p(e|pos) = ?

p_e <- 0.03
sample_cant_p <-  c(p_e, 1-p_e)
enf <- data.frame(tiene_enf = c(1,0)) # 1 = real cat , 0 = not a cat
p_pos_e <- 0.93
p_pos_e_c <- 0.07 

# Simulate 10000 values of pi from the prior
enf_sim <- sample_n(enf, size = 10000, weight = sample_cant_p, 
                    replace = TRUE)

# veo que este bien
table(enf_sim$tiene_enf)/nrow(enf_sim)

# simulo una clasificacion
test_pos <- ifelse(enf_sim$tiene_enf == 1,
                sample(enf$tiene_enf,size = 1,
                       prob = c(p_pos_e, (1-p_pos_e))),
                sample(enf$tiene_enf,size = 1,
                       prob = c(p_pos_e_c, (1-p_pos_e_c))))

test_pos_prueba <- c()

for (i in 1:nrow(enf_sim)) {
  if(enf_sim$tiene_enf[i] == 1){
    test_pos_prueba <- c(test_pos_prueba, sample(enf$tiene_enf,size = 1, 
                                           prob = c(p_pos_e, (1-p_pos_e))))}
  if(enf_sim$tiene_enf[i] == 0){
    test_pos_prueba <- c(test_pos_prueba, sample(enf$tiene_enf,size = 1,
                                           prob = c(p_pos_e_c, (1-p_pos_e_c))))}
}

enf_sim$tiene_enf_sim <- test_pos_prueba

table(enf_sim$tiene_enf_sim)/nrow(enf_sim)

d <- enf_sim %>%
  filter(enf_sim$tiene_enf_sim == 1 & enf_sim$tiene_enf == 1) %>%
  nrow()

la <- enf_sim %>%
  filter(enf_sim$tiene_enf_sim == 1) %>%
  nrow()
  
p_e_pos <- d/la

