#!/bin/bash
#SBATCH --job-name=SubsampleReads         # Job name
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dejager4@gmail.com  # Where to send mail	
#SBATCH --nodes=1                       # Run all processes on a single node
#SBATCH --ntasks=1                      # Run on a single task
#SBATCH --cpus-per-task=4               # Number of CPU cores per task
#SBATCH --mem-per-cpu=30G                # Memory required per CPU
#SBATCH --time=02:00:00                 # Time limit hrs:min:sec
#SBATCH --output=/projects/mjolnir1/people/username/palaeobovids/raphicerus/novoplasty/SubsampleReads_%j.out        # Standard output log
#SBATCH --error=/projects/mjolnir1/people/username/palaeobovids/raphicerus/novoplasty/SubsampleReads_%j.err         # Standard error log

# The %j in the --output & --error lines tells SLURM to substitute the job ID in the name of the output file
# See: https://help.rc.ufl.edu/doc/Sample_SLURM_Scripts#Sample_SLURM_Scripts 
# and https://help.rc.ufl.edu/doc/Annotated_SLURM_Script

# Print compute node name and the date
hostname; date

# This line prints how many CPUs are being used
# It's a sanity check against your SLURM and software-specific settings
echo "Running job on $SLURM_CPUS_ON_NODE CPU cores"

# Activate conda environment (if module is not available)
#source /home/username/.bashrc
#conda activate /projects/mjolnir1/apps/conda/...

# Load modules and set up enviroment variables
module load bbmap/39.01
READS=/projects/mjolnir1/people/username/palaeobovids/raphicerus/clean_data

# Navigate to working directory
cd /projects/mjolnir1/people/username/palaeobovids/raphicerus/novoplasty

# Insert commands here:
## Subsample reads to 1Gbp of data to test novoplasty assembly ability and accuracy

### RmM001:
#### Subsample and interleave reads
reformat.sh \
 in=$READS/RmM001/RmM001_FKDN230042835-1A_HNCK2DSX3_L4_1.clean.fq.gz \
 in2=$READS/RmM001/RmM001_FKDN230042835-1A_HNCK2DSX3_L4_2.clean.fq.gz \
 out=$READS/RmM001/RmM001_FKDN230042835-1A_HNCK2DSX3_L4.clean.intlv.5Gbp.temp.fq.gz \
 samplebasestarget=5000000000

#### Replace spaces in names by underscores, add slash (/1 and /2) to read names without a space, change extension to .fastq.gz
reformat.sh \
 in=$READS/RmM001/RmM001_FKDN230042835-1A_HNCK2DSX3_L4.clean.intlv.5Gbp.temp.fq.gz \
 out=$READS/RmM001/RmM001_FKDN230042835-1A_HNCK2DSX3_L4.clean.intlv.5Gbp.fastq.gz \
 underscore=t \
 addslash=t spaceslash=f \
 int=t

#### Remove temp file
rm $READS/RmM001/RmM001_FKDN230042835-1A_HNCK2DSX3_L4.clean.intlv.5Gbp.temp.fq.gz

### RsM001:
#### Subsample and interleave reads
reformat.sh \
 in=$READS/RsM001/RsM001_FKDN230042836-1A_HNCK2DSX3_L4_1.clean.fq.gz \
 in2=$READS/RsM001/RsM001_FKDN230042836-1A_HNCK2DSX3_L4_2.clean.fq.gz \
 out=$READS/RsM001/RsM001_FKDN230042836-1A_HNCK2DSX3_L4.clean.intlv.5Gbp.temp.fq.gz \
 samplebasestarget=5000000000

#### Replace spaces in names by underscores, add slash (/1 and /2) to read names without a space, change extension to .fastq.gz
reformat.sh \
 in=$READS/RsM001/RsM001_FKDN230042836-1A_HNCK2DSX3_L4.clean.intlv.5Gbp.temp.fq.gz \
 out=$READS/RsM001/RsM001_FKDN230042836-1A_HNCK2DSX3_L4.clean.intlv.5Gbp.fastq.gz \
 underscore=t \
 addslash=t spaceslash=f \
 int=t

#### Remove temp file
rm $READS/RsM001/RsM001_FKDN230042836-1A_HNCK2DSX3_L4.clean.intlv.5Gbp.temp.fq.gz

