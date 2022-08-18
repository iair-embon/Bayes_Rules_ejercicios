library(bayesrules)

# a
# El modelo beta-binomial

# b
# mi prior es un modelo beta(2,3.5), donde pi estaria mas abajo que en la mitad,
#y poseo bastante incertidumbre sobre el parametro
plot_beta(2,3.5, mean = T)

# c
plot_beta(1,2)

# d
str(pulse_of_the_nation)
prop_pi_sample <- sum(pulse_of_the_nation$climate_change == "Not Real At All")/nrow(pulse_of_the_nation)

# e
alpha <- 1
beta <- 2
y <- 150
n <- 1000

new_alpha <- alpha+y
new_beta <-  beta + n-y

posterior_sim <- rbeta(10000,new_alpha,new_beta)
plot_beta(new_alpha,new_beta)

ci_95_middle <- qbeta(c(0.025,0.975), new_alpha,new_beta)


