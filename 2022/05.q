/--- Day 05: Supply Stacks ---
d:(0,where d like "")_ d:read0`:data/05.txt;
stack:{
  n:"J"$n last where (n:last x) in .Q.n;
  :trim flip -1_ x[;1+4*til n];
  }[first d];
moves:{0 -1 -1+get x where x in .Q.n," "}'[1_ last d];
f:{[f;s;m]
  s:@[s;m 2;{y,x};f m[0]#s m 1];
  s:@[s;m 1;{y _ x};m 0];
  :s;
  };
f:{[f;s;m]
  :@/[s;m 1 2;(m[0]_;f[m[0]#s m 1],)];
  };

/--- Part 01 ---
0N!first each f[reverse]/[stack;moves];

/--- Part 02 ---
0N!first each f[::]/[stack;moves];
