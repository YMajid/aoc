/--- Day 06: Lanternfish ---
/ Read data
/ d:raze "J"$flip ","vs' read0 `:2021/data/06.txt
d:(til[9]!9#0) + count each group raze "J"$flip ","vs' read0 `:2021/data/06.txt

/ Naive solution; too computationally intensive
f:{[days;fish]
  days {x:-1+x;
    idx:where x=0;
    x,::(count idx)#8;
    x[idx]:6;
    x}/[fish]}

f:{@[1_x;6 8;+;x 0]}

/ Part 1: How many lanternfish would there be after 80 days?
show 80 f/[d]

/ Part 2: How many lanternfish would there be after 256 days?
show 256 f/[d]
