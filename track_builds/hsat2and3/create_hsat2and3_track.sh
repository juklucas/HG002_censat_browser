############################################################################### 
##                             Create BigBed                                 ##
###############################################################################

cd /public/home/juklucas/public_html/hub_1pt0/

gsutil cp \
    'gs://fc-7dceaa86-474e-4663-8830-62abdbd11463/submissions/85498b59-893d-4556-af50-051d33f2a0eb/identify_hSat2and3_wf/f4b9d01f-95b1-44b9-bea9-a5e963fb9b44/call-identify_hSat2and3/attempt-2/glob-0cf2dda8b61bdd48f400d7bffd4c5d48/hg002v1.0.HSat2and3_Regions.bed' submissions/85498b59-893d-4556-af50-051d33f2a0eb/identify_hSat2and3_wf/f4b9d01f-95b1-44b9-bea9-a5e963fb9b44/call-identify_hSat2and3/attempt-2/glob-0cf2dda8b61bdd48f400d7bffd4c5d48/hg002v1.0.HSat2and3_Regions.bed \
    ./


bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -tab \
    -as=HG002_censat_browser/track_builds/hsat2and3/hsat2and3.as \
    -sizesIs2Bit \
    hg002v1.0.HSat2and3_Regions.bed  \
    hg002v1.0.fasta.2bit \
    hg002v1.0.HSat2and3_Regions.bb 


## Don't forget to update the trackDb.txt

############################################################################### 
##                                   DONE                                    ##
###############################################################################