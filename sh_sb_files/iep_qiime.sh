#!/bin/bash
#SBATCH --job-name=iep_qiime2_denoise    #Job name
#SBATCH --partition=batch             # Partition (queue) name
#SBATCH --ntasks=1                    # Run on a single CPU by default
#SBATCH --cpus-per-task=1             # Number of CPU cores per task
#SBATCH --mem=20gb                    # Job memory request
#SBATCH --time=48:00:00               # Time limit hrs:min:sec
#SBATCH --output=log.%j.out           # Standard output log
#SBATCH --error=log.%j.err            # Standard error log
#SBATCH --mail-type=ALL               # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=iep99624@uga.edu  # Where to send mail	

cd $SLURM_SUBMIT_DIR
ml QIIME2/2023.7

qiime dada2 denoise-paired
    --i-demultiplexed-seqs paired_end_seq.qza
    --p-trim-left-f 10
    --p-trim-left-r 10
    --p-trunc-len-f 251 
    --p-trunc-len-r 251
    --o-representative-sequences rep-seq.qza
    --o-table table.qza
    --o-denoising-stats denoising-stats.qza
