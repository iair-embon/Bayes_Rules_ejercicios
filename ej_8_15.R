# a
# based on the credible intervals I belive that pi>.1

# b
post_prob <- 1-pbeta(.1, new_alpha,new_beta)

# la posterior probability es bastante alta

# c
posterior_odds <- post_prob/ (1-post_prob)

# que pi>.1 es 3197444 veces mas probable que pi<.1

prior_prob <- 1-pbeta(.1,1,2)

prior_odds <- prior_prob/ (1- prior_prob)

# saco el factor de bayes
BF <- posterior_odds/ prior_odds
# segun lo observado en el factor de bayes, luego de observar los datos, el posterior
# odds es 750017 veces (aproximadamente) mas probable que el prior_odds
# Entonces, como BF > 1, la posiblidad de la Ha (pi>.1) incremento notoriamente
# a la luz de los datos observados. Confiamos bastante en la Ha.


