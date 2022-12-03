#!/usr/bin/gawk -f

BEGIN {
    highestTotal = 0;
    currentTotal = 0;
}

/[0-9]+/ {
    currentTotal += $1;
}

# for some reason blank line is one char, so /^$/ doesn't work :(
length($0) == 1 {
    if (currentTotal > highestTotal) {
        highestTotal = currentTotal;
    }
    
    currentTotal = 0;
}

END {
    if (currentTotal > highestTotal) {
        highestTotal = currentTotal;
    }

    printf("highest total: %d\n", highestTotal);
}