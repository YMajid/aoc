/--- Day 11: Dumbo Octopus ---
/ Read data
d:-48+"j"$read0 `:2021/data/11.txt;

/ Part 1: How many total flashes are there after 100 steps?
c:til[count d] cross til count first d;
m:(-1 0 1 cross -1 0 1) except enlist (0 0);

g:{
  og:first x;
  fo:c where 9<(og .) each c;
  fo:fo except pf:last x;
  adj:raze fo+\:/:m;
  adj:adj where all each (adj>-1) and adj<count og;
  og:{.[x;y;+;1]}/[og;adj];
  (og;pf,fo)};

f:{
  og:x 0;
  flashes:x 1;
  steps:1+x 2;
  og:first g/[(og+1;enlist 0N 0N)];
  if[(count raze og)=nf:sum raze 9<og;:steps];
  og:{@[x;where 9<x;:;0]} each og;
  (og;flashes+nf;steps)};
f/[100;(d;0;0)] @ 1

/ Part 2: What is the first step during which all octopuses flash?
last f/[{3=count x};(d;0;0)]
