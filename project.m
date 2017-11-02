m = 5000;
b = 3000;
k = 10000;

x1p0 = 0.2;

A = [0,1,0,0;(-k-k)/m,0,k/m,0;0,0,1,0;k/m,0,-k/m,0]

[values, vectors] = eig(A)
