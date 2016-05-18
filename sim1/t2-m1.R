# R object passed from makefile:
#    i:      simulation id
method_name = "m1"                
summary_stat = "t2"

source("settings.R") # to set 'sep'
source("dont_touch/load_inf.R")

##################################################################################
# Put code to extract summary statistics here

var = var(inf)
save_objects = c("var")

##################################################################################

source("dont_touch/save.R")
