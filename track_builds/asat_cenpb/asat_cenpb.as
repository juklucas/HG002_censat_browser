table ASat_CENPB
"ASat CENP-B binding sites: CENP-B predictions based on regex search of merged centromeric regions"
    (
    string chrom;    "Genomic sequence name"
    uint chromStart;     "Start in genomic sequence"
    uint chromEnd;       "End in genomic sequence"
    string name;     "binding sequence"
    uint score;       "always 100"
    char[1] strand;     "Relative orientation + or -"
    uint thickStart;   "Start of where display should be thick"
    uint thickEnd;     "End of where display should be thick"
    uint reserved;     "color"
    )