% Integral de la forma Int_-infty^infty(f(x)*e^(-x^2))dx
% Función a integrar:
f = @(x) x.^2;

%--------------- 1. DETERMINACIÓN DE LOS PESOS Y ABCISAS ----------------

n = 10;% Número de puntos a utilizar en las abcisas
s = 1:n-1;
a   = sqrt(s/2); %Factor de los polinomios de Hermite
CM  = diag(a,1) + diag(a,-1);
[V L] = eig(CM); %V es la matriz de eigenvectores, L es la matriz diagonal de eigenvalores
[x ind] = sort(diag(L)); %Recuperación de los eigenvectores al vector x, los ínices están en ind
V = V(:,ind)'; %Transponer V
w = sqrt(pi) * V(:,1).^2; %Terminado de los pesos

%----- 2. SUMATORIA DE LOS PRODUCTOS PESO-ABCISA PARA DETERMINAR INTEGRAL -----
int = 0;
for i=1:1:n
    save = f(x(i))*w(i); % Multiplicación de cada abcisa por su peso
    inexit = int + save; % Acumulación de la sumatoria de productos
end

fprintf('El resultado de la integral es %f \n', int)

t = linspace(-10,10,1000);
y = f(t).*exp(-t.^2);
plot(t,y); %Sección de la gráfica de la función a integrar
title ('\int_{-\infty}^\infty e^{-x^2} (x^2) dx');
xlabel('x'); ylabel ('y');