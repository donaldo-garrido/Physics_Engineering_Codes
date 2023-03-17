clear all; close all;
set(0,'defaultTextInterpreter','latex');
 
N = 100;                % Numero de puntos, escogemos una potencia de 2
                        % para que el calculo de la transformada sea m�s
                        % r�pido
 
% Creamos el vector de indices
NV = (-5*N/2:1:5*N/2-1);     % Con esto nos aseguramos de tener la frecuencia 0
                         % y de que NV tiene N elementos
L = 1e-3;                % Las unidades son metros
dx = 2*L/N;
kmax = pi/dx;
[X,Y] = meshgrid(NV*dx);
[Kx,Ky] = meshgrid(kmax*2/N*NV);
 
lambda = 633e-9;
k = 2*pi/lambda;
i=sqrt(-1);
r = (X.^2+Y.^2);
kt = sqrt(Kx.^2+Ky.^2);
 
w0 = 0.2e-3;                            % Cintura del haz Gaussiano
zR = k*w0^2/2;
z = 1.5*zR;      %Distancia de propagaci�n maxima en unidades de la distancia de Rayleigh
 
nz = 300;
dz = z/nz;
A=1;
B=ones(length(NV))*linspace(0,length(NV),N);
D=1;
 
U2=(1./(sqrt(1./w0.^2-i.*k.*A./(2.*B)).*i.*2.*pi.*B)).*(k.*sqrt(pi).*exp(i.*k.*z)).*exp(-r.*(k.^2./(4.*B.^2.*(1./w0.^2-i.*k.*A./(2.*B)))-i.*k.*D./(2.*B)));
surface(X,Y,abs(U2));
 
shading interp
