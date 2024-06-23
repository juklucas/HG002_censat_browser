# use fibertools extract
conda create -n fibertools -c bioconda -c conda-forge fibertools-rs
conda activate fibertools
ft extract --cpg ${5mC_bed12} --m6a ${m6a_bed12} --nuc ${nuc_bed12} --msp ${msp_bed12}
conda deactivate

# run bed12 fixing script to remove duplicate blocks that occasionally occur at the ends of reads
# this raises an issue when converting to bigbed
git clone https://github.com/jmenendez98/fiberseq.git
cp fix_ftextract.sh . && chmod +x fix_ftextract.sh
fix_ftextract.sh -i ${broken_bed12} -o ${fixed_bed12}

# convert bed12 to bigbed
conda create -n ucsc-bedtobigbed -c bioconda ucsc-bedtobigbed
conda activate ucsc-bedtobigbed
bedToBigBed \
    -type="bed12" \
    -as="${as_file}" \
    -sizesIs2Bit \
    "${input_bed12}" \
    "${ref_2bit}" \
    "${output_bigbed}"
conda deactivate