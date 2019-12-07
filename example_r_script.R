## define own library, if you don't want to use the system library
## If you want to install packages, they will stay in the same location between R version upgrades
.libPaths("~/R/library")

print(paste0(Sys.time(), ": Start"))

## get commandline parameters
args <- commandArgs(trailingOnly = TRUE)
ncores <- args[1]
print(paste0(Sys.time(), ": Cores available: ", ncores))

## Load pacman. This library load packages like the library statement. It will install missing packages instead of failing.
if (!require("pacman")) install.packages("pacman")
pacman::p_load(foreach, doParallel)
print(paste0(Sys.time(), ": Librarys loaded"))

## Load Data
data_vector <- 1:200

## Run Code
if (ncores > 1) {
	## Most data intensive work-loads are slower when parallelized in R. Better use data.table.
	## This is only a minimal not optimized example for parallelization.
	registerDoParallel(cores = ncores)  
	out <- foreach (i = data_vector, .combine = c) %dopar% {
	  sqrt(i)
	}
} else {
	out <- sqrt(data_vector)
}

print(out)

print(paste0(Sys.time(), ": Saving output"))
save(args, ncores, out, file = paste(Sys.Date(),format(Sys.time(), "%H_%M"), "out_ncores", ncores,"save.RData", sep="_"))

print(paste0(Sys.time(), ": Finished"))
