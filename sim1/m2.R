# R object passed from make file:
#    i:      simulation id
method_name = "m2"                # Do NOT use "sum"

load(file=paste0("sim/sim-",i,".RData"))                       # Don't change this line

##################################################################################
# Put method here with results called 'inf'
inf = rnorm(10, mean(y)+2, 1) # Fake MCMC samples

##################################################################################

save(inf, file=paste0("sim/inf-",method_name,"-",i,".RData")) # Don't change this line
