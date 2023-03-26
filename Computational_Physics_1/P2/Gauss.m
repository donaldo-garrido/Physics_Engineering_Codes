f = @(t) t.^2+t; %funcion
limInf = -3;
limSup = 1;
n = 6; % numero de 
% Genera las abscisas y pesos para la  Cuadratura Gauss-Legendre.
x = zeros(n,1);                                            
w = x;
m = (n+1)/2;
for ii=1:m
    z = cos(pi*(ii-.25)/(n+.5)); % estimado Inicial.
    z1 = z+1;
while abs(z-z1)>eps
    p1 = 1;
    p2 = 0;
    for jj = 1:n
        p3 = p2;
        p2 = p1;
        p1 = ((2*jj-1)*z*p2-(jj-1)*p3)/jj; % El polinomial. Legendre 
    end
    pp = n*(z*p1-p2)/(z^2-1); % La L.P. Derivada.
    z1 = z;
    z = z1-p1/pp;
end
    x(ii) = -z; % Construye las abscissas.
    x(n+1-ii) = z;
    w(ii) = 2/((1-z^2)*(pp^2));% Construye  los pesos.
    w(n+1-ii) = w(ii);
end
%Evaluamos para límites dispuestos
evaluacion = (limSup-limInf)/2*f((limSup-limInf)/2*x+(limSup+limInf)/2);
int = sum (evaluacion.*w);
fprintf('El resultado de la integral es %f \n', int);