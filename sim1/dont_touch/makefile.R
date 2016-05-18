library(plyr)

source("../util/make_rules.R")


##################################################################
# Build targets, prereqs, and recipes
# Makefile is constructed using these target, prereq, and recipe lines using
# target: prereq
#     recipe

sim = list(target = paste0(data_dir,"sim",sep,1:nsims,".RData"),
					 prereq = rep("sim.R settings.R", nsims),
					 recipe = paste0("Rscript -e"," 'i=",1:nsims,"; source(\"sim.R\")'"))

d = expand.grid(i=1:nsims, method=methods)
inf = list(target = paste0(data_dir,"inf",sep,d$method,sep,d$i,".RData"),
					 prereq = paste0(d$method, ".R ", data_dir,"sim", sep, d$i, ".RData"),
					 recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",d$method,".R\")'"))

f = expand.grid(i=1:nsims, method=methods, fig=figs)
fig_sum = list(target = paste0(data_dir,"sum",sep,f$fig,sep,f$method,sep,f$i,".RData"),
					 prereq = paste0(f$fig,sep,f$method, ".R ", data_dir,"inf",sep, f$method, sep, f$i,".RData"), # should be able to use inf$prereq here
					 recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",f$fig,sep,f$method,".R\")'"))

t = expand.grid(i=1:nsims, method=methods, tab=tabs)
tab_sum = list(target = paste0(data_dir,"sum",sep,t$tab,sep,t$method,sep,t$i,".RData"),
					 prereq = paste0(t$tab,sep,t$method, ".R ", data_dir,"inf",sep, t$method, sep, t$i,".RData"), # should be able to use inf$prereq here
					 recipe = paste0("Rscript -e"," 'i=",d$i,"; source(\"",t$tab,sep,t$method,".R\")'"))

# Figure and table files have many prereqs
f$files = with(f, paste0(data_dir,"sum",sep,fig,sep,method,sep,i,".RData"))
prereq_list = daply(f, .(fig), function(x) paste(x$files,collapse=" "))
fig = list(target = paste0(figs,".pdf"),
					 prereq = paste0(figs,".R ",prereq_list),
					 recipe = paste0("Rscript -e"," 'source(\"",figs,".R\")'"))

t$files = with(t, paste0(data_dir,"sum",sep,tab,sep,method,sep,i,".RData"))
prereq_list = daply(t, .(tab), function(x) paste(x$files,collapse=" "))
tab = list(target = paste0(tabs,".tex"),
					 prereq = paste0(tabs,".R ",prereq_list),
					 recipe = paste0("Rscript -e"," 'source(\"",tabs,".R\")'"))


##################################################################
sink("Makefile")
cat("####################################################\n")
cat("#\n")
cat("# DO NOT MODIFY THIS FILE\n")
cat("#\n")
cat("# modify Makefile.R instead\n")
cat("#\n")
cat("####################################################\n")

# Slurm cluster
cat("ifdef SLURM_JOB_ID\nSHELL=srun\n.SHELLFLAGS= -N1 -n1  bash -c \nendif\n\n")


cat(".PHONY: all\n")
cat("all:",paste(c(fig$target,tab$target),collapse=" "),"\n\n") 
#cat("all:",paste(c(fig_sum$target,tab_sum$target),collapse=" "),"\n\n") 
#cat("all:",paste("f1.pdf",collapse=" "),"\n\n") 

cat("# Simulation rules\n")
make_rules(sim)
cat("\n")

cat("# Inference rules\n")
make_rules(inf)
cat("\n") 

cat("# Figure summary statistic rules\n")
make_rules(fig_sum)
cat("\n")

cat("# Table summary statistic rules\n")
make_rules(tab_sum)
cat("\n")

cat("# Figure rules\n")
make_rules(fig)
cat("\n")

cat("# Table rules\n")
make_rules(tab)
cat("\n")

sink()
