#!/usr/bin/awk -f

# A = Rock
# B = Paper
# C = Scissors

# X = Lose
# Y = Draw
# Z = Win

BEGIN {
    print "BEGIN";
    playNeeded["A"]["X"] = "C"; # Lose
    playNeeded["B"]["X"] = "A"; # Lose
    playNeeded["C"]["X"] = "B"; # Lose
    playNeeded["A"]["Y"] = "A"; # Draw
    playNeeded["B"]["Y"] = "B"; # Draw
    playNeeded["C"]["Y"] = "C"; # Draw
    playNeeded["A"]["Z"] = "B"; # Win
    playNeeded["B"]["Z"] = "C"; # Win
    playNeeded["C"]["Z"] = "A"; # Win

    resultScore["X"] = 0;
    resultScore["Y"] = 3;
    resultScore["Z"] = 6;

    playScore["A"] = 1;
    playScore["B"] = 2;
    playScore["C"] = 3;

    totalScore = 0;
}

{
    played = playNeeded[$1][$2];
    totalScore += resultScore[$2] + playScore[played];
}

END {
    printf "Total: %d\n", totalScore;
}