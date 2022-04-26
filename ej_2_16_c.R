### ej 2.16 c ###

priors <- c(0.6)

df <- data.frame(posibles_y = 1:10,
                 y = rep(NaN,length(posibles_y)))


for (i in 1:length(df$posibles_y)) {
  
  # saco likelihood
  l_pi_1  <- dbinom(df$posibles_y[i],10,0.2)
  l_pi_2  <- dbinom(df$posibles_y[i],10,0.4)
  l_pi_3 <- dbinom(df$posibles_y[i],10,0.6)
  
  # veo valor de p(y=i) por ley de probablidad total
  p_de_y <- l_pi_1*0.25+ l_pi_2*0.5 +  l_pi_3* 0.25 
  
  # saco el prior
  p_pi_3 <- l_pi_3 * 0.25 / p_de_y
  
  # lo guardo
  df$y[i] <- p_pi_3 
}

# ploteo f(pi = 0.6| y), para todo posible valor de y
plot(df$posibles_y,df$y)

# veo el min numero de y para que se cumpla que f(pi = 0.6| y) > 4
min(which(df$y > 0.4))