############################################################################### 
##                             Create BigBeds                                ##
###############################################################################

cd /public/home/juklucas/public_html/hub_1pt0/

gsutil cp \
    gs://fc-7dceaa86-474e-4663-8830-62abdbd11463/submissions/d7c768eb-6938-40ff-a250-1a5c06e97255/alphaSat_HMMER_workflow/88cbfe45-f0dc-4531-b9c7-1a05d64818bd/call-combine_beds/AS-HOR-vs-HG002_asm_v1.0.bed \
    ./

## get rid of floating point number in 5th bed column (bedtobigbed errors out otherwise)
awk 'BEGIN{OFS="\t"} {$5=100} 1' AS-HOR-vs-HG002_asm_v1.0.bed > AS-HOR-vs-HG002_asm_v1.0_forbb.bed

conda activate ucsc-bedtobigbed

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -tab \
    -as=.HG002_censat_browser/track_builds/asat_hor/asat_hor.as \ \
    -sizesIs2Bit \
    AS-HOR-vs-HG002_asm_v1.0_forbb.bed \
    hg002v1.0.fasta.2bit \
    AS-HOR-vs-HG002_asm_v1.0.bb

conda deactivate


rm AS-HOR-vs-HG002_asm_v1.0.bed
rm AS-HOR-vs-HG002_asm_v1.0_forbb.bed

## Don't forget to update the trackDb.txt

############################################################################### 
##                                   DONE                                    ##
###############################################################################