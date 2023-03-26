tic
A = [2,-6,-1; -3,-2,7; -8,1,-2];
b = [-38,-34,-20]';
M = [A b];

disp(M)

R = rref(M);

disp(R)

toc











