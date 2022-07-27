/--- Day 07: The Treachery of Whales ---
/ Read data
d:"J"$raze ","vs' read0 `:2021/data/07.txt

/ Part 1: How much fuel must they spend to align to that position?
/ Minimum amount of fuel needed to spend is the sum of the difference between each position and the median
sum abs d-med d / 347509

/ Part 2: How much fuel must they spend to align to that position?
min sum {(x*x+1)div 2}@'abs d-\:d / 98257206
