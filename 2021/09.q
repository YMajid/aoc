/--- Day 09: Smoke Basin ---
/ Read data
d:"J"$''read0 `:2021/data/09.txt
c:til[count d]cross til count d 0 / To index
m:(1 0;-1 0;0 1;0 -1)

/ Part 1: What is the sum of the risk levels of all low points on your heightmap?
/ For each coordinate, explore its neighbourhood and see if it is smaller than all of its neighbours
sum 1+d ./:lp:c where {all (d . x) < 0w^d ./:x+/:m} each c / 506

/ Part 2: What do you get if you multiply together the sizes of the three largest basins?
/ BFS
f:{
    q:enlist x;
    v:enlist 0N 0N;
    while[count q;
      n:first q;
      q:1_q;
      if [not n in v;
          v,:enlist n;
          o:n+/:m;
          o:o where not o in v;
          sc:d ./:o;
          q:q,o where (sc<9) and sc > d . n];];
    1+count v}

prd 3#desc f peach lp
