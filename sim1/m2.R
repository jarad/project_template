method_name = "m2"  

source("dont_touch/load_sim.R")

##################################################################################
# Put method here
inf = rnorm(10, mean(y)+2, 1) # Fake MCMC samples
save_objects = c("inf")

##################################################################################

source("dont_touch/save.R")
