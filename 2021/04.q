/--- Day 04: Giant Squid ---
/ Read data
/ get d 0 is equivalent to "J"$","sv first d; gets first line and converts string into a vector
/ brds cuts the draws from the data, cuts data into 6 columns, removes the first element of each one (::) and joins them
/ tbl to keep track of the boards and marked indices
d:read0 `:2021/data/04.txt
drws:get d 0
brds:raze@'1_'6 cut get@'1_d
tbl:([] brd:brds;mrkd:null brds)

/ Part 1: What will the final score be for the winning board?
/ bingo function sees if you've got a score of 5 going vertically or horizontally
/ play function marks which numbers have been drawn for each board, and scores of boards that have been won the score list and removes the board from the table
score:()
bingo:{5 in (sum flip x),sum x:5 cut x}
play:{[t;d]
  t:update mrkd:mrkd|d=brd from t;
  score,::exec d*sum@'brd*not mrkd from t where bingo'[mrkd];
  delete from t where bingo'[mrkd]}
tbl play/drws
first score

/ Part 2: What will the final score be for the last board that wins?
last score
