#!/usr/bin/awk -f

# A / X = Rock
# B / Y = Paper
# C / Z = Scissors

BEGIN {
    print "BEGIN";
    gameScore["C"]["X"] = 6; # X > C
    gameScore["A"]["X"] = 3; # X = A
    gameScore["B"]["X"] = 0; # X < B
    gameScore["A"]["Y"] = 6; # Y > A
    gameScore["B"]["Y"] = 3; # Y = B
    gameScore["C"]["Y"] = 0; # Y < C
    gameScore["B"]["Z"] = 6; # Z > B
    gameScore["C"]["Z"] = 3; # Z = C
    gameScore["A"]["Z"] = 0; # Z < A

    playScore["X"] = 1;
    playScore["Y"] = 2;
    playScore["Z"] = 3;

    totalScore = 0;
}

{
    totalScore += gameScore[$1][$2] + playScore[$2];
}

END {
    printf "Total: %d\n", totalScore;
}