/--- Day 12: Passage Pathing ---
/ Read data
d:(!) . flip raze (::;reverse each)@\:`$"-"vs 'read0 `:2021/data/12.txt

/ Part 1: How many paths through this cave system are there that visit small caves at most once?
/ Helper functions
/ Finds values in dictionary corresponding to a key
f:{value[x] where key[x]=y}
/ Finds all values that are not equal to `end and are lowercase (small caves)
g:{x where (x<>`end) and any each string[x] in\:.Q.a}

/ Backtracking algorithm, used to find all possible paths
backtrack:{[cc;cl;fl]
    cl,:cc;        / Append current cave to cave list
    $[cc=`end;
      enlist cl;   / Return cave list if we've reached the end
      [sc:$[fl or  / Part 1/Part 2 logic
            (any 2=count each group sc) or 0=count sc:g cl;
            enlist sc;
            sc except/:sc];
       nc:f[d;cc];                    / Find next caves
       nc:nc where nc<>`start;        / Filter out the `start cave
       nc:raze nc except/:sc;         / Filter out small caves
       raze .z.s[;cl;fl] each distinct nc]      / Recurse
      ]};

count raze backtrack[;();1b] peach f[d;`start]

/ Part 2: How many paths through this cave system are there that visit small caves at most twice?
count raze backtrack[;();0b] peach f[d;`start]
