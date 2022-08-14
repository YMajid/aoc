/--- Day 14: Extended Polymerization ---
/ Read data
pt:first d:read0 `:2021/data/14.txt;
piRules:raze {(enlist `$x)!enlist (`$x[0],y;`$y,x[1])} .' " -> "vs/: 2 _ d;

/ Part 1: What do you get if you take the quantity of the most common element and subtract the quantity of the least common element?
/
Get all pairs in the polymer template
For x=2, 'next\[x-1;y]' will make a list of two equal length strings where the first is the orignal y and the second is y with next applied to it
The 'flip' operator will match each character from the first string to its matching character in the second string
The negative drop will get rid of the final string, which is not a pair
E.g. "NNCB" -next\[x-1;y]-> ("NNCB";"NCB ") -flip-> ("NN";"NC";"CB";"B ") -neg[x-1] _-> ("NN";"NC";"CB")
\
ptPairs:{neg[x-1] _ flip next\[x-1;y]}
/ Keep track of how many times each pair appears
piFreq:key[piRules]!"j"$sum (`$ptPairs[2;pt])=\:key piRules;

f:{
    / Input validation; if there are no pair insertions
    if[all 0=\:value x;'"No pair insertions available."]
    / Get pair insertions (k), their results (piRules k), the frequency of each insertion (freq) and then add/subtract the frequency of each pair insertion in the dictionary
    x:{@[x;last y;+;first y]}/[x;flip (freq:x k;piRules k:where 0<x)];
    x:{@[x;last y;-;first y]}/[x;flip (freq;k)];
    / Return resulting dict
    x};

g:{
    / Input validation; if there are no pair insertions
    if[all 0=\:value x;0];
    / Get distinct keys
    k:distinct raze string key x;
    / Element frequency
    d:k!{div[;2] sum (sum each y=/:string key x)*x}[x;] each k;
    d[last pt]+:1;
    / Difference between most and least frequent elements
    (-) . (max;min)@\:d};

show -1+g f/[10;piFreq];

/ Part 2: What do you get if you take the quantity of the most common element and subtract the quantity of the least common element?
show g f/[40;piFreq];
