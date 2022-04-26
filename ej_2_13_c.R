## ej 2.13 c ##

l_pi_1  <- dbinom(470,800,0.4)
l_pi_2  <- dbinom(470,800,0.5)
l_pi_3 <- dbinom(470,800,0.6)
l_pi_4 <- dbinom(470,800,0.7)
p_de_y_470 <- l_pi_1*0.1+ l_pi_2*0.2 + l_pi_3* 0.44 + l_pi_4 * 0.26

p_pi_1 <- l_pi_1 * 0.1 / p_de_y_470
p_pi_2 <- l_pi_2 * 0.2 / p_de_y_470
p_pi_3 <- l_pi_3 * 0.44 / p_de_y_470
p_pi_4 <- l_pi_4 * 0.26 / p_de_y_470

plot(c(p_pi_1,p_pi_2,p_pi_3,p_pi_4))