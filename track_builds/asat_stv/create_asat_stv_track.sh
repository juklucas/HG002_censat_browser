############################################################################### 
##                             Create BigBeds                                ##
###############################################################################

cd /public/home/juklucas/public_html/hub_1pt0/

gsutil cp \
    gs://fc-7dceaa86-474e-4663-8830-62abdbd11463/submissions/7ab5f3ed-4501-414a-a6a3-704df056b0c1/hor_stv_workflow/69fe72f2-8a12-4d19-8546-e0792f0745df/call-hor_stv/HG002_asm_v1.0_verkko_v1.0_HOR_StV.bed \
    ./

## had to manually remove a huge name
## removed "(_6/4_5)(_6/4_5){7}_6/4(_6/4_5){1}_5(_6/4_5){12}_6/4(_6/4_5){1}_6/4(_6/4_5){9}_6/4(_6/4_5){1}_6/4(_6/4_5){4}_6/4(_6/4_5){1}_6/4(_6/4_5){11}_6/4(_6/4_5){6}_6/4(_6/4_5){1}_6/4(_6/4_5){15}_6/4(_6/4_5){1}_6/4(_6/4_5){3}_6/4(_6/4_5){16}_6/4(_6/4_5){25}-6"
## just called it ".many"
## Also removed 
## track name="ASat_StV" description="ASat HORs Structural Variants" itemRgb="On" visibility="1"

sed '/^track name=/d' HG002_asm_v1.0_verkko_v1.0_HOR_StV.bed > tmp.bed

awk 'BEGIN{FS=OFS="\t"} {
    if (length($4) > 100) {
        split($4, arr, ".");
        $4 = arr[1] ".many";
    }
    print $0;}' \
    tmp.bed \
    > HG002_asm_v1.0_verkko_v1.0_HOR_StV_cleaned.bed

conda activate ucsc-bedtobigbed

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -tab \
    -as=HG002_censat_browser/track_builds/asat_stv/asat_stv.as \
    -sizesIs2Bit \
    HG002_asm_v1.0_verkko_v1.0_HOR_StV_cleaned.bed \
    hg002v1.0.fasta.2bit \
    HG002_asm_v1.0_verkko_v1.0_HOR_StV.bb

conda deactivate

rm tmp.bed
rm HG002_asm_v1.0_verkko_v1.0_HOR_StV_cleaned.bed
rm HG002_asm_v1.0_verkko_v1.0_HOR_StV.bed

## Don't forget to update the trackDb.txt

############################################################################### 
##                                   DONE                                    ##
###############################################################################