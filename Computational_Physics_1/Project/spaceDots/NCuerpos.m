%{
    LOS 10 CUERPOS 
  

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

function NCuerpos()

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

% r0 = [-0.8 0 0 ; 0.8 0 0 ;0 0 -1];
% v0 = [0 1 0; 0 -1 0; 0 0 0];
% m = [3 3 .1]; 

r0 = [-0.8 0 0 ; 0.8 0 0 ;0 0 -1; 1 2 3; -2 -1 -3; -1 -2 -3; -5 -2 3;3 4 5; 5 2 3; 3 4 5];
v0 = [0 0 0; 0 -1 0; 0 1 0;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0; 0 1 0];
m = [2 .1 .2 .3 .4 .5 .6 .7 .3 0]; 

%--------------------------------------------------------------------------------------------%

epsilon = 0.03;
sz = size(v0);
n = 5;   

%Componentes de aceleracion
a = aceleration(r0,m,sz,n);

% v(e/2)=v(0)+(e/2)a(0)

temporalVelocities = v0 + (epsilon/2).*a;    
v = temporalVelocities; %matriz de velocidad

% Se guarda la posicion inicial
positionsMass1(1,:) = r0(1,:);  % Para animacion
positionsMass2(1,:) = r0(2,:);
positionsMass3(1,:) = r0(3,:);
positionsMass4(1,:) = r0(4,:);
positionsMass5(1,:) = r0(5,:);
positionsMass6(1,:) = r0(6,:);
positionsMass7(1,:) = r0(7,:);
positionsMass8(1,:) = r0(8,:);
positionsMass9(1,:) = r0(9,:);
positionsMass10(1,:) = r0(10,:);



%------------------------ Método numérico -------------------------------%
for k = 2:2000  % <----------<----------<----------<----------<---------- Iteraciones

    newPos = r0 + epsilon.*v;

    positionsMass1(k,:) = r0(1,:); % Vectores para animacion 
    positionsMass2(k,:) = r0(2,:);
    positionsMass3(k,:) = r0(3,:);
    positionsMass4(k,:) = r0(4,:);
    positionsMass5(k,:) = r0(5,:);
    positionsMass6(k,:) = r0(6,:);
    positionsMass7(k,:) = r0(7,:);
    positionsMass8(k,:) = r0(8,:);
    positionsMass9(k,:) = r0(9,:);
    positionsMass10(k,:) = r0(10,:);


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

x4 = positionsMass4(:,1);
y4 = positionsMass4(:,2);
z4 = positionsMass4(:,3);

x5 = positionsMass5(:,1);
y5 = positionsMass5(:,2);
z5 = positionsMass5(:,3);

x6 = positionsMass6(:,1);
y6 = positionsMass6(:,2);
z6 = positionsMass6(:,3);

x7 = positionsMass7(:,1);
y7 = positionsMass7(:,2);
z7 = positionsMass7(:,3);

x8 = positionsMass8(:,1);
y8 = positionsMass8(:,2);
z8 = positionsMass8(:,3);

x9 = positionsMass9(:,1);
y9 = positionsMass9(:,2);
z9 = positionsMass9(:,3);

x10 = positionsMass10(:,1);
y10 = positionsMass10(:,2);
z10 = positionsMass10(:,3);

curve1 = animatedline('LineWidth',2,'Color','r');
curve2 = animatedline('LineWidth',2,'Color','b');
curve3 = animatedline('LineWidth',2,'Color','g');
curve4 = animatedline('LineWidth',2,'Color','y');
curve5 = animatedline('LineWidth',2,'Color','m');
curve6 = animatedline('LineWidth',2,'Color','c');
curve7 = animatedline('LineWidth',2,'Color','k');
curve8 = animatedline('LineWidth',2,'Color','k');
curve9 = animatedline('LineWidth',2,'Color','r');
curve10 = animatedline('LineWidth',2,'Color','g');


%set(gca,'XLim',[-xmax xmax], 'YLim',[-ymax ymax], 'ZLim', [-zmax zmax]);
xlabel('x'); ylabel('y'); zlabel('z'); grid on; hold on
view(3)

for i = 1: 3 :length(x1) % <------------------------Cambiar número interior para varias velocidad

    addpoints(curve1, x1(i), y1(i), z1(i)) % Para trazar líneas
    addpoints(curve2, x2(i), y2(i), z2(i))       
    addpoints(curve3, x3(i), y3(i), z3(i))
    addpoints(curve4, x4(i), y4(i), z4(i))
    addpoints(curve5, x5(i), y5(i), z5(i))
    addpoints(curve6, x6(i), y6(i), z6(i))
    addpoints(curve7, x7(i), y7(i), z7(i))
    addpoints(curve8, x8(i), y8(i), z8(i))
    addpoints(curve9, x9(i), y9(i), z9(i))
    addpoints(curve10, x10(i), y10(i), z10(i))

    cuerpo1 = scatter3(x1(i), y1(i), z1(i),80,'Filled','MarkerFaceColor','r'); % Cuerpo
    cuerpo2 = scatter3(x2(i), y2(i), z2(i),80,'Filled','MarkerFaceColor','b');
    cuerpo3 = scatter3(x3(i), y3(i), z3(i),80,'Filled','MarkerFaceColor','g');
    cuerpo4 = scatter3(x4(i), y4(i), z4(i),80,'Filled','MarkerFaceColor','y');
    cuerpo5 = scatter3(x5(i), y5(i), z5(i),80,'Filled','MarkerFaceColor','m');
    cuerpo6 = scatter3(x6(i), y6(i), z6(i),80,'Filled','MarkerFaceColor','c');
    cuerpo7 = scatter3(x7(i), y7(i), z7(i),80,'Filled','MarkerFaceColor','k');
    cuerpo8 = scatter3(x8(i), y8(i), z8(i),80,'Filled','MarkerFaceColor','k');
    cuerpo9 = scatter3(x9(i), y9(i), z9(i),80,'Filled','MarkerFaceColor','r');
    cuerpo10 = scatter3(x10(i), y10(i), z10(i),80,'Filled','MarkerFaceColor','g');

    drawnow
    %pause(0.005)
    delete(cuerpo1)
    delete(cuerpo2)
    delete(cuerpo3)
    delete(cuerpo4)
    delete(cuerpo5)
    delete(cuerpo6)
    delete(cuerpo7)
    delete(cuerpo8)
    delete(cuerpo9)
    delete(cuerpo10)
  



end

scatter3(x1(length(x1)), y1(length(x1)), z1(length(x1)),80,'Filled','MarkerFaceColor','r'); %Cuerpo1
scatter3(x2(length(x1)), y2(length(x1)), z2(length(x1)),80,'Filled','MarkerFaceColor','b'); %Cuerpo2
scatter3(x3(length(x1)), y3(length(x1)), z3(length(x1)),80,'Filled','MarkerFaceColor','g'); %Cuerpo3

scatter3(x4(length(x1)), y4(length(x1)), z4(length(x1)),80,'Filled','MarkerFaceColor','y'); %Cuerpo1
scatter3(x5(length(x1)), y5(length(x1)), z5(length(x1)),80,'Filled','MarkerFaceColor','m'); %Cuerpo2
scatter3(x6(length(x1)), y6(length(x1)), z6(length(x1)),80,'Filled','MarkerFaceColor','c'); %Cuerpo3

scatter3(x7(length(x1)), y7(length(x1)), z7(length(x1)),80,'Filled','MarkerFaceColor','w'); %Cuerpo1
scatter3(x8(length(x1)), y8(length(x1)), z8(length(x1)),80,'Filled','MarkerFaceColor','k'); %Cuerpo2
scatter3(x9(length(x1)), y9(length(x1)), z9(length(x1)),80,'Filled','MarkerFaceColor','r'); %Cuerpo3

scatter3(x10(length(x1)), y10(length(x1)), z10(length(x1)),80,'Filled','MarkerFaceColor','g'); %Cuerpo1


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