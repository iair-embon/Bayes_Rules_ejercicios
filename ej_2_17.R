### ej 2.17 ###

# library
library(dplyr)

# Define given probabilities
infected <- c(0,1)
p_infected <- c((1-0.18),0.18)

especies <- c("e", "m","o")
p_given_infected <- c(0.15,0.8,0.05)
p_given_infected_c <- c(0.2,0.1,0.7)

# Simulate 10000 trees (infected or not) given the probabilities
df <- data.frame(trees_infectado = rep(NaN, 10000),
                 especie = rep(NaN, 10000))

#set.seed(123)
df$trees_infectado <- sample(infected, size = 10000,
                             replace = TRUE, prob = p_infected)
# simulate the type of tree given it is infected or not
#set.seed(123)
df$especie <- ifelse(df$trees_infectado == 1,
       sample(especies, size = 10000, 
              replace = TRUE, prob = p_given_infected),
       sample(especies, size = 10000, 
              replace = TRUE, prob = p_given_infected_c))

table(df$especie)

# cual es la probabilidad que este infectado dado que es m
m_infected <- nrow(filter(df, infected==1 & especie == "m"))
tree_m <- sum(df$especie == "m")
print(m_infected/tree_m)

