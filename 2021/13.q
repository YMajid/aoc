/--- Day 13: Transparent Origami ---
/ Read data
d:read0 `:2021/data/13.txt;
coords:"J"$","vs'd where d like "[0-9]*";
folds:flip "SJ"$flip"="vs'last@'" "vs'd where d like "fold*";

/ Part 1: How many dots are visible after completing just the first fold instruction on your transparent paper?
n:1+max @[;0]flip coords;
m:1+max @[;1]flip coords;
/ Naive solution; making the grid and actually reducing it
/
g:{y[last x;first x]:1;y};
fx:{
    a:y[;til last x];
    b:reverse@'y[;1+last[x]+til last x];
    c:a+b}

fy:{
    a:y[til last x;];
    b:reverse y[1+last[x]+til last x;];
    c:a+b}

grid:sum g[;(m;n)#0]each coords;
r:{$[`x=first x;fx;fy] . (x;y)}[;grid] each folds;
show sum sum 0<''first r;
\

/ Much, much faster
/ Given all coordinates and flip values, we can modify coordinates that will be flipped and leave the rest the same and return the distinct coordinates
fx:{[c;f]
    distinct .[c;(where f<c[;0];0);(2*f)-]};
fy:{[c;f]
    distinct .[c;(where f<c[;1];1);(2*f)-]};
r:{$[`x=first y;fx;fy] . (x;last y)}\[coords;folds]
count first r

/ Part 2: What code do you use to activate the infrared thermal imaging camera system?
