stopifnot(method != "sum")

infile = paste0("sim/sim-",i,".RData")
outfile = paste0("sim/inf-",method_name,"-",i,".RData")

load(file=infile)

