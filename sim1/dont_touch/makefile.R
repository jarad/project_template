
source("../util/make_rules.R")

sep = "-" # To create directories, use "/". To create files, use "-".

##################################################################
# Build targets, prereqs, and recipes
# Makefile is constructed using these target, prereq, and recipe lines using
# target: prereq
#     recipe

sim = list(target = paste0(".data/sim",sep,1:nsims,".RData"),
					 prereq = rep("sim.R", nsims),
					 recipe = paste0("Rscript -e"," 'i=",1:nsims,"; source(\"sim.R\")'"))

d = expand.grid(i=1:nsims, method=methods)
inf = list(target = paste0(".data/inf",sep,d$method,sep,d$i,".RData"),
					 prereq = paste0(d$method, ".R ", ".data/sim", sep, d$i, ".RData"),
					 recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",d$method,".R\")'"))

f = expand.grid(i=1:nsims, method=methods, fig=figs)
fig = list(target = paste0(".data/sum",sep,f$fig,sep,f$method,sep,f$i,".RData"),
					 prereq = paste0(f$fig,sep,f$method, ".R ", ".data/inf",sep, f$method, sep, f$i,".RData"), # should be able to use inf$prereq here
					 recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",f$fig,sep,f$method,".R\")'"))

t = expand.grid(i=1:nsims, method=methods, tab=tabs)
tab = list(target = paste0(".data/sum",sep,t$tab,sep,t$method,sep,t$i,".RData"),
					 prereq = paste0(t$tab,sep,t$method, ".R ", ".data/inf",sep, t$method, sep, t$i,".RData"), # should be able to use inf$prereq here
					 recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",t$tab,sep,t$method,".R\")'"))



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
cat("all:",tab$target,"\n\n") 

cat("# Simulation rules\n")
make_rules(sim)
cat("\n")

cat("# Inference rules\n")
make_rules(inf)
cat("\n") 

cat("# Figure summary statistic rules\n")
make_rules(fig)
cat("\n")

cat("# Table summary statistic rules\n")
make_rules(tab)
cat("\n")

sink()
