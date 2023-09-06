#!/bin/bash


##########################################################################

## Creating a HISAT2 index

##########################################################################


##########################################################################

## Specify a partition: long or short
#SBATCH --partition=long

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
#SBATCH --time=1:00:00

## Capture the terminal output and save any error messages. This is very useful
## if you have problems and need to ask for help.
#SBATCH --output=%j_%x.out
#SBATCH --error=%
##########################################################################


##########################################################################

## reminder that hisat2 (and the rest of RNA-Seq packages) are installed in the conda environment <obds-rnaseq>
## if not done, already, either run
## load_mamba
## on, in the case mamba is activated but the conda environment isn't,
## mamba activate obds-rnaseq

##########################################################################


##########################################################################

## create the output directory, if it doesnt't exist
mkdir -p /storage/clab0651/genomes/Mus_musculus/Ensembl/GRCm38/Sequence/HISAT/

##########################################################################


##########################################################################

## build index from fasta file

hisat2-build /storage/clab0651/genomes/Mus_musculus/Ensembl/GRCm38/Sequence/Mus_musculus.GRCm38.dna_sm.primary_assembly.fa /storage/clab0651/genomes/Mus_musculus/Ensembl/GRCm38/Sequence/HISAT/mm10

echo '/storage/clab0651/genomes/Mus_musculus/Ensembl/GRCm38/Sequence/HISAT/mm10' created

##########################################################################

