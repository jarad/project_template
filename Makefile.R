# This file creates an extremely verbose Makefile
library(plyr)


paper = "paper"    # name of manuscript file w/o .Rnw extension

# simulation studies
nsims = read.csv("nsims.csv")
sim_methods = read.csv("sim_methods.csv")



# You should NOT need to modify anything below
##################################################################

dir_make = paste("\tcd",dirs,"&& $(MAKE)\n")




##################################################################
# Utility functions
##################################################################
make_rule(target,prereq,recipe) {
	cat(paste0(target,": ",prereq,"\n\t",recipe,"\n\n"))
}

##################################################################
# Makefile creation starts here
##################################################################
sink("Makefile")
cat("####################################################\n")
cat("#\n")
cat("# DO NOT MODIFY THIS FILE\n")
cat("#\n")
cat("# modify Makefile.R instead\n")
cat("#\n")
cat("####################################################\n")

# Create variables
cat(paste0("PAPER= ",paper,"\n\n"))

cat("all: $(PAPER).pdf\n\n")


##################################################################
# Rules for simulations
##################################################################
ddply(nsims, .(sim_name,nsims), {
	
})


# Create manuscript
cat("$(PAPER).pdf: $(PAPER).Rnw\n")
for (i in seq_along(dirs)) {
	cat(dir_make[i])
}
cat("\tRscript -e \"library(knitr); knit('$(PAPER).Rnw')\"\n")
cat("\tpdflatex $(PAPER).tex\n\n")

cat(".PHONY: all\n")

sink()