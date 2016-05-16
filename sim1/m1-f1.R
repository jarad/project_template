# R object passed from makefile:
#    i:      simulation id
method_name = "m1"                
summary_stat = "f1"

source("dont_touch/load_inf.R")

##################################################################################
# Put code to extract summary statistics here

sum = median(inf)

save_objects()
##################################################################################

source("dont_touch/save_sum.R")
