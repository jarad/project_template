.source = function(file, ...) {
	.beforesource(...)
	.source(file)
	.aftersource(...)
}

.beforesource = function(i=NULL, method=NULL, figure=NULL, table=NULL, 
												 step=c("sim","inf","fig_sum","tab_sum","fig","tab"),
												 sep="-",data_dir=".data/") {
	switch(step,
				 sim = {
				 	.OUTFILE <<- paste0(data_dir,"sim-",i,".RData")
				 },
				 inf = {
				 	load(paste0(data_dir,"sim",sep,i,".RData"))
				 	.OUTFILE <<- paste0(data_dir,"inf",sep,method,sep,i,".RData")
				 },
				 fig_sum = {
				 	stopifnot()
				  load(paste0(data_dir,"inf",sep,method,sep,i,".RData"))
				  .OUTFILE <<- paste0(data_dir,"sum",sep,figure,sep,method,sep,i,".RData")
				 },
				 tab_sum = {
				  load(paste0(data_dir,"inf",sep,method,sep,i,".RData"))
				  .OUTFILE <<- paste0(data_dir,"sum",sep,table,sep,method,sep,i,".RData")
				 },
				 fig = {
				 	load(paste0(data_dir,"sum",sep,figure,sep,method,sep,i,".RData"))
				 	.OUTFILE <<- paste0(figure,".pdf")
				 },
				 tab = {
				 	load(paste0(data_dir,"sum",sep,table,sep,method,sep,i,".RData"))
				 	.OUTFILE <<- paste0(table,".pdf")
				 }, 
		     {
		      stop("No valid `step` provided.") 	
		     })
}

.aftersource = function(i=NULL, method=NULL, figure=NULL, table=NULL, 
												step=c("sim","inf","sum","fig","tab",data_dir=".data/"),
												sep="-",data_dir=".data/") {
	switch(step,
				 fig = {
				 	print("Not sure what to do here.")
				 },
				 tab = {
				 	print("Not sure what to do here.")
				 },
				 {
				 	# If there is no valid `step`, it should be caught in the .beforesource function.
				 	save.image(file=.OUTFILE)
				 })
	
}
