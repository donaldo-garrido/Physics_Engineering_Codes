
format compact
%%  Read or Input any square Matrix
A = [[3, -0.1, -0.2]; [0.1, 7, -0.3]; [0.3, -0.2, 10]];% coefficients matrix
C = [7.85,-19.3,71.4]';% constants vector
n = length(C);
X = zeros(n,1);
Error_eval = ones(n,1);
%% Check if the matrix A is diagonally dominant
for i = 1:n
    j = 1:n;
    j(i) = [];
    B = abs(A(i,j));
    Check(i) = abs(A(i,i)) - sum(B); % Is the diagonal value greater than the remaining row values combined?
    if Check(i) < 0
        fprintf('The matrix is not strictly diagonally dominant at row %2i\n\n',i)
    end
end
%% Start the Iterative method
iteration = 0;
while max(Error_eval) > 0.0000000001
    iteration = iteration + 1;
    Z = X;  % save current values to calculate error later
    for i = 1:n
        j = 1:n; % define an array of the coefficients' elements
        j(i) = [];  % eliminate the unknow's coefficient from the remaining coefficients
        Xtemp = X;  % copy the unknows to a new variable
        Xtemp(i) = [];  % eliminate the unknown under question from the set of values
        X(i) = (C(i) - sum(A(i,j) * Xtemp)) / A(i,i);
    end
    Xsolution(:,iteration) = X;
    Error_eval = sqrt((X - Z).^2);
end
%% Display Results
GaussSeidelTable = [1:iteration;Xsolution]'
MaTrIx = [A X C]