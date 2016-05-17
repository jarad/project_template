library(plyr)
library(dplyr)
library(ggplot2)


source("settings.R")

d = expand.grid(i=1:nsims, method=methods, fig="f1")
d$infiles = with(d, paste0(data_dir,"sum",sep,fig,sep,method,sep,i,".RData", sep=""))

s = ddply(d, .(i,method), function(x) {
	load(file=x$infiles)
	data.frame(median=median)
}, .inform=TRUE)

ggplot()