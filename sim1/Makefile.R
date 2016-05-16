# This file creates Makefile
nsims = 3
methods = c("m1","m2")


# You should NOT need to modify anything below
##################################################################
# Makefile is constructed using these target, depends, recipe lines using
# target: depend
#     recipe

sim_target = paste0("sim/sim-",1:nsims,".rds")
sim_depend = rep("sim.R", nsims)
sim_recipe = paste0("Rscript -e"," 'i=",1:nsims,"; source(\"sim.R\")'")

d = expand.grid(i=1:nsims, method_name=methods)
inf_target = paste0("sim/inf-",d$method_name,"-",d$i,".rds")
inf_depend = paste0(d$method_name, ".R ", "sim/sim-", d$i, ".rds")
inf_recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",d$method_name,".R\")'")

##################################################################
sink("Makefile")
cat("####################################################\n")
cat("#\n")
cat("# DO NOT MODIFY THIS FILE\n")
cat("#\n")
cat("# modify Makefile.R instead\n")
cat("#\n")
cat("####################################################\n")

cat(".PHONY: all\n\n")
cat("all:",inf_target,"\n\n") 

# Sim rules
cat("\n\n## Simulation rules\n\n")
for (i in seq_along(sim_target)) {
	cat(sim_target[i],sim_depend[i],sep=': ')
	cat("\n")
	cat(paste0("\t",sim_recipe[i]))
	cat("\n\n")
}

# Inf rules
cat("\n\n## Inference rules\n\n")
for (i in seq_along(inf_target)) {
	cat(inf_target[i],inf_depend[i],sep=': ')
	cat("\n")
	cat(paste0("\t",inf_recipe[i]))
	cat("\n\n")
}
sink()