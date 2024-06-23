# using aligned bam with only duplex reads:
modkit(v0.3.0) pileup-hemi \
	${duplex_bam} \
	-t 16 \
	--mod-threshold m:0.80 \
	--cpg \
	-r ${reference_fasta} \
	-o "${duplex_bam%.bam}.pileup.bed" \
	--only-tabs \
	--log "${duplex_bam%.bam}.pileup-hemi.log"

# Separate plus and minus strand hemi-methylation
# For plus strand hemi-methylation
grep -P "\tm,-,C\t" ${pileup-hemi_bed} > ${pileup-hemi_minus_bed}
awk '{OFS=FS="\t"} {print $1, $2, $3, $12}' ${pileup-hemi_minus_bed} > ${pileup-hemi_minus-cov_bedgraph}

# For minus strand hemi-methylation
grep -P "\t-,m,C\t" ${pileup-hemi_bed} > ${pileup-hemi_plus_bed}
awk '{OFS=FS="\t"} {print $1, $2, $3, $12}' ${pileup-hemi_plus_bed} > ${pileup-hemi_plus-cov_bedgraph}

# convert into aggregate plus an minus strand net hemi-methylation 
# positive numbers means + strand bias, negative numbers means - strand bias. In reference coordinates.
conda activate bedtools
bedtools unionbedg -i ${pileup-hemi_plus-cov_bedgraph} ${pileup-hemi_minus-cov_bedgraph} > ${combo_cov.bedgraph}
conda deactivate

awk 'BEGIN{OFS="\t"} 
{
    # If the columns from plus.bed or minus.bed are missing (.), set them to 0
    plus = ($4 == "." ? 0 : $4);
    minus = ($5 == "." ? 0 : $5);
    print $1, $2, $3, plus - minus
}' "${output}_combo_cov.bedgraph" > "${output}_net_cov.bedgraph"