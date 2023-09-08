## samtools stats is the input file for multiQC

## this is fast: you do not have to submit as a job
multiqc ../../out/12-Mapping-qc-and-quantification/ --outdir  ../../out/12-Mapping-qc-and-quantification/2_multiqc_results

## copy the output locally like this:
## scp -o 'ProxyJump clab0651@bastion.imm.ox.ac.uk' clab0651@obds:/home/imm/clab0651/linux-week-OBDS/out/12-Mapping-qc-and-quantification/2_multiqc_results/multiqc_report.html .
