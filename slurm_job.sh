#!/bin/bash

#SBATCH --job-name=slurm_r_example            	# replace the name 
#SBATCH --mail-type=ALL							# needed for mail notifications
#SBATCH --ntasks=1 								# Tasks are an advanced feature. They are created in this batch skript or using R-package "rslurm".
#SBATCH --qos=medium							# options differ. Get options: sacctmgr show qos format=name,priority
#SBATCH --cpus-per-task=1	# <- 				# Change the number of cores you want to use here. This number will be passed to the R-script.
#SBATCH --mem=100                             	# replace with amount (in MB) suitable for your job
#SBATCH --time=0:05:00                         	# replace with amount suitable for your job
#SBATCH -o slurm-output.%j.out					# name of output file, %j is the job ID
##SBATCH --mail-user=mail@domain.com  # <-		# replace with your own address and uncomment

# module load R 								# Load R module (often needed on CentOS/RHEL Cluster)

cd ~/slurm_template_for_R_Language            		# replace with your own directory
Rscript example_r_script.R ${SLURM_CPUS_PER_TASK}	# replace with your own program