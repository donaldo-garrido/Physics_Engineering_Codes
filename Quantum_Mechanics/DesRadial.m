format long
N = 1000;
R = linspace(0,1,N);
FdR = 1-R.^2;
dR = R(2)-R(1);
figure(1)
plot(R,FdR)


for j = 1:N
    for i = 1:N
        SB(j,i) = sphbes(j-1,R(i));
    end
    SB(j,1) = 0;
end
SB(1,1) = 1;
figure(2)
plot(R,SB(1,:))

Caux = 0;
CR = zeros(N,1);
for j = 1:N
    for i = 1:N-1
        int = dR*(SB(j,i)*FdR(i)+SB(j,i+1)*FdR(i+1))/2;
        Caux = Caux+int;
    end
    CR(j,1) = Caux;
    Caux = 0;
end

%disp(CR)
unos = ones(1,N);

coefArmarR = CR*unos;

RadialFuncMat = coefArmarR.*SB;

for i = 1:N
    plotRadialMat(i) = sum(RadialFuncMat(:,i));
end
figure(3)
plot(R,plotRadialMat)
function js = sphbes(l, x)
% calcula los armónicos esféricos de Bessel jnu(x)
% x is a vector or it may be a matrix if nu is a scalar
% if nu is a row and x a column vector, the output js is a matrix
[nnu lnu] = size(l);
[nx lx] = size(x);
xm = repmat(x, 1, lnu);
js = sqrt(pi ./(2* xm)) .* besselj(l + 0.5, x);
end
