function h = periodicwell2D( N, v, p1, p2 )
%OPENWELL2D 2D Finite well with open boundary conditions
%   N  = number of basis states in 1D (total matrix size is N+1 x N+1)
%   v  = depth of well, should be negative
%   p1 = start of the well in units of a
%   p2 = end   of the well in units of a
%   h  = dimensionless Hamiltonian
%N = 3; v = -1; p1 = 1; p2 = 2;
% Converts {1,2,3,4,...} -> {0,1,-1,2,-2,...}
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

% Populating diagonal matrix elements
p = p2 - p1;
h = diag(4*n2+v*p*p);


% Precomputing off-diagonal integrals
off = zeros(1,2*N+1);
for m = 1:2*N+1
    off(m) = 1./(2*pi*1i*(m-N-1)) * (-exp(1i*2*pi*(m-N-1)*p1) + exp(1i*2*pi*(m-N-1)*p2));
end

ipart = 0; jpart = 0;
% Populating off-diagonal elements
for i = 1:(N+1)*(N+1)
    for j = i+1:(N+1)*(N+1)     
        if nx(i) == nx(j)
            ipart = p;
        else
            ipart = off(nx(i)-nx(j) + N+1);
        end
        
        if ny(i) == ny(j)
            jpart = p;
        else
            jpart = off((ny(i)-ny(j)) + N+1);
        end                     
        
        h(i,j) = h(i,j) + v * ipart * jpart;
    end
end

format long
% Fill the diagonals, taking the conjugate transpose for the lower diag
h = h + triu(h,1)';

%disp(h)
end

