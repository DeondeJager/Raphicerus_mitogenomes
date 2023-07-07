#!/bin/bash
#SBATCH --job-name=RsM001_mito_map_novoplasty         # Job name
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dejager4@gmail.com  # Where to send mail	
#SBATCH --nodes=1                       # Run all processes on a single node
#SBATCH --ntasks=1                      # Run on a single task
#SBATCH --cpus-per-task=10               # Number of CPU cores per task
#SBATCH --mem-per-cpu=10G                # Memory required per CPU
#SBATCH --time=08:00:00                 # Time limit hrs:min:sec
#SBATCH --output=/projects/mjolnir1/people/username/palaeobovids/raphicerus/mitogenomes_final/RsM001_mito_map_novoplasty_%j.out        # Standard output log
#SBATCH --error=/projects/mjolnir1/people/username/palaeobovids/raphicerus/mitogenomes_final/RsM001_mito_map_novoplasty_%j.err         # Standard error log

# The %j in the --output & --error lines tells SLURM to substitute the job ID in the name of the output file
# See: https://help.rc.ufl.edu/doc/Sample_SLURM_Scripts#Sample_SLURM_Scripts 
# and https://help.rc.ufl.edu/doc/Annotated_SLURM_Script

# Print compute node name and the date
hostname; date

# This line prints how many CPUs are being used
# It's a sanity check against your SLURM and software-specific settings
echo "Running job on $SLURM_CPUS_ON_NODE CPU cores"

# Load modules (conda environments are loaded and unloaded as need the *.sh script)
module load bwa/0.7.17
module load samtools/1.15
module load gatk4/4.3.0.0 # For MarkDuplicates & CollectWgsMetrics
module load java-jdk/8.0.112 # For gatk

# Navigate to working directory
cd /projects/mjolnir1/people/username/palaeobovids/raphicerus/

# Order of input arguments
## $1 - Threads
## $2 - Clean data path
## $3 - Clean reads parent name (without .clean.intlv.5Gbp.fastq.gz)
## $4 - Code name for sample
## $5 - Results folder
## $6 - Path to reference (including file name)
## $7 - Reference code name

# Call script
bash /home/username/scripts/mapping/MapWGS_mito.sh \
 10 \
 /projects/mjolnir1/people/username/palaeobovids/raphicerus/clean_data \
 RsM001_FKDN230042836-1A_HNCK2DSX3_L4 \
 RsM001 \
 /projects/mjolnir1/people/username/palaeobovids/raphicerus/mitogenomes_final \
 /projects/mjolnir1/people/username/palaeobovids/raphicerus/mitogenomes_final/novoplasty/RsM001.circular.rolled.8002.fasta \
 RsM001_novoplasty
