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

NR % 3 == 1 {
    split("", groupContents);
}

{
    split("", lineContents);
    for (i = 1; i <= NF; i++) {
        lineContents[$i] = $i
    }

    for (letter in lineContents) {
        groupContents[letter]++;

        if (groupContents[letter] == 3) {
            totalPriorities += letterValues[letter];
            next;
        }
    }
}

END {
    printf("total priorities: %d\n", totalPriorities);
}
