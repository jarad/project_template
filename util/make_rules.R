##################################################################
# Utility functions
##################################################################
make_rule = function(target,prereq=NULL,recipe=NULL,.PHONY=FALSE) {
	if (.PHONY) cat(".PHONY:", target,"\n")
	cat(paste0(target,": ",prereq,"\n\t",recipe,"\n\n"))
}

make_rules = function(x,...) {
	UseMethod("make_rules",x)
}

make_rules.character = function(targets,prereqs,recipes) {
	stopifnot(length(targets)==length(prereqs))
	stopifnot(length(targets)==length(recipes))
	for (i in seq_along(targets)) {
		make_rule(targets[i], prereqs[i], recipes[i])
	}
}

make_rules.list = function(all) {
	make_rules.character(all$target, all$prereq, all$recipe)
}

