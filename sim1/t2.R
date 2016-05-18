library(plyr)
library(dplyr)
library(xtable)


source("settings.R")

tab = "t2"

d = expand.grid(i=1:nsims, method=methods, tab=tab)
d$infiles = with(d, paste0(data_dir,"sum",sep,tab,sep,method,sep,i,".RData", sep=""))

s = ddply(d, .(i,method), function(x) {
	load(file=x$infiles)
	data.frame(var=var)
}, .inform=TRUE)

tt = xtable(s, caption="Simulation variances")
print(tt, file=paste0(tab,".tex"))
