# R object passed from makefile:
#    i:      simulation id
method_name = "m2"                
summary_stat = "t1"

source("settings.R") # to set 'sep'
source("dont_touch/load_inf.R")

##################################################################################
# Put code to extract summary statistics here

mean = mean(inf)
save_objects = c("mean")

##################################################################################

source("dont_touch/save.R")
