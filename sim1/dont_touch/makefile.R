
source("../util/make_rules.R")

##################################################################
# Build targets, prereqs, and recipes
# Makefile is constructed using these target, prereqs, recipe lines using
# target: prereq
#     recipe

sim = list(target = paste0(".data/sim-",1:nsims,".RData"),
					 prereq = rep("sim.R", nsims),
					 recipe = paste0("Rscript -e"," 'i=",1:nsims,"; source(\"sim.R\")'"))

d = expand.grid(i=1:nsims, method=methods)
inf = list(target = paste0(".data/inf-",d$method,"-",d$i,".RData"),
					 prereq = paste0(d$method, ".R ", ".data/sim-", d$i, ".RData"),
					 recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",d$method,".R\")'"))

f = expand.grid(i=1:nsims, method=methods, fig=figs)
sum = list(target = paste0(".data/sum-",f$method,"-",f$fig,"-",f$i,".RData"),
					 prereq = paste0(d$method,"-",f$fig, ".R ", ".data/inf-", f$method, "-", f$i,".RData"), # should be able to use inf$prereq here
					 recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",f$method,"-",f$fig,".R\")'"))




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
cat("all:",sum$target,"\n\n") 

make_rules(sim)
make_rules(inf)
make_rules(sum)

sink()
