
# You should NOT need to modify anything below
##################################################################
# Makefile is constructed using these target, depends, recipe lines using
# target: depend
#     recipe

sim_target = paste0("sim/sim-",1:nsims,".RData")
sim_depend = rep("sim.R", nsims)
sim_recipe = paste0("Rscript -e"," 'i=",1:nsims,"; source(\"sim.R\")'")

d = expand.grid(i=1:nsims, method=methods)
inf_target = paste0("sim/inf-",d$method,"-",d$i,".RData")
inf_depend = paste0(d$method, ".R ", "sim/sim-", d$i, ".RData")
inf_recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",d$method,".R\")'")

f = expand.grid(i=1:nsims, method=methods, fig=figs)
sum_target = paste0("sim/sum-",f$method,"-",f$i,".RData")
sum_depend = paste0(d$method,"-",f$fig, ".R ", "sim/inf-", f$method,"-",f$fig, "-", f$i, ".RData") # should be able to use inf_depend here
sum_recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",f$method,"-",f$fig,".R\")'")

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
for (i in sef_along(sim_target)) {
	cat(sim_target[i],sim_depend[i],sep=': ')
	cat("\n")
	cat(paste0("\t",sim_recipe[i]))
	cat("\n\n")
}

# Inf rules
cat("\n\n## Inference rules\n\n")
for (i in sef_along(inf_target)) {
	cat(inf_target[i],inf_depend[i],sep=': ')
	cat("\n")
	cat(paste0("\t",inf_recipe[i]))
	cat("\n\n")
}

# Sum rules
cat("\n\n## Summary rules\n\n")
for (i in sef_along(sum_target)) {
	cat(sum_target[i],sum_depend[i],sep=': ')
	cat("\n")
	cat(paste0("\t",sum_recipe[i]))
	cat("\n\n")
}
sink()
