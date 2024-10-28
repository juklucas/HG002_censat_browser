Author: Fedor Ryabov :)

Track creation:
1. Found chm13 kmeans horhap bed files from 2022 chm13 censat paper
2. Extracted lowest-k horhaps as HOR sequences, aligned, got hmms
3. Run HMMER on each chromosome of HG002 with hmms of horhap
	- for ONE chromosome I used horhap hmms from this chromosome only
	- result: bed files for each chromosomes (both pat and mat in one file)
4. Colored beds accoding to colors in sourse kmeans files
5. Filtered beds using score/length >= 1 filter
6. Merged into one bed file which is here http://public.gi.ucsc.edu/~fryabov/HG002/chm13_low-k_kmeans-horhaps_hmmer_to_hg002.bed

Converting bed to bigBed:
1. I used my custom scripts to convert bed to bigBed. Here is how it works:
	- creates .tsv file with length of each chromosome of reference (HG002)
	- devides score by 10 (because in horhap tracks it's often more than 1000 which is forbidden for bigBed)
	- rounds score to integer
	- replce super long item names (column 4) to "too_long" (it's only usful for crazy stv in stv.bed, so it doesn't metter here)
	- runs bedToBigBed
2. BigBed file is also here http://public.gi.ucsc.edu/~fryabov/HG002/chm13_low-k_kmeans-horhaps_hmmer_to_hg002.bb

Organizing github / browser-hub:
1. In courtyard:
	- created dir /public/home/juklucas/public_html/hub_1pt0/horhap
	- copied bigBed using `wget http://public.gi.ucsc.edu/~fryabov/HG002/chm13_low-k_kmeans-horhaps_hmmer_to_hg002.bb`
	- updated /public/home/juklucas/public_html/trackDb.txt
2. In github:
	- created dir track_builds/asat_kmeans-horhap
	- wrote this readme and create_asat_kmeans-horhap_track.sh with wget command mentioned above
	- updated hub/trackDb.txt
	- commit
