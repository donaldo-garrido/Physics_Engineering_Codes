T = 2*pi; %Periodo
n = 1000;
t = linspace(0,T,n);
% -------- FUNCIÓN --------------------
% En este caso, la función está a trozos, presentamos 2
f1 = @(t) t/(T/2);
f2 = @(t) (t-T)/(T/2);
for i = 1:1:n/2
    y1(i) = f1(t(i))*cos
end