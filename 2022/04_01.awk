#!/usr/bin/awk -f

BEGIN {
    FS="[^0-9]";
}

($1 <= $3 && $2 >= $4) ||
($1 >= $3 && $2 <= $4) {
    totalContained++;
}

END {
    printf("total groups in another: %d\n", totalContained);
}
