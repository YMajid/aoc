/--- Day 10: Syntax Scoring ---
/ Read data
d:read0 `:2021/data/10.txt
b:"([{<>}])"
p:b!")]}><{[("
s:b!1 2 3 4 25137 1197 57 3

/ Part 1: What is the total syntax error score for those errors?
f:{
  $[not first x;
    x;
    y in -4#key p;
    $[(last last x)=p y;
      (1b;-1_ last x);
      (0b;y)];
    (1b;last[x],y)]}
r:{f/[(1b;"");x]} each d
sum s r[;1] where not r[;0]

/ Part 2: What is the middle score?
"j"$med {{s[y]+5*x}/[0;reverse x]} each r[;1] where r[;0]
