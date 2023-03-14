 %{

%     Simulacion de la evolucion temporal de la 
%     densidad de probabilidad |Q|^2 en el pozo
%     esferico
%     
%     **Este codigo necesita que los siguientes archivos se encuentren en
%     la misma dirección que este programa 
% 
%     ---> 'CoefNLM.mat' 
%     ---->'energias.mat' 
%     ----->'R12.mat'
%     (Estos datos fueron calculados por otros codigos que vienen 
%     en el mismo "paquete")
%}

clear all;
close all;


load('CoefNLM.mat'); % Coefientes de la expansion en 
load('energias.mat'); %  los eigenestados del pozo Cnml(l,m,n)
load('R12.mat');

N = 500;
t = linspace(-pi/2,pi/2,ceil(N/2));  
teth = linspace(0,pi,ceil(N/2));
p = linspace(0,2*pi,N);
[phi,theta] = meshgrid(p,t); %Mesh para los armonicos

nMax = 10;
lMax = 10;   %De acuerdo con los calculos realizados en programas anteriores
tMax = 8;    %Tiempo maximo

%Evolucion temporal de |Q|^2....
for t =  0 : tMax
    
    Qnew = 0;
    
    for l = 0 : lMax
        for m = -l : l
            Ylm = sphericalHComputation(l+1,m,theta,phi); 
            for n = 1 : nMax
                %Calculo del armonico esferico..                   
                Psilmn = R12(l+1,n)*Ylm;  %......
                Q = CoefNLM(l+1,(lMax + 1) + m ,n).*Psilmn.*exp(-1i*energias(l+1,n)*t); %......
                Qnew = Qnew + Q ;
            end
        end
    end
    
    % Graficando la densidad de probabilidad...
    Density = abs(Qnew).^2;
    plottinOnTheSphere(Density,theta,phi,1,t);
    figure(2)
    pcolor(phi,theta,Density);
    shading interp
    colorbar;
    title("$|Q|^2$ en t = "+num2str(t),'interpreter','latex') 
    hold on

end

% Graficando una funcion saobre la esfera...
function plottinOnTheSphere(g,theta,phi,fig,t)
        
    [x,y,z] = sph2cart(phi,theta,0.5);
    figure(fig)
    surf(x,y,z,g);     
    
    title("$|Q|^2$ en t = "+num2str(t),'interpreter','latex')    
    colormap('jet');
    colorbar;
    shading interp;
    daspect([1,1,1]);
    axis tight;
    hold on;

end



% Calculo de los armonicos esfericos
function Ylm =  sphericalHComputation(l,m,theta,phi)    
   
    a = (2*l + 1)* factorial(l - abs(m));
    b = 4*pi*factorial(l + abs(m));
    P = legendre(l,sin(theta)); 

    C = sqrt(a/b);
    
    % Se calculan los polinomios de Legendre para m < 0 o para m >= 0 ...
    if m < 0
         mt = -m;
         Plm = reshape(P(mt + 1,:,:), size(phi));
         Pl_m = (-1)^mt .*Plm;  % Relacion entre polinomios para m < 0 y m >= 0;
         Y = C.* Pl_m .* exp(1i*m*phi);
         
    elseif m == 0 && l ==0
        Y =  C.* P .* exp(1i*m*phi);        
    else
        Plm = reshape(P(m + 1,:,:), size(phi));
        Y =  C.* Plm .* exp(1i*m*phi); %(cos(m*phi) + 1*i* sin(m*phi));
    end
    
    Ylm = Y;
end
