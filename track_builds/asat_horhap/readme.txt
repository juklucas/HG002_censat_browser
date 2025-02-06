Author: Fedor Ryabov :)

Track creation:
1. Run ward-based horhap tool https://github.com/fedorrik/horhap_tool
2. Selected appropriate horhap number for each chromosome based on horhap-specific mutations
3. Horhap bed file is here http://public.gi.ucsc.edu/~fryabov/HG002/HG002_horhap.v2.1.bed

Converting bed to bigBed:
1. I used my custom scripts to convert bed to bigBed. Here is how it works:
	- creates .tsv file with length of each chromosome of reference (HG002)
	- devides score by 10 (because in horhap tracks it's often more than 1000 which is forbidden for bigBed)
	- rounds score to integer
	- replce super long item names (column 4) to "too_long" (it's only usful for crazy stv in stv.bed, so it doesn't metter here)
	- runs bedToBigBed
2. BigBed file is also here http://public.gi.ucsc.edu/~fryabov/HG002/HG002_horhap.v2.1.bb

Organizing github / browser-hub:
1. In courtyard:
	- created dir /public/home/juklucas/public_html/hub_1pt0/horhap
	- copied bigBed using `wget http://public.gi.ucsc.edu/~fryabov/HG002/HG002_horhap.v2.1.bb`
	- updated /public/home/juklucas/public_html/trackDb.txt
2. In github:
	- created dir track_builds/asat_kmeans-horhap
	- wrote this readme and create_asat_kmeans-horhap_track.sh
	- updated hub/trackDb.txt
	- commit
