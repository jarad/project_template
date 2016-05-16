In order to use this framework, you will need to 

1. Create simulation code
1. Create inference code
1. Create code to extract summary statistics
1. Create code to construct figures

All intermediate files are saved as .RData files so that the users has complete freedom for what information is available.

## Create simulation code

1. Update `sims.R` to create simulations.
1. Specify `nsims` in `Makefile.R`.

## Create inference code

1. Create method scripts, i.e. <method>.R.
1. Update `Makefile.R` with the <method>s. 

TODO: How to deal with the same methods, but with different tuning parameters. See issue #1. 

## Create code to extract summary statistics, e.g. CIs

1. 