library(plyr)
library(dplyr)
library(ggplot2)


source("settings.R")

fig = "f2"

d = expand.grid(i=1:nsims, method=methods, fig=fig)
d$infiles = with(d, paste0(data_dir,"sum",sep,fig,sep,method,sep,i,".RData", sep=""))

s = ddply(d, .(i,method), function(x) {
	load(file=x$infiles)
	data.frame(sd=sd)
}, .inform=TRUE)

g = ggplot(s, aes(method,sd)) + 
	geom_point()

ggsave(paste0(fig,".pdf"), plot=g)
