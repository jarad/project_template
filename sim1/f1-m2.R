# R object passed from makefile:
#    i:      simulation id
method_name = "m2"                
summary_stat = "f1"

source("settings.R") # to set 'sep'
source("dont_touch/load_inf.R")

##################################################################################
# Put code to extract summary statistics here

median = median(inf)
save_objects = c("median")

##################################################################################

source("dont_touch/save.R")
