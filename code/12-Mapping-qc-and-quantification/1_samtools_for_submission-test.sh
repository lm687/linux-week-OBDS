#!/bin/bash
##########################################################################
## A script template for submitting batch jobs. To submit a batch job, 
## please type
##
##    sbatch myprog.sh
##
## Please note that anything after the characters "#SBATCH" on a line
## will be treated as a Slurm option.
##########################################################################

## Specify a partition. For general use, the partition is "batch". 
## Others are available for special purposes.
#SBATCH --partition=short

## The following line will send an email notification to your registered email
## address when the job ends or fails.
#SBATCH --mail-type=END,FAIL

## Specify the amount of memory that your job needs. This is for the whole job.
## Asking for much more memory than needed will mean that it takes longer to
## start when the cluster is busy.
#SBATCH --mem=10G

## Specify the number of CPU cores that your job can use. This is only relevant for
## jobs which are able to take advantage of additional CPU cores. Asking for more
## cores than your job can use will mean that it takes longer to start when the
## cluster is busy.
#SBATCH --ntasks=12

## Specify the maximum amount of time that your job will need to run. Asking for
## the correct amount of time can help to get your job to start quicker. Time is
## specified as HOURS:MINUTES:SECONDS. This example is one week.
#SBATCH --time=0:10:00

## Capture the terminal output and save any error messages. This is very useful
## if you have problems and need to ask for help.
#SBATCH --output=samtools-%j_%x.out
#SBATCH --error=samtools-%j_%x.err

common_piece_stringPREVIOUS='../../out/11-read-mapping/2_aln-pe-test'
common_piece_string='../../out/12-Mapping-qc-and-quantification/1_aln-pe-test'

samtools view -b -h "$common_piece_stringPREVIOUS.sam" --threads 12 | samtools sort --threads 12 -o "$common_piece_string-sorted.bam" - 
samtools index -@ 12 "$common_piece_string-sorted.bam"

# rm "$common_piece_string.bam"
# rm "$common_piece_string-sorted.bam"
# rm "$common_piece_string-sorted.bam.bai"
# ll ../../out/11-read-mapping/
# rm "$common_piece_string-sorted.bam.tmp*"


