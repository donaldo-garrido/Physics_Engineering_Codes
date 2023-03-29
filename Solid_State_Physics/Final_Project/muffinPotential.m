function h = muffinPotential( N, v, p1, p2 )
%OPENWELL2D 2D Finite well with open boundary conditions
%   N  = number of basis states in 1D (total matrix size is N+1 x N+1)
%   v  = depth of well, should be negative
%   p1 = start of the well in units of a
%   p2 = end   of the well in units of a
%   h  = dimensionless Hamiltonian
%N = 3; v = -1; p1 = 1; p2 = 2;
% Converts {1,2,3,4,...} -> {0,1,-1,2,-2,...}
%N = 12; v = -1; p1 = 0.25; p2 = 0.75;

j = 1:N+1;
a = (1 + (2*j - 1).*(-1).^j)./4;

% Naive encoding, using meshgrid to generate pairwise combinations
[p,q] = meshgrid(a,a);

n     = [p(:) q(:)];

nx = n(:,1); ny = n(:,2);

% Increasing energy encoding
n2 = zeros((N+1)*(N+1),1);
n  = [n2,n];
% Appending n^2 column to sort by
n(:,1) = n(:,2).*n(:,2) + n(:,3).*n(:,3);

% Sorting by n^2 to give increasing energy encoding
[T,I] = sort(n(:,1));

n     = n(I,:);
nx    = n(:,2); ny = n(:,3); n2 = n(:,1);

pointsInt = 100;

% Populating diagonal matrix elements
len = 1;
p = p2 - p1;
h = diag(4*n2+v*p*p);

x = linspace(0,len,pointsInt);
y = x;
[X, Y] = meshgrid(x,y);
area = zeros(pointsInt,pointsInt);
R = p/2;

for ii = 1:length(x)
    for jj = 1:length(y)
        r = sqrt((x(ii)-len/2).^2+(y(jj)-len/2)^2);
        if r < R
           area(ii,jj) = 1; 
        end
    end
end

figure(2)
surf(X,Y,area)}

for i = 1:(N+1)*(N+1)
    for j = i+1:(N+1)*(N+1) 
        F = exp(1i*2*pi*(nx(i)-nx(j))*X).*exp(1i*2*pi*(ny(i)-ny(j))*Y);
        F = real(F).*area;
        element = trapz(y,trapz(x,F,2));
        h(i,j) = v*element;
    end
end
%surf(X,Y,real(F))
% Precomputing off-diagonal integrals


h = h + triu(h,1)';


%disp(h)
end