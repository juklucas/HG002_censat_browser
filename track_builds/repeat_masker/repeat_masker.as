table rmskBed
"RepeatMasker"
    (
    string chrom;    "Genomic sequence name"
    uint chromStart;     "Start in genomic sequence"
    uint chromEnd;       "End in genomic sequence"
    string name;     "TE Family Name"
    uint score;       "Raw score from RepeatMasker"
    char[1] strand;     "Relative orientation + or -"
    string class;   "RepeatMasker Class"
    string subclass;     "RepeatMasker subclass or undefined"
    float divergence;     "Kimura divergence from *.align file"
    int linkageId;      "linkage id from repeatmaster"
    )