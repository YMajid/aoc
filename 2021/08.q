/--- Day 08: Seven Segment Search ---
/ Read data
d:" | "vs/: read0 `:2021/data/08.txt
sp:d[;0]
ov:d[;1]

/ Part 1: In the output values, how many times do digits 1, 4, 7, or 8 appear?
/ sum sum raze 2 3 4 7=\:(count'') " "vs' ov / 473
/ sum raze 2 3 4 7 in/:raze count''[" "vs' ov] / 473
sum raze count''[" "vs' ov] in\: 2 3 4 7 / 473

/ Part 2: What do you get if you add up all of the output values?
