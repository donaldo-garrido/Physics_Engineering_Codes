close all

n = 100; % Número de puntos para integrar y para definir espacios

%Definición de zona para integrar y tomar kx y ky
kxVal = linspace(0,2*pi/(sqrt(3)*a),n);
kyVal = linspace(0,4*pi/(3*a),n);

RelDispersion = zeros(length(kxVal),length(kyVal),6);

%Cálculo de los eigenvalores para cada combinación de kx y ky
%Según los limites de integración que se usarán
for ii = 1:length(kxVal)
    for jj = 1:length(kyVal)
        kVec = [kxVal(ii), kyVal(jj)];
        RelDispersion(ii,jj,:) = omegas(kVec);
    end
end

T = linspace(0,500,n); %Vector de la temperatura
h = 1.05457e-34; %Constante de Planck
kB = 1.380649e-23; %Constante de Boltzmman

Cv = zeros(1,n); %Inicialización de Cv

for count=1:6 %Ciclo sobre cada una de las relaciones de dispersión
    Integrand = zeros(n,n,n); %Inicialización: matriz del integrando
    
    %Cálculo de los integrandos a través de una matriz 3D
    %Cada valor de T, tiene un arreglo de (kx,ky)
    for kk=1:n
        if kk ~= 1
            Integrand(:,:,kk) = (h^2/kB)*(exp(h.*RelDispersion(:,:,count)/(kB*T(kk))).*RelDispersion(:,:,count).^2)/...
                ((exp(h.*RelDispersion(:,:,count)/(kB*T(kk)))-1).^2*T(kk).^2); 
        else 
            Integrand(:,:,kk) = zeros(n);
        end
    end
    prueba = Integrand(:,:,50); %Monitoreo
    
    %Parámetros para delimitación de la integración
    alpha = pi/3;
    trig = tan(alpha);
    %Conversión del rectángulo de integración al trapecio
    for aa = 1:n
        for ii = 1:n
           for jj = 1:n
              comparison =  max(kyVal)/2+(max(kxVal)-kxVal(ii))/trig;
              if kyVal(jj) > comparison
                  Integrand(ii,jj,aa) = 0;
              end
           end
        end
    end
    recorte = Integrand(:,:,50); %Monitoreo de correcta acotación

    %Proceso de integración con técnica de trapecio
    Int1 = zeros(1,n); 
    for nn = 1:n
        Int1(nn) = trapz(kxVal,trapz(kyVal,Integrand(:,:,nn),2))*10^5;
        disp(Int1(nn))
    end
    %Sumatoria del resultado de cada relación de dispersión
    Cv = Cv+Int1;
end

%Gráfica de Cv en función de la Temperatura
plot(T,4*Cv/(2*pi)^2)


function w = omegas(k)
M = 1.9945e-23; %Masa del carobono [KG]
a = 2.46e-10; %Distancia entre primeros vecinos
a1 = a*[sqrt(3)/2, 1/2];    
a2 = a*[sqrt(3)/2,-1/2];

%Constantes de fuerza
phi_r = 36.5;            
phi_ti = 24.5;       
phi_to = 9.82;

%Vectores constantes
C1 = [phi_r, 0, 0;0, phi_ti, 0; 0, 0, phi_to]; %Matr
C2 = (1/4)*[phi_r+3*phi_ti, sqrt(3)*(phi_ti-phi_r), 0; sqrt(3)*(phi_ti-phi_r), 3*phi_r+phi_ti, 0; 0, 0, 4*phi_to];
C3 = (1/4)*[phi_r+3*phi_ti, sqrt(3)*(phi_r-phi_ti), 0; sqrt(3)*(phi_r-phi_ti), 3*phi_r+phi_ti, 0; 0, 0, 4*phi_to];

%Definición de la matriz dinámica
D = [C1+C2+C3,  -exp(1i*dot(k,(a1+a2)/3))*(C1+C2*exp(-1i*dot(k,a2))+C3*exp(-1i*dot(k,a1))); ...
    -exp(-1i*dot(k,(a1+a2)/3))*(C1+C2*exp(1i*dot(k,a2))+C3*exp(1i*dot(k,a1))),   C1+C2+C3];

%Cálculo de eigenvalores
w = sqrt(real(eig(D)));
end