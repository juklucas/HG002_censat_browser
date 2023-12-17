###############################################################################
##                           Prepare Conda Envs                              ##
###############################################################################

conda create \
	-c bioconda \
	-n ucsc-fatotwobit \
	ucsc-fatotwobit

conda create \
	-c bioconda \
	-n ucsc-bedtobigbed \
	ucsc-bedtobigbed


###############################################################################
##                           Prepare 2Bit File                               ##
###############################################################################

## Courtyard 
## ssh -i ~/.ssh/public_rsa juklucas@courtyard.gi.ucsc.edu
cd /public/home/juklucas/public_html/hub_1pt0/

wget https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/HG002/assemblies/hg002v1.0.fasta.gz

conda activate ucsc-fatotwobit

faToTwoBit \
	hg002v1.0.fasta.gz \
	hg002v1.0.fasta.2bit

conda deactivate

rm hg002v1.0.fasta.gz


###############################################################################
##                           Pull In Hub Files                               ##
###############################################################################

git clone https://github.com/juklucas/HG002_censat_browser.git

cp HG002_censat_browser/hub/* ./

## Then execute all of the commands in each track_build's shell file

###############################################################################
##                                 DONE                                      ##
###############################################################################