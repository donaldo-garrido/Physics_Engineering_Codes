%configuracion grafica
LW = 'linewidth'; lw = 1; FS = 'FontSize'; fs = 12;
FC = 'FaceColor'; fc = [0.93 0.93 0.93]; EC = 'EdgeColor'; ec = 'none';
vw = [70 25];
%CONFIGURACION INICIAL
N=1024;%tamaÃ±o de linspace
th = linspace(0,pi,N);    % inclination
phi = linspace(0,2*pi,N); % azimuth
%GRAFICA DE LA FUNCION A REPRODUCIR
[T,P]=meshgrid(th,phi);
gp=exp(-cos(P+2*T)).*(T.*(pi*ones(size(T))-T));

%  C=zeros(N+1,2*N+1); %VECTOR DE COEFICIENTES
 %CONTADORES
i=1;
g=0;
l=0;
%ERROR ABSOLUTO
err=1;
while err>0.01
% for k=1:5
    j=1;
    for m=-l:l
        Y=harmonicY(l,m,T,P);
        F=gp.*conj(Y).*sin(T);
        C(i,j)=sum(F(:))*(pi/N)*(2*pi/N);
%         disp(C(i,j))
        if abs(real((C(i,j))))>0.001 || abs(imag(C(i,j)))>0.001
        g1=C(i,j)*Y;
        g=g+g1;
        end
        j=j+1;
    end
     err=immse(g,gp);
     disp(err)
     l=l+1;
     i=i+1;
end
%PRUEBA
%GRAFICO DE FUNCION ORIGINAL
figure(1)
[X,Y,Z]=sph2cart(T,P,1);
%[gp2,thp,ph]=meshgrid(gp,th,phi);
%0surf(X,Y,Z,gp)
title('FunciÃ³n g(\theta,\phi)')
colorbar; shading interp; daspect([1 1 1]); axis tight;
saveas(figure(1),'fig1.png')
%GRAFICA DE FUNCION CON ARMONICOS ESFERICOS
figure(2)
[X2,Y2,Z2]=sph2cart(T,P,1);
%surf(X2,Y2,Z2,real(g));
title('FunciÃ³n g(\theta,\phi)a partir de Y_{lm}')
colorbar; shading interp; daspect([1 1 1]); axis tight;
saveas(figure(2),'fig2.png')
disp(err)
% %VALORES DE LOS ARMONICOS ESFERICOS MÃ?S OCUPADO
[M,N]=size(C);
ne=round(N/2+0.1);
D=zeros(M,N);
for k=1:M
    j2=1+2*(k-1);
    j3=ne;
    for j=1:j2
    D(k,j3)=C(k,j);
    j3=j3+1;
    end
    ne=ne-1;
end
xv={'-8','-7','-6','-5','-4','-3','-2','-1','0','1','2','3','4','5','6','7','8'};
yv={'0','1','2','3','4','5','6','7','8'};
figure(3)
h=heatmap(xv,yv,abs(C),'Colormap',parula)
h.Title = 'Magnitud de Coeficientes Y_{lm}';
h.XLabel = 'valor de m';
h.YLabel = 'valor de l';
saveas(figure(3),'fig3.png')
% 
% L1 = linspace(0,1023,1024);
% R1 = linspace(0,1,1024);
% FR = zeros(1024);
% for i = 1:1024
%     for j = 1:1024
%         FR(i,j) = sphbes(i-1, 1-R1(j)^2);
%     end
% end
% Ftot = FR*g;

function js = sphbes(l, x)
% calcula los armónicos esféricos de Bessel jnu(x)
% x is a vector or it may be a matrix if nu is a scalar
% if nu is a row and x a column vector, the output js is a matrix
[nnu lnu] = size(l);
[nx lx] = size(x);
xm = repmat(x, 1, lnu);
js = sqrt(pi ./(2* xm)) .* besselj(l + 0.5, x);
end
