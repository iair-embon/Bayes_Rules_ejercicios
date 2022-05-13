### ej 3.10 ###

library(bayesrules)
library(tidyverse)

## a 
priors_S1 <- c(8/(8+2))
priors_S2 <- c( 1/(1+20))


p_y_dado_pi1<- dbinom(12,50,priors_S1)
p_y_dado_pi2<- dbinom(12,50,priors_S2)


# s1
plot_beta_binomial(alpha = 8,
                   beta = 2,
                   y = 12,
                   n = 50)

summarize_beta_binomial(alpha = 8,
              beta = 2,
              y = 12,
              n = 50)

# s2
plot_beta_binomial(alpha = 1,
                   beta = 20,
                   y = 12,
                   n = 50)
summarize_beta_binomial(alpha = 1,
                        beta = 20,
                        y = 12,
                        n = 50)

## ploting the likelihood function
nrep <- 1000
n <- 50
posibles_p <- c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9)

df <- data.frame(p1 = rep(NaN,nrep),
                 p2 = rep(NaN,nrep),
                 p3 = rep(NaN,nrep),
                 p4 = rep(NaN,nrep),
                 p5 = rep(NaN,nrep),
                 p6 = rep(NaN,nrep),
                 p7 = rep(NaN,nrep),
                 p8 = rep(NaN,nrep),
                 p9 = rep(NaN,nrep))


for (i in 1:length(posibles_p)) {
  for (k in 1:nrep) {
    df[k,i]<- sum(rbinom(1,n,posibles_p[i]))
  }
}

hist(df$p1, probability = T)
abline(v=mean(df$p1), col = "red")

hist(df$p2, probability = T)
abline(v=mean(df$p2), col = "red")



