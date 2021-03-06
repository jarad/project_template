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
- the makefiles will be set up to be able to run on a SLURM cluster

**CURRENTLY ONLY THE SIM1 DIRECTORY IS WORKING**

## Setup

To set this up to work propoerly, you need to have `make` which will automatically come with Mac/Linux builds of R but on a Windows machine [Rtools](http://cran.r-project.org/bin/windows/Rtools/) will need to be installed separately. 

In addition, if you want to be able to click on the `Build All` button in RStudio, you need to setup RStudio to work with makefiles, in particular 

- Tools > Project Options... > Code:Editing 
  - unselect 'Insert spaces for tab'
- Tools > Project Options... > Build Tools 
  - set 'Project Build Tools' to 'Makefile'
  - restart RStudio
 

## Resources

In approximately the order of importance. 

- [Makefiles and R](http://robjhyndman.com/hyndsight/makefiles/)
- [Makefiles and Slurm](http://plindenbaum.blogspot.com/2014/09/parallelizing-gnu-make-4-in-slurm.html)
- [Make manual](https://www.gnu.org/software/make/manual/html_node/index.html)
- [Example Makefile w/ R](http://stat545.com/automation04_make-activity.html)
- [Make with RStudio](http://www.r-bloggers.com/rstudio-and-makefiles-mind-your-options/)
