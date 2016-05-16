# project_template

A template for project organization meant to help graduate students organize their work and make it reproducible.

For most of my projects, there are a number of simulation studies, a real data analysis, and a manuscript. 
Each simulation study involve the SISF steps

1. Generate **S**imulations.
1. Perform **I**nference using all combinations of simulations and methods.
1. Extract summary **S**tatistics.
1. Create **F**igures and tables.

Each of these steps can be time consuming. 
The real data analysis also follows the SISF steps although typically the number of methods that are used is reduced based on findings in the simulation study. 
Finally, a manuscript is written that pulls in figures and tables and has additional prose. 
Sometimes parts of this manuscript are used in other locations, in particular as part of a student's creative component or thesis. 

The goal of this template is to provide my students (or anybody else who is interested) in a framework for organizing papers and thesis chapters. The key points of the framework are 

- each simulation study is modular
- there is one makefile that will compile the whole project
- each simulation study will be module
  - in its own directory
  - with its own makefile
- the makefiles will be set up to be run on a SLURM cluster


