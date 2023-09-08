#!/bin/bash
#SBATCH --time=0:30:00

#which hisat2
#hisat2 -h

## For index
## https://daehwankimlab.github.io/hisat2/download/

hisat2 --threads 4 \
	-x /storage/clab0651/genomes/Mus_musculus/Ensembl/GRCm38/Sequence/HISAT2_premade/mm10/genome \
        --rna-strandness RF \
	--threads 12 \
	-1 ../../resources/1_linux/rnaseq/ERR1755082_1.fastq.gz \
	-2 ../../resources/1_linux/rnaseq/ERR1755082_2.fastq.gz \
	--read-lengths 43,42,41,40,39,38,35 \
	--summary-file ../../out/11-read-mapping/3_stats.txt \
	-S ../../out/11-read-mapping/3_aln-pe.sam

