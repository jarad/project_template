stopifnot(method_name != "sum")

infile = paste0(".data/sim-",i,".RData")
outfile = paste0(".data/inf-",method_name,"-",i,".RData")

load(file=infile)

