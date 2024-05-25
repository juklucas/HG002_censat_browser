############################################################################### 
##                             Create BigBeds                                ##
###############################################################################

cd /public/home/juklucas/public_html/hub_1pt0/


## Pulled data locs from the HG002 Q100 Polishing Google Presentation (from Nancy)
## In particular "Evaluating HG002-T2T-v1.0.1 assembly with Flagger (04/03/2024)" 

aws s3 cp \
    s3://human-pangenomics/submissions/278062c0-5e2e-11ed-bbdb-0a13c5208311--T2T_HG002_Evaluation/T2T_HG002_v1.0.1/Flagger_v0.4.0/HG002_v1.0.1_Intersection/HG002_v1.0.1_all_3_read_platforms.flagger_v0.4.0_analysis.flagger_final.intersection_per_comp.bed \
    .

aws s3 cp \
    s3://human-pangenomics/submissions/278062c0-5e2e-11ed-bbdb-0a13c5208311--T2T_HG002_Evaluation/T2T_HG002_v1.0.1/Flagger_v0.4.0/HG002_v1.0.1_Intersection/HG002_v1.0.1_any_2_read_platforms.flagger_v0.4.0_analysis.flagger_final.intersection_per_comp.bed \
    .

sed -i '1d' HG002_v1.0.1_any_2_read_platforms.flagger_v0.4.0_analysis.flagger_final.intersection_per_comp.bed
sed -i '1d' HG002_v1.0.1_all_3_read_platforms.flagger_v0.4.0_analysis.flagger_final.intersection_per_comp.bed

conda activate ucsc-bedtobigbed

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -tab \
    -as=HG002_censat_browser/track_builds/flagger/flagger.as \
    -sizesIs2Bit \
    HG002_v1.0.1_all_3_read_platforms.flagger_v0.4.0_analysis.flagger_final.intersection_per_comp.bed  \
    hg002v1.0.fasta.2bit \
    hg002.flagger_all_3_platforms.bb

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -tab \
    -as=HG002_censat_browser/track_builds/flagger/flagger.as \
    -sizesIs2Bit \
    HG002_v1.0.1_any_2_read_platforms.flagger_v0.4.0_analysis.flagger_final.intersection_per_comp.bed  \
    hg002v1.0.fasta.2bit \
    hg002.flagger_any_2_platforms.bb

conda deactivate


rm HG002_v1.0.1_any_2_read_platforms.flagger_v0.4.0_analysis.flagger_final.intersection_per_comp.bed
rm HG002_v1.0.1_all_3_read_platforms.flagger_v0.4.0_analysis.flagger_final.intersection_per_comp.bed

## Don't forget to update the trackDb.txt

############################################################################### 
##                                   DONE                                    ##
###############################################################################