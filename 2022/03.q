/--- Day 02: Rock Paper Scissors ---
d:read0 `:data/03.txt;
priority:(.Q.a,.Q.A)!(1+til 26),27+til 26;
f:{priority first inter/[x]};

/--- Part 01 ---
/ 0N!sum priority {first .[inter;(0;div[count x;2])_ x]} each d;
0N!sum f each 2 0N#/:d;

/--- Part 02 ---
0N!sum f each 0N 3#d;
