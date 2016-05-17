
infile = paste0(".data/inf-",method_name,"-",i,".RData")
outfile = paste0(".data/sum-",method_name,"-",summary_stat,"-",i,".RData")

load(file=infile)
