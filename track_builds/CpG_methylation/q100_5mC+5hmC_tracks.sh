# modkit pileup with aligned bam(containing MM/ML tags)
modkit(v0.3.0) pileup \
	${methyl_bam} \
	-t 16 \
	--mod-threshold m:0.80 \
	--cpg \
	-r ${reference_fasta} \
	-o "${methyl_bam%.bam}.pileup.bed" \
	--only-tabs \
	--log "${methyl_bam%.bam}.pileup.log"

# select only 5mC methylation
grep -P "\tm\t" "${methyl_bam%.bam}.pileup.bed" > "${methyl_bam%.bam}.5mC.pileup.bed"
# select fraction modified column if valid coverage is over 5
awk 'BEGIN {OFS=FS="\t"} { if ( $10 > 5 ) print $1, $2, $3, $11 }' > "${methyl_bam%.bam}.5mC.pileup.bedgraph"

# select only 5hmC methylation
grep -P "\th\t" "${methyl_bam%.bam}.pileup.bed" > "${methyl_bam%.bam}.5hmC.pileup.bed"
# select fraction modified column if valid coverage is over 5
awk 'BEGIN {OFS=FS="\t"} { if ( $10 > 5 ) print $1, $2, $3, $11 }' > "${methyl_bam%.bam}.5hmC.pileup.bedgraph"

# Convert bedgraph to bigwig
conda create -n ucsc-bedgraphtobigwig -c bioconda -c conda-forge ucsc-bedgraphtobigwig
conda activate ucsc-bedgraphtobigwig
bedGraphToBigWig ${begraph} ${genome_sizes} ${output_bigwig}
conda deactivate