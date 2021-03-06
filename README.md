# Template for using R on a HPC with Slurm
[![Build Status](https://cloud.drone.io/api/badges/ndevln/slurm_template_for_R_Language/status.svg)](https://cloud.drone.io/ndevln/slurm_template_for_R_Language)
## How to run

**Clone git repository**
```bash
cd ~
git clone https://github.com/ndevln/slurm_template_for_R_Language.git
cd slurm_template_for_R_Language
```

**Optional: Modify files**
1. Modify R library location in example_r_script.R (line 3)
2. Add your e-mail address to slurm_job.sh (line 11)
3. Check if QOS medium is avaliable: `sacctmgr show qos format=name,priority` (slurm_job.sh: line 6)
4. Load the R module if needed (on CentOS/RHEL) (slurm_job.sh: line 13).

**Start Slurm job**
```bash
sbatch slurm_job.sh
```

**Check job status** (replace 'username' with your username on the server):
```bash
squeue -u username
```

### This script was tested on the High-Performance-Cluster of the Freie Universität Berlin, Germany
My thanks go to our awesome HPC Team.

[High-Performance Computing at ZEDAT](https://www.fu-berlin.de/en/sites/high-performance-computing/index.html)