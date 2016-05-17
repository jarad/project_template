
sep = "-"

infile = paste0(".data/",method_name,sep,i,".RData")
outfile = paste0(".data/sum-",summary_stat,sep,method_name,sep,i,".RData")

load(file=infile)
