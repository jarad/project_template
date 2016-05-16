# R object passed from make file:
#    i:      simulation id
method_name = "m2"                # Do NOT use "sum"

d = readRDS(file=paste0("sim/sim-",i,".rds"))              # Don't change this line

##################################################################################
# Put method here with results called 'inf'
inf = rnorm(10, mean(d)+2, 1) # Fake MCMC samples

##################################################################################

saveRDS(inf, file=paste0("sim/inf-",method_name,"-",i,".rds")) # Don't change this line
