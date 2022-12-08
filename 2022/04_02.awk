#!/usr/bin/awk -f

BEGIN {
    FS="[^0-9]";
}

($1 >= $3 && $1 <= $4) ||
($2 >= $3 && $2 <= $4) ||
($3 >= $1 && $3 <= $2) ||
($4 >= $1 && $4 <= $2) {
    totalOverlaps++;
    next;
}

END {
    printf("total groups overlapping another: %d\n", totalOverlaps);
}
