/--- Day 5: Hydrothermal Venture ---
/ Read data
d:"J"$(),","vs''" -> "vs/: read0 `:2021/data/05.txt

/ Get range between two numbers, x and y
rng:{$[0<a:y-x;1+x+til a;
	  0>a;reverse 1+y+til neg a;
	  x]}

/ Get placement of each line
f:{[x;y;diag]
  $[(x[0]=y[0])|x[1]=y[1];
    (cross/) rng ./:flip (x;y);
	diag;
	(,') . rng ./:flip (x;y);
	()]}

/ Part 1: At how many points do at least two lines overlap considering horizontal and vertical lines?
sum 1<count each group raze f[;;0b] .' d

/ Part 2: At how many points do at least two lines overlaps considering all lines?
sum 1<count each group raze f[;;1b] .' d
