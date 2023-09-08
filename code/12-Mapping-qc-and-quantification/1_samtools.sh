common_piece_stringPREVIOUS='../../out/11-read-mapping/2_aln-pe-test'
common_piece_string='../../out/12-Mapping-qc-and-quantification/1_aln-pe-test'


samtools view -b "$common_piece_stringPREVIOUS.sam" > "$common_piece_string.bam"
samtools sort "$common_piece_string.bam" > "${common_piece_string}-sorted.bam"
samtools index "${common_piece_string}-sorted.bam"

## see how it is now sorted
samtools view  "$common_piece_string-sorted.bam" | head

## stats
samtools flagstat "$common_piece_string-sorted.bam" > "$common_piece_string-sorted_flagstat.txt"
samtools idxstats "$common_piece_string-sorted.bam" > "$common_piece_string-sorted_idxstats.txt"
samtools stats "$common_piece_string-sorted.bam" > "$common_piece_string-sorted_stats.txt"


