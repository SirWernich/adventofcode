#!/usr/bin/gawk -f

BEGIN {
    currentElf = 0;
}

/[0-9]+/ {
    currentTotal += $1;
}

# for some reason blank line is one char, so /^$/ doesn't work :(
length($0) == 1 {
    totals[currentElf] = currentTotal;
    currentTotal = 0;
    currentElf++;
}

END {
    cnt = asort(totals, sorted);

    for (i = cnt; i > cnt - 3; i--) {
        grandTotal += sorted[i];
    }

    printf("Top 3 elves: %d\n", grandTotal);
}