# R object passed from makefile:
#    i:      simulation id
method_name = "m2"                
summary_stat = "f2"

source("settings.R") # to set 'sep'
source("dont_touch/load_inf.R")

##################################################################################
# Put code to extract summary statistics here

sd = sd(inf)
save_objects = c("sd")

##################################################################################

source("dont_touch/save.R")
