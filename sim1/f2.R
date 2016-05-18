library(plyr)
library(dplyr)
library(ggplot2)


source("settings.R")

fig = "f2"

# Creates data.frame containing names of all the data.frames for this figure/table
#                  DON'T TOUCH THIS
d = expand.grid(i=1:nsims, method=methods, fig=fig)
d$infiles = with(d, paste0(data_dir,"sum",sep,fig,sep,method,sep,i,".RData", sep=""))

# Extract relevant statistics from the data set
s = ddply(d, .(i,method), function(x) {
	load(file=x$infiles)
	data.frame(sd=sd)
}, .inform=TRUE)

# Create plot
g = ggplot(s, aes(method,sd)) + 
	geom_point()

# Save plot with the appropriate name, i.e. paste0(fig,".pdf")
ggsave(paste0(fig,".pdf"), plot=g)
