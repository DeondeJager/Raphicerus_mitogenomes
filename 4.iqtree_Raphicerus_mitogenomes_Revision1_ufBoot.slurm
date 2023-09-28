#!/bin/bash
#SBATCH --job-name=iqtree_Raph_mito_rev1_ufBoot     # Job name
#SBATCH --mail-type=BEGIN,END,FAIL     # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dejager4@gmail.com # Where to send mail	
#SBATCH --nodes=1                       # Run all processes on a single node
#SBATCH --ntasks=1                      # Run on a single task
#SBATCH --cpus-per-task=4               # Number of CPU cores per task
#SBATCH --mem-per-cpu=10G               # Memory required per CPU
#SBATCH --time=24:00:00                # Time limit hrs:min:sec
#SBATCH --output=/projects/mjolnir1/people/pzx702/palaeobovids/raphicerus/iqtree/mito/MitochondrialDNApartB/Revision1/ufBoot/iqtree_Raph_mito_rev1_ufBoot_%j.out    # Standard output log
#SBATCH --error=/projects/mjolnir1/people/pzx702/palaeobovids/raphicerus/iqtree/mito/MitochondrialDNApartB/Revision1/ufBoot/iqtree_Raph_mito_rev1_ufBoot_%j.err     # Standard error log

# The %j in the --output & --error lines tells SLURM to substitute the job ID in the name of the output file
# See: https://help.rc.ufl.edu/doc/Sample_SLURM_Scripts#Sample_SLURM_Scripts
# and https://help.rc.ufl.edu/doc/Annotated_SLURM_Script

# Print compute node name and the date
hostname; date

# This line prints how many CPUs are being used 
# It's a sanity check against your SLURM and software-specific settings
echo "Running job on $SLURM_CPUS_ON_NODE CPU cores"

# Load module
module load iqtree/2.2.0

# Navigate to working directory and set up variables
cd /projects/mjolnir1/people/pzx702/palaeobovids/raphicerus/iqtree/mito/MitochondrialDNApartB/Revision1/ufBoot

# Insert commands
## Data partitioned based on PCGs, rRNAs, and tRNAs - note that these alignments are in separate files, which are included in the
## "n7_charset.nex" file, so the alignment files are not specified in the iqtree command itself. Taxon names must be identical in all three files.
iqtree2 -p n7_charset.nex \
 -m MFP+MERGE \
 -o Aepyceros_melampus_NC_020675 \
 -T AUTO \
 --runs 2 \
 --threads-max 4 \
 -B 1000 \
 -alrt 1000

