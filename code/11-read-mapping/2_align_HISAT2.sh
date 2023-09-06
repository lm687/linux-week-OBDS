#!/bin/bash
#SBATCH --time=0:01:00

#which hisat2
#hisat2 -h

hisat2 --threads 4 
	-x /path/to/mm10 
	-1 read_1.fastq.qz 
	-2 read_2.fastq.gz
	--rna-strandness RF
	--summary-file stats.txt
	-S aln-pe.sam


