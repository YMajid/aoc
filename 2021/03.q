/--- Day 03: Binary Diagnostic ---
/ Read data
d:-48+"j"$read0 `:2021/data/03.txt

/ Part 1: What is the power consumption of the submarine?
/ Finding average value of each column, cast to integer to either get 0 or 1
/ Epsilon rate is the opposite of the gamma rate, so we apply not to gamma rate to find it
/ Binary to decimal: 2 sv _
gr:0.5<avg d
er:not gr
prd 2 sv'(gr;er) / 1092896
/ (not;::)@\: allows us to apply multiple functions (:: does nothing) to the same data and get a two item list
prd 2 sv'(not;::)@\:0.5<avg d / 1092896

/ Part 2: What is the life support rating of the submarine?
f:{[bn;fn]
  first {[bn;fn;idx]
	$[1=count bn;bn;bn where bn[;idx]=fn "j"$avg bn[;idx]]
  }[;fn;]/[bn;til count flip bn]}
prd 2 sv'f[d;] each (not;::)
