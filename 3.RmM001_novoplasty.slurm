#!/bin/bash
#SBATCH --job-name=RmM001_novoplasty         # Job name
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dejager4@gmail.com  # Where to send mail	
#SBATCH --nodes=1                       # Run all processes on a single node
#SBATCH --ntasks=1                      # Run on a single task
#SBATCH --cpus-per-task=2               # Number of CPU cores per task
#SBATCH --mem-per-cpu=10G                # Memory required per CPU
#SBATCH --time=03:00:00                 # Time limit hrs:min:sec
#SBATCH --output=/projects/mjolnir1/people/username/palaeobovids/raphicerus/novoplasty/RmM001/RmM001_novoplasty_%j.out        # Standard output log
#SBATCH --error=/projects/mjolnir1/people/username/palaeobovids/raphicerus/novoplasty/RmM001/RmM001_novoplasty_%j.err         # Standard error log

# The %j in the --output & --error lines tells SLURM to substitute the job ID in the name of the output file
# See: https://help.rc.ufl.edu/doc/Sample_SLURM_Scripts#Sample_SLURM_Scripts 
# and https://help.rc.ufl.edu/doc/Annotated_SLURM_Script

# Print compute node name and the date
hostname; date

# This line prints how many CPUs are being used
# It's a sanity check against your SLURM and software-specific settings
echo "Running job on $SLURM_CPUS_ON_NODE CPU cores"

# Load modules and set up enviroment variables
module load novoplasty/4.3.1
CONFIG=/home/username/scripts/novoplasty

# Navigate to working directory
cd /projects/mjolnir1/people/username/palaeobovids/raphicerus/novoplasty/RmM001
mkdir 5Gbp
cd 5Gbp

# Insert commands here:
NOVOPlasty4.3.1.pl -c $CONFIG/config_RmM001_5Gbp.txt

