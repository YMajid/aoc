/--- Day 01: Sonar Sweep ---
/ Read data
d:"J"$(),read0 `:2021/data/01.txt

/ Part 1: How many measurements are larger than the previous measurement?
/ Can use deltas to get the count, but would need to subtract 1 from the result as the predecessor of the first item is 0 and our count would be 1 too large
/ Defined deltas0 such that 0 is the first item of the result, that way we don't need to subtract 1 from the final result
deltas0:{first[x]-':x}
count where 0 < deltas0 d / 1521

/ Part 2: How many sums are larger than the previous sum?
/ msums gives us the moving sums, where the first argument is the size of the window and the second is a numeric list
/ Since we passed in 3 as our first argument, the first sum is the first value and the second is the sum of the first two, so we drop them
/ Use deltas0 instead of deltas for same reasoning as before
count where 0 < deltas0 2_3 msum d / 1543
