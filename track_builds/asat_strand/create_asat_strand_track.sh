############################################################################### 
##                             Create BigBeds                                ##
###############################################################################

cd /public/home/juklucas/public_html/hub_1pt0/

gsutil cp \
    gs://fc-7dceaa86-474e-4663-8830-62abdbd11463/submissions/d7c768eb-6938-40ff-a250-1a5c06e97255/alphaSat_HMMER_workflow/88cbfe45-f0dc-4531-b9c7-1a05d64818bd/call-combine_beds/AS-SF-vs-HG002_asm_v1.0.bed \
    ./

conda activate ucsc-bedtobigbed

## Normally I'd just use the strand file, but I need to create a new one here 
## because I used an old version of the WDL for HG002 v1.0
awk -F $'\t' 'BEGIN {OFS = FS} {if ($6=="+") {$9="0,0,255"}; \
    if ($6=="-") {$9="255,0,0"} print $0}' \
        AS-SF-vs-HG002_asm_v1.0.bed \
    > AS-strand-vs-HG002_asm_v1.0.bed

## Get rid of floating point numbers...
awk 'BEGIN{OFS="\t"} {$5=100} 1' AS-strand-vs-HG002_asm_v1.0.bed > AS-strand-vs-HG002_asm_v1.0.forbb.bed


bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -tab \
    -as=HG002_censat_browser/track_builds/asat_strand/asat_strand.as \
    -sizesIs2Bit \
    AS-strand-vs-HG002_asm_v1.0.forbb.bed \
    hg002v1.0.fasta.2bit \
    AS-strand-vs-HG002_asm_v1.0.bb

conda deactivate


rm AS-SF-vs-HG002_asm_v1.0.bed
rm AS-strand-vs-HG002_asm_v1.0.bed
rm AS-strand-vs-HG002_asm_v1.0.forbb.bed

## Don't forget to update the trackDb.txt

############################################################################### 
##                                   DONE                                    ##
###############################################################################