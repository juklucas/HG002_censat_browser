############################################################################### 
##                             Create BigBeds                                ##
###############################################################################

cd /public/home/juklucas/public_html/hub_1pt0/

cp /public/home/jmmenend/hg002-browser/hg002.merged.CDR.bed ./

awk '{print $0 "\tCDR"}' hg002.merged.CDR.bed  > hg002.merged.named.CDR.bed 

conda activate ucsc-bedtobigbed

bedToBigBed \
    -extraIndex=name \
    -type=bed4 \
    -tab \
    -as=HG002_censat_browser/track_builds/asat_cdr/asat_cdr.as \
    -sizesIs2Bit \
    hg002.merged.named.CDR.bed  \
    hg002v1.0.fasta.2bit \
    hg002.merged.named.CDR.bb

conda deactivate


rm hg002.merged.named.CDR.bed
rm hg002.merged.CDR.bed

## Don't forget to update the trackDb.txt

############################################################################### 
##                                   DONE                                    ##
###############################################################################