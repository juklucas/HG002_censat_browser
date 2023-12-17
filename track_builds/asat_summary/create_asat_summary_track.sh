############################################################################### 
##                             Create BigBeds                                ##
###############################################################################

cd /public/home/juklucas/public_html/hub_1pt0/

conda activate ucsc-bedtobigbed

cp backup/HG002_asat_summary.bed ./

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -tab \
    -as=.HG002_censat_browser/track_builds/asat_summary/asat_summary.as \
    -sizesIs2Bit \
    HG002_asat_summary.bed \
    hg002v1.0.fasta.2bit \
    HG002_asat_summary.bb

conda deactivate


## Don't forget to update the trackDb.txt

############################################################################### 
##                                   DONE                                    ##
###############################################################################