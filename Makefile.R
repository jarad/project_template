# This file creates Makefile
paper = "paper"    # name of manuscript file w/o .Rnw extension
dirs = c("sim1")   # name of directories manuscript depends on

# You should NOT need to modify anything below
##################################################################

dir_make = paste("\tcd",dirs,"&& $(MAKE)\n")

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

# Create manuscript
cat("$(PAPER).pdf: $(PAPER).Rnw\n")
for (i in seq_along(dirs)) {
	cat(dir_make[i])
}
cat("\tRscript -e \"library(knitr); knit('$(PAPER).Rnw')\"\n")
cat("\tpdflatex $(PAPER).tex\n\n")

cat(".PHONY: all\n")

sink()