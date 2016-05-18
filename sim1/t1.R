library(plyr)
library(dplyr)
library(xtable)


source("settings.R")

tab = "t1"

# Creates data.frame containing names of all the data.frames for this figure/table
#                  DON'T TOUCH THIS
d = expand.grid(i=1:nsims, method=methods, tab=tab)
d$infiles = with(d, paste0(data_dir,"sum",sep,tab,sep,method,sep,i,".RData", sep=""))

# Extract relevant statistics from the data set
s = ddply(d, .(i,method), function(x) {
	load(file=x$infiles)
	data.frame(mean=mean)
}, .inform=TRUE)

# Create table
tt = xtable(s, caption="Simulation means")

# Save table with appropriate name, i.e. paste0(tab,".tex")
print(tt, file=paste0(tab,".tex"))
