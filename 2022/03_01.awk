#!/usr/bin/awk -f

BEGIN {
    FS = "";

    for (i = 65; i <= 90; i++) {
        lowercaseValue = i - 64;
        uppercaseValue = lowercaseValue + 26;

        letterValues[sprintf("%c", i)] = uppercaseValue;
        letterValues[sprintf("%c", i + 32)] = lowercaseValue;
    }
}

{
    middle = NF / 2;

    bag1 = substr($0, 1, middle);
    bag2 = substr($0, middle + 1);

    for (i = 1; i <= middle; i++) {
        idx = index(bag2, $i);
        if (idx > 0) {
            totalPriorities += letterValues[$i];
            next;
        }
    }
}

END {
    printf("total priorities: %d\n", totalPriorities);
}
