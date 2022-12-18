/--- Day 02: Rock Paper Scissors ---
d:`$" " vs' read0 `:data/02.txt;

/--- Part 01 ---
scrs:((cross/)(`A`B`C;`X`Y`Z))!(9#1 2 3)+raze 1 0 -1 rotate\:0 3 6;
0N!sum scrs d;

/--- Part 02 ---
scrs:((cross/)(`A`B`C;`X`Y`Z))!(9#0 3 6)+raze -1 0 1 rotate\:1 2 3;
0N!sum scrs d;
