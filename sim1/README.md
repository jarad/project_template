In order to use this framework, you will need to 

1. Create simulation code
1. Create inference code
1. Create code to extract summary statistics
1. Create code to construct figures

All intermediate files are saved as .RData files so that the users has complete freedom for what information is available.

Don't touch these lines

    source("dont_touch/...")

## Set up simulation study

1. Modify `settings.R` to set up:
  - simulation settings, e.g. nsims (the number of simulations to run),
  - methods, e.g. `methods=c("m1","m2")`, and
  - desired figures and tables, e.g. `figs=c("f1","f2"); tabs=c("t1","t2")`.
1. Create simulation script, i.e. `sim.R`.
1. Create method scripts, e.g. `m1.R`.
1. For each fig/tab-method combination, create script, e.g. `f1-m1.R`, to extract summary statistics, e.g. CIs. 
1. Create script to create figure or table, e.g. `f1.R` and `t1.R`.
1. Create Makefile by running `Rscript Makefile.R`.

## Run everything

To run everything use:

    $ make
    
or 

    $ make all

Alternative useful targets are 

    $ make sims             # to make all the simulations
    $ make simulationss     # to make all the simulations
    $ make inference        # to perform all the inference
    $ make summary          # to extract all the summary statistics for making figures and tables
    $ make figs             # to create all the figures
    $ make figuress         # to create all the figures
    $ make tabs             # to create all the tables
    $ make tables           # to create all the tables
    $ make clean            # to delete all the .data/*.RData files.
    $ make clean-all        # same as `make clean` but also deletes all figure and table files

## Modifying existing scripts

Modify any of the existing scripts and then run `make`. 

## Adding scripts

To add a script for any part of the process, you will need to update the `settings.R` file and create the script(s).
Then run `Rscript Makefile.R` to create a new Makefile and then run `make` to actually perform the analysis.
