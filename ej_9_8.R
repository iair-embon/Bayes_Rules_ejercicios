library(rstanarm)


bike_model <- stan_glm(rides ~ temp_feel, data = bikes,
                       family = gaussian,
                       prior_intercept = normal(5000, 1000),
                       prior = normal(100, 40), 
                       prior_aux = exponential(0.0008),
                       chains = 4, iter = 5000*2, seed = 84735)