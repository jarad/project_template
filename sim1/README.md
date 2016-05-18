In order to use this framework, you will need to 

1. Create simulation code
1. Create inference code
1. Create code to extract summary statistics
1. Create code to construct figures

All intermediate files are saved as .RData files so that the users has complete freedom for what information is available.

Don't touch these lines

    source("dont_touch/...")

## Create simulation code

1. Update `sims.R` to create simulations.
1. Specify `nsims` in `settings.R`.

## Create inference code

1. Create method scripts, e.g. m1.R.
1. Update `settings.R` with the methods, e.g. methods=c("m1"). 

TODO: How to deal with the same methods, but with different tuning parameters. See issue #1. 

## Create code to extract summary statistics, e.g. CIs

1. Create script to extract summary statistics for each fig-method combination, e.g. f1-m1.R. 
1. Update `settings.R` with the necessary figs, e.g. figs=c("f1"). 

## Create code to create figures and tables

1. Create script to create figure or table, e.g. f1.R or t1.R.
