####################################################
#
# DO NOT MODIFY THIS FILE
#
# modify Makefile.R instead
#
####################################################
.PHONY: all

all: sim/inf-m1-1.rds sim/inf-m1-2.rds sim/inf-m1-3.rds sim/inf-m2-1.rds sim/inf-m2-2.rds sim/inf-m2-3.rds 



## Simulation rules

sim/sim-1.rds: sim.R
	Rscript -e 'i=1; source("sim.R")'

sim/sim-2.rds: sim.R
	Rscript -e 'i=2; source("sim.R")'

sim/sim-3.rds: sim.R
	Rscript -e 'i=3; source("sim.R")'



## Inference rules

sim/inf-m1-1.rds: m1.R sim/sim-1.rds
	Rscript -e 'i=1; source("m1.R")'

sim/inf-m1-2.rds: m1.R sim/sim-2.rds
	Rscript -e 'i=2; source("m1.R")'

sim/inf-m1-3.rds: m1.R sim/sim-3.rds
	Rscript -e 'i=3; source("m1.R")'

sim/inf-m2-1.rds: m2.R sim/sim-1.rds
	Rscript -e 'i=1; source("m2.R")'

sim/inf-m2-2.rds: m2.R sim/sim-2.rds
	Rscript -e 'i=2; source("m2.R")'

sim/inf-m2-3.rds: m2.R sim/sim-3.rds
	Rscript -e 'i=3; source("m2.R")'

