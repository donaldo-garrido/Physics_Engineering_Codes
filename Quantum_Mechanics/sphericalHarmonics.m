%{

    Spherical Harmonics - Donaldo Garrido A01275416


%}


function sphericalHarmonics()

    clear all;
    close all;
    
    step = pi/60;
    t = 0 : step : pi;
    p = 0:step:2*pi;
    [theta,phi] = meshgrid(t,p);
    
    Y32 = sphericalHComputation(3,2,theta,phi);
    ploting(theta,phi,Y32);
    

end
%Graficar armonicos
function ploting(theta,phi,Ylm)
u = 60;
r = linspace(0,300,n1);
radial = sphbes(1, r);
k1 = 1;
for i=1:n1-1
    if radial(i)>0 && radial(i+1)<0
        Ser(k1) = r(i);
        k1 = k1+1;
    elseif radial(i)<0 && radial(i+1)>0
        Ser(k1) = r(i);
        k1 = k1+1;
    end
end
for i=1:u
myfun = @(x,nu) sqrt(pi ./(2* x)) .* besselj(nu + 0.5, x);  % parameterized function
nu = 1;                    % parameter
fun = @(x) myfun(x,nu);    % function of x alone
beta(i) = fzero(fun, Ser(i));
end
    [Xm,Ym,Zm] = sph2cart(phi, theta, real(Ylm));
    surf(Xm,Ym,Zm);
    title('$Y_3^2$ spherical harmonic','interpreter','latex');
end

% Calculo de los armonicos esfericos
function Ylm =  sphericalHComputation(l,m,theta,phi)    
   
    frac1 = (2*l + 1)/4*pi ;
    frac2 = factorial((l - abs(m)))./factorial(l + abs(m));
    P = legendre(l,cos(theta)); 
    
    % Se calculan los polinomios de Legendre para m < 0 o para m >= 0 ...
    if m < 0
         mt = -m;
         Plm = reshape(P(mt + 1,:,:), size(phi));
         Pl_m = (-1)^mt .* (factorial(l-mt)./factorial(l+mt)).*Plm;  % Relacion entre polinomios para m < 0 y m >= 0;
         Y = sqrt(frac1.*frac2).* Pl_m .* exp(1i*m*phi);
    else
        Plm = reshape(P(m + 1,:,:), size(phi));
        Y =  sqrt(frac1.*frac2).* Plm .* exp(1i*m*phi);
    end
    
    Ylm = Y
end
function js = sphbes(nu, x)
% returns the spherical Bessel functions jnu(x)
% x is a vector or it may be a matrix if nu is a scalar
% if nu is a row and x a column vector, the output js is a matrix
[nnu lnu] = size(nu);
[nx lx] = size(x);
xm = repmat(x, 1, lnu);
js = sqrt(pi ./(2* xm)) .* besselj(nu + 0.5, x);
end
