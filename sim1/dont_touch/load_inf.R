
infile = paste0("sim/inf-",method_name,"-",i,".RData")
outfile = paste0("sim/sum-",method_name,"-",summary_stat,"-",i,".RData")

load(file=infile)
