### ej 3.1 ###

library(bayesrules)
library(tidyverse)

 ## a 

# no tengo idea che.. jaja
# adivino

plot_beta(10,15, mean = TRUE) 

## b
plot_beta(80,20) # estos podrian ser
# la var da mal, pruebo otra prop
plot_beta(40,10) 
# la var da mal, pruebo otra prop
plot_beta(4,1)  # da Var = 0.02666667
# pruebo otro
plot_beta(2,0.5) # da var = 0.04571429
# pruebo otro
plot_beta(1,0.25) # me paso...

## c
plot_beta(80,8.888889999) # de media va bien
plot_beta(5,(8.888889999)/16) # austo varianza


## D
plot_beta(0.5,0.5)

