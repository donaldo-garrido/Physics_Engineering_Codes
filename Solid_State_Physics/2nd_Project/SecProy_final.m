close all

n = 100;

kxVal = linspace(0,2*pi/(sqrt(3)*a),n);
kyVal = linspace(0,4*pi/(3*a),n);

C = 0;

RelDispersion = zeros(length(kxVal),length(kyVal),6);

for ii = 1:length(kxVal)
    for jj = 1:length(kyVal)
        kVec = [kxVal(ii), kyVal(jj)];
        RelDispersion(ii,jj,:) = omegas(kVec);
    end
end

T = linspace(0,10,n);
h = 1;%6.63e-34;
kB = 1;%1.38e-23;

%Cálculo de la integral independizando la temperatura
for count=1:6

    Integrand = h.*RelDispersion(:,:,count).^2/(exp(h.*RelDispersion(:,:,count)/(kB))-1);
            
    alpha = pi/3;
    trig = tan(alpha);

    for ii = 1:n
       for jj = 1:n
          comparison =  max(kyVal)/2+(max(kxVal)-kxVal(ii))/trig;
          if kyVal(jj) > comparison
              Integrand(ii,jj) = 0;
          end
       end
    end
    Int1 = real(trapz(kxVal,trapz(kyVal,Integrand,2)));
    C = (C+Int1)/(1e19);
end
%C = C*10^(11);
disp(C)
%Gráfica de Cv
Cv = (h^2/kB).*(exp(h.*C./(kB.*T)).*C.^2)./((exp(h.*C./(kB*T))-1).^2.*T.^2);
figure(1)
plot(T,4*Cv/(2*pi)^2,'LineWidth',2,'Color','k')
xlabel('T - Temperatura en kelvin','FontSize',14,'FontWeight','bold','Color','k')
ylabel('C_v- Calor específico en aerg/K','FontSize',14,'FontWeight','bold','Color','k')

%==============Variación de direcciones, obtención gráfica=================
%De G a M
GaM_x = kxVal;
GaM_y = zeros(1,n);

GaM = zeros(6,n);
for ii = 1:n
   GaM(:,ii) = omegas([GaM_x(ii),GaM_y(ii)]); 
end
figure(2)
plot(GaM_x,real(GaM))


%De M a K
MaK_x = 2*pi/(sqrt(3)*a)*ones(1,n);
MaK_y = kyVal/0.68;

MaK = zeros(6,n);
for ii = 1:n
   MaK(:,ii) = omegas([MaK_x(ii),MaK_y(ii)]); 
end
figure(3)
plot(MaK_y,real(MaK))
lim = max(MaK_y);


%De K a G
KaG_x = flip(kxVal);
KaG_y = KaG_x/tan(pi/6);

hh = 1;

for ii = 1:n
    if sqrt(KaG_x(ii)^2+KaG_y(ii)^2)>max(KaG_x)
        KaG(:,hh) = omegas([KaG_x(ii),KaG_y(ii)]);
        hh=hh+1;
    end
end
figure(4)
plot(real(KaG(1,:)))



figure(5)
%Gráfica de las 6 relaciones de dispersión
for ii = 1:6
    DispRelPlotY = [real(GaM(ii,:)),real(MaK(ii,:))];
    plot(DispRelPlotY,'LineWidth',2)
    hold on
end
xlabel('k','FontSize',14,'FontWeight','bold','Color','k')
ylabel('\omega','FontSize',14,'FontWeight','bold','Color','k')

set(gca,'xticklabel',[])

function w = omegas(k)
a = 2.46;
a1 = a*[sqrt(3)/2, 1/2];    
a2 = a*[sqrt(3)/2,-1/2];
phi_r = 365;            
phi_ti = 245;       
phi_to = 98.2;

C1 = [phi_r, 0, 0;0, phi_ti, 0; 0, 0, phi_to];
C2 = (1/4)*[phi_r+3*phi_ti, sqrt(3)*(phi_ti-phi_r), 0; sqrt(3)*(phi_ti-phi_r), 3*phi_r+phi_ti, 0; 0, 0, 4*phi_to];
C3 = (1/4)*[phi_r+3*phi_ti, sqrt(3)*(phi_r-phi_ti), 0; sqrt(3)*(phi_r-phi_ti), 3*phi_r+phi_ti, 0; 0, 0, 4*phi_to];

D = [C1+C2+C3,  -exp(1i*dot(k,(a1+a2)/3))*(C1+C2*exp(-1i*dot(k,a2))+C3*exp(-1i*dot(k,a1))); ...
    -exp(-1i*dot(k,(a1+a2)/3))*(C1+C2*exp(1i*dot(k,a2))+C3*exp(1i*dot(k,a1))),   C1+C2+C3];
w = sqrt(real(eig(D)));
end

