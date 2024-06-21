############################################################################### 
##                             Create BigBeds                                ##
###############################################################################

cd /public/home/juklucas/public_html/hub_1pt0/

conda activate ucsc-bedtobigbed

bedToBigBed \
    -extraIndex=name \
    -type=bed4 \
    -tab \
    -as=HG002_censat_browser/track_builds/asat_cenpb/asat_cenpb.as \
    -sizesIs2Bit \
    hg002v1.0_cenpb.bed  \
    hg002v1.0.fasta.2bit \
    hg002v1.0_cenpb.bb

conda deactivate

## Don't forget to update the trackDb.txt

############################################################################### 
##                                   DONE                                    ##
###############################################################################