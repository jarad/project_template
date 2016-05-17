stopifnot(method_name != "sum")

sep="-"

infile = paste0(".data/sim",sep,i,".RData")
outfile = paste0(".data/inf",sep,method_name,sep,i,".RData")

load(file=infile)

