
# a
post_proba_alt_H <- 1- pbeta(0.4, 4, 3)

# b
post_proba_null_H <- pbeta(0.4, 4, 3)
post_odds <- post_proba_alt_H/post_proba_null_H
# la alt_H es casi 5 veces mas probable que la null_H desde la posterior

# c
prior_proba_alt_H <- 1- pbeta(0.4, 1, 0.8)
prior_proba_null_H <- pbeta(0.4, 1, 0.8)
prior_odds <- prior_proba_alt_H/prior_proba_null_H
# la alt_H es casi 2 veces mas probable que la null_H desde nuestro prior

# d
BF <- post_odds/prior_odds
# el factor de bayes explica cuanto ha evolucionado nuestro 
# conocimiento desde el prior hasta el posterior, sobre el parametro pi, 
# luego de ver los datos.
# en nuestro caso, la posibilidad de la alt_H se ha incrementado sutilmente luego de
# haber visto los datos. 


