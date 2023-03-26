%{
    The three body problem 
    Ricardo Lopez R. A01066515

    
%------------------------------------------------------------
Solucion #1
r0 = [0.97000436 -0.24308753 0 ; -0.97000436 0.24308753 0 ; 0 0 0];
v0 = [0.93240737/2 0.86473146/2 0 ; 0.93240737/2 0.86473146/2 0 ; -0.93240737 -0.86473146 0];
m = [1 1 1];

% Experimento
r0 = [0 0 0 ; 15 0 0 ; 0 15 0];
v0 = [0 0 0; 0 0.5 0; -0.9 0 0];
m = [100 .001 .001];

%}

function TresCuerpos()

close all
% r0 = [0 1 0;0 -1 0;sqrt(3) 0 0];
% v0 = [-0.80*sind(60),-0.80*cosd(60),0;0.80*sind(60),-0.80*cosd(60),0;0,0.80,0 ];
% m = [1 1 1];

% r0 = [0.97000436 -0.24308753 0 ; -0.97000436 0.24308753 0 ; 0 0 0];
% v0 = [0.93240737/2 0.86473146/2 0 ; 0.93240737/2 0.86473146/2 0 ; -0.93240737 -0.86473146 0];
% m = [1 1 1];
%------------------------------------Condiciones iniciales ----------------------------------%
% r0 = [0 0 0 ; 15 0 0 ; 0 15 0];
% v0 = [0 0 0; 0 0.9 0; -0.9 0 0];
% m = [100 .001 .001]; 

% r0 = [0.6525 0 0 ; -0.5009 0 0 ; -1.2122 0 0];
% v0 = [0 -1.6412 0; 0 2.1361 0; 0 -3.9587 0];
% m = [8 8 1]; 

r0 = [-0.8 0 0 ; 0.8 0 0 ;0 0 -1];
v0 = [0 1 0; 0 -1 0; 0 0 0];
m = [3 3 .1]; 

%--------------------------------------------------------------------------------------------%

epsilon = 0.03;
sz = size(v0);
n = 3;   

%Componentes de aceleracion
a = aceleration(r0,m,sz,n);

% v(e/2)=v(0)+(e/2)a(0)

temporalVelocities = v0 + (epsilon/2).*a;    
v = temporalVelocities; %matriz de velocidad

% Se guarda la posicion inicial
positionsMass1(1,:) = r0(1,:);  % Para animacion
positionsMass2(1,:) = r0(2,:);
positionsMass3(1,:) = r0(3,:);


%------------------------ Método numérico -------------------------------%
for k = 2:2000  % <----------<----------<----------<----------<---------- Iteraciones

    newPos = r0 + epsilon.*v;

    positionsMass1(k,:) = r0(1,:); % Vectores para animacion 
    positionsMass2(k,:) = r0(2,:);
    positionsMass3(k,:) = r0(3,:);


    r0 = newPos;
    a = aceleration(newPos,m,sz,n);

    vNew = v + epsilon.*a;
    v = vNew;
    pause(.001);


end
%disp("NewPos");
%disp(newPos);

%------------------------------ Animación --------------------------------------%
x1 = positionsMass1(:,1);
y1 = positionsMass1(:,2);
z1 = positionsMass1(:,3);

x2 = positionsMass2(:,1);
y2 = positionsMass2(:,2);
z2 = positionsMass2(:,3);

x3 = positionsMass3(:,1);
y3 = positionsMass3(:,2);
z3 = positionsMass3(:,3);

curve1 = animatedline('LineWidth',2,'Color','r');
curve2 = animatedline('LineWidth',2,'Color','b');
curve3 = animatedline('LineWidth',2,'Color','g');

%set(gca,'XLim',[-xmax xmax], 'YLim',[-ymax ymax], 'ZLim', [-zmax zmax]);
xlabel('x'); ylabel('y'); zlabel('z'); grid on; hold on
view(3)

for i = 1: 3 :length(x1) % <------------------------Cambiar número interior para varias velocidad

    addpoints(curve1, x1(i), y1(i), z1(i)) % Para trazar líneas
    addpoints(curve2, x2(i), y2(i), z2(i))       
    addpoints(curve3, x3(i), y3(i), z3(i))

    cuerpo1 = scatter3(x1(i), y1(i), z1(i),80,'Filled','MarkerFaceColor','r'); % Cuerpo
    cuerpo2 = scatter3(x2(i), y2(i), z2(i),80,'Filled','MarkerFaceColor','b');
    cuerpo3 = scatter3(x3(i), y3(i), z3(i),80,'Filled','MarkerFaceColor','g');

    drawnow
    %pause(0.005)
    delete(cuerpo1)
    delete(cuerpo2)
    delete(cuerpo3)

end

scatter3(x1(length(x1)), y1(length(x1)), z1(length(x1)),80,'Filled','MarkerFaceColor','r'); %Cuerpo1
scatter3(x2(length(x1)), y2(length(x1)), z2(length(x1)),80,'Filled','MarkerFaceColor','b'); %Cuerpo2
scatter3(x3(length(x1)), y3(length(x1)), z3(length(x1)),80,'Filled','MarkerFaceColor','g'); %Cuerpo3

end


%------------------------------ Función aceleración -------------------------------------------%
function [aT] = aceleration(r_0,m,sz,n)
%     
%     G = 6.674*10^-11 ;   

G =1;
a = zeros(sz(1),sz(2));

for i = 1: n 
    aActx = 0;
    aActy = 0;
    aActz = 0;

    for j = 1:n
        if i~=j
          r = sqrt((r_0(i,1)-r_0(j,1))^2 +  (r_0(i,2)-r_0(j,2))^2 + (r_0(i,3)-r_0(j,3))^2 );
          a(i,1) = aActx + (-G*m(j)*(r_0(i,1)-r_0(j,1)))/(r^3);
          a(i,2) = aActy + (-G*m(j)*(r_0(i,2)-r_0(j,2)))/(r^3);
          a(i,3) = aActz + (-G*m(j)*(r_0(i,3)-r_0(j,3)))/(r^3);
          aActx = a(i,1);
          aActy = a(i,2);
          aActz = a(i,3);
        end
    end        
end
%disp("Aceleracion");
%disp(a);
aT = a;
end