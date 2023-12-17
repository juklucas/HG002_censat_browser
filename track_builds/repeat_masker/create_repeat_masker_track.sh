############################################################################### 
##                             Create BigBed                                 ##
###############################################################################

cd /public/home/juklucas/public_html/hub_1pt0/

wget http://public.gi.ucsc.edu/~hloucks/HG002/hg002v1.0.fasta.RM.bed

conda activate ucsc-bedtobigbed

bedToBigBed \
    -extraIndex=name \
    -type=bed4+6 \
    -tab \
    -as=HG002_censat_browser/track_builds/repeat_masker/repeat_masker.as \
    -sizesIs2Bit \
    hg002v1.0.fasta.RM.bed \
    hg002v1.0.fasta.2bit  \
    hg002v1.0.RM.bb

conda deactivate ucsc-bedtobigbed

rm hg002v1.0.fasta.RM.bed

## Don't forget to update the trackDb.txt

############################################################################### 
##                                   DONE                                    ##
###############################################################################