/--- Day 02: Dive! ---
/ Read data
/ Convert data into a vector, take the first character of every action and convert it into a symbol and convert each step into an integer
d:flip "SJ"$flip 1#''" "vs' read0 `:2021/data/02.txt

/ Part 1: What do you get if you multiply your final horizontal position by your final depth?
/ Naive solution: simply summing each symbol, finding the differences and multipling
h:sum d[where flip[d][0]=`f][;1]
v:(sum d[where flip[d][0]=`d][;1])-sum d[where flip[d][0]=`u][;1]
prd h,v / 2039256
/ Using Cond, $, and Over, /
/ Passing in (0;0) to track the horizontal and vertical positions, then passing each item in d
/ Position tracker is modified based on item being passed in
f:{$[`f~first y;x+(last y;0);`d~first y;x+(0;last y);x-(0;last y)]};
prd f/[(0;0);d] / 2039256

/ Part 2: What do you get if you multiply your final horizontal position by your final depth?
/ Using Cond, $, and Over, /
/ Essentially same as part 1, just add another item in the list to track the aim
f:{$[`f~first y;x+(last y;x[2]*last y;0);`d~first y;x+(0;0;last y);x-(0;0;last y)]};
prd 2#f/[(0;0;0);d] / 1856459736
