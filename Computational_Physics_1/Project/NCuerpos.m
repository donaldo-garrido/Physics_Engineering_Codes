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

%Para la ESTABILIDAD DE EULER
CON 720 loops
r0 = [-1 0 0 ; 0 0 0 ;1 0 0; 1 2 3; -2 -1 -3; -1 -2 -3; -5 -2 3;3 4 5; 5 2 3; 3 4 5];
v0 = [0.1 .5 0.1; 0.1 0 0.1; 0.1 -.5 0.1;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0; 0 1 0];
m = [.2 .4 .2 .3 .4 .5 .6 .7 .3 0];

Para la ESTABILIDAD de LAGRANGE
CON 2400 loops
r0 = [-1 0 0 ; 1 0 0 ;0 sqrt(3) 0; 1 2 3; -2 -1 -3; -1 -2 -3; -5 -2 3;3 4 5; 5 2 3; 3 4 5];
v0 = [-0.1*sqrt(3)/2 0.1*1/2 0.2; 0 -0.1 0.2; 0.1*sqrt(3)/2 0.1*1/2 0.2;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0; 0 1 0];
m = [.2 .2 .2 .3 .4 .5 .6 .7 .3 0]; 
%}
 

function NCuerpos()

close all
n = input("Ingresa el numero de cuerpos N = ");

if n == 3
    fprintf('Para n=3, tenemos tres casos: \n 1)Caso General \n 2)Estabilidad de Euler \n 3)Estabilidad de Lagrange \n')
    caso = input("Ingresa el numero del caso deseado = ");
if caso==1    
    r0 = [-.7 0 0.9 ; 0.3 0.5 0 ;1 0 0; 1 2 3; -2 -1 -3; -1 -2 -3; -5 -2 3;3 4 5; 5 2 3; 3 4 5];
    v0 = [-0.1 0 -0.19; 0.8 0 0; 0 0 0.21;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0; 0 1 0];
    m = [.7 .4 .3 .3 .4 .5 .6 .7 .3 0];
    time = 1500;
    
elseif caso==2 %Estabilidad de Euler
    r0 = [-1 0 0 ; 0 0 0 ;1 0 0; 1 2 3; -2 -1 -3; -1 -2 -3; -5 -2 3;3 4 5; 5 2 3; 3 4 5];
    v0 = [0.1 .5 0.1; 0.1 0 0.1; 0.1 -.5 0.1;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0; 0 1 0];
    m = [.2 .4 .2 .3 .4 .5 .6 .7 .3 0];
    time = 720;
    
else caso==3 %Estabilidad de Lagrange
    r0 = [-1 0 0 ; 1 0 0 ;0 sqrt(3) 0; 1 2 3; -2 -1 -3; -1 -2 -3; -5 -2 3;3 4 5; 5 2 3; 3 4 5];
    v0 = [-0.1*sqrt(3)/2 0.1*1/2 0.2; 0 -0.1 0.2; 0.1*sqrt(3)/2 0.1*1/2 0.2;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0; 0 1 0];
    m = [.2 .2 .2 .3 .4 .5 .6 .7 .3 0]; 

    time = 2400;
end

else 
    r0 = [-.7 0 0.9 ; 0.3 0.5 0 ;1 0 0; 1 2 3; -2 -1 -3; -1 -2 -3; -5 -2 3;3 4 5; 5 2 3; 3 4 5];
    v0 = [-0.1 0 -0.19; 0.8 0 0; 0 0 0.21;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0;0 -.1 0; 0 1 0; 0 1 0];
    m = [.7 .4 .3 .3 .4 .5 .6 .7 .3 0];
    time = 1500;
end


%--------------------------------------------------------------------------------------------%

epsilon = 0.03;
sz = size(v0);


if n<11
%Componentes de aceleracion
a = aceleration(r0,m,sz,n);

% v(e/2)=v(0)+(e/2)a(0)

temporalVelocities = v0 + (epsilon/2).*a;    
v = temporalVelocities; %matriz de velocidad

% Se guarda la posicion inicial
if n >= 1
positionsMass1(1,:) = r0(1,:); 
end
if n >= 2
positionsMass2(1,:) = r0(2,:);
end
if n >= 3
positionsMass3(1,:) = r0(3,:);
end
if n >= 4
positionsMass4(1,:) = r0(4,:);
end
if n >= 5 
positionsMass5(1,:) = r0(5,:);
end
if n >= 6
positionsMass6(1,:) = r0(6,:);
end
if n >= 7 
positionsMass7(1,:) = r0(7,:);
end
if n >= 8
positionsMass8(1,:) = r0(8,:);
end
if n >= 9
positionsMass9(1,:) = r0(9,:);
end
if n >= 10
positionsMass10(1,:) = r0(10,:);
end



%------------------------ Método numérico -------------------------------%
for k = 2:time  % <----------<----------<----------<----------<---------- Iteraciones

    newPos = r0 + epsilon.*v;

    if n >= 1
    positionsMass1(k,:) = r0(1,:); 
    end
    if n >= 2
    positionsMass2(k,:) = r0(2,:);
    end
    if n >= 3
    positionsMass3(k,:) = r0(3,:);
    end
    if n >= 4
    positionsMass4(k,:) = r0(4,:);
    end
    if n >= 5 
    positionsMass5(k,:) = r0(5,:);
    end
    if n >= 6
    positionsMass6(k,:) = r0(6,:);
    end
    if n >= 7 
    positionsMass7(k,:) = r0(7,:);
    end
    if n >= 8
    positionsMass8(k,:) = r0(8,:);
    end
    if n >= 9
    positionsMass9(k,:) = r0(9,:);
    end
    if n >= 10
    positionsMass10(k,:) = r0(10,:);
    end


    r0 = newPos;
    a = aceleration(newPos,m,sz,n);

    vNew = v + epsilon.*a;
    v = vNew;
    pause(.001);


end
%disp("NewPos");
%disp(newPos);

%------------------------------ Animación --------------------------------------%
if n >= 1
    x1 = positionsMass1(:,1);
    y1 = positionsMass1(:,2);
    z1 = positionsMass1(:,3);
    curve1 = animatedline('LineWidth',2,'Color','r');
end

if n >= 2
    x2 = positionsMass2(:,1);
    y2 = positionsMass2(:,2);
    z2 = positionsMass2(:,3);
    curve2 = animatedline('LineWidth',2,'Color','b');
end

if n >=3
    x3 = positionsMass3(:,1);
    y3 = positionsMass3(:,2);
    z3 = positionsMass3(:,3);
    curve3 = animatedline('LineWidth',2,'Color','g');
end

if n >= 4
    x4 = positionsMass4(:,1);
    y4 = positionsMass4(:,2);
    z4 = positionsMass4(:,3);
    curve4 = animatedline('LineWidth',2,'Color','y');
end

if n >= 5
    x5 = positionsMass5(:,1);
    y5 = positionsMass5(:,2);
    z5 = positionsMass5(:,3);
    curve5 = animatedline('LineWidth',2,'Color','m');
end

if n >= 6
    x6 = positionsMass6(:,1);
    y6 = positionsMass6(:,2);
    z6 = positionsMass6(:,3);
    curve6 = animatedline('LineWidth',2,'Color','c');
end

if n >= 7
    x7 = positionsMass7(:,1);
    y7 = positionsMass7(:,2);
    z7 = positionsMass7(:,3);
    curve7 = animatedline('LineWidth',2,'Color','k');
end

if n >= 8
    x8 = positionsMass8(:,1);
    y8 = positionsMass8(:,2);
    z8 = positionsMass8(:,3);
    curve8 = animatedline('LineWidth',2,'Color','k');
end

if n >= 9
    x9 = positionsMass9(:,1);
    y9 = positionsMass9(:,2);
    z9 = positionsMass9(:,3);
    curve9 = animatedline('LineWidth',2,'Color','r');
end

if n >= 10
    x10 = positionsMass10(:,1);
    y10 = positionsMass10(:,2);
    z10 = positionsMass10(:,3);
    curve10 = animatedline('LineWidth',2,'Color','g');
end

%set(gca,'XLim',[-xmax xmax], 'YLim',[-ymax ymax], 'ZLim', [-zmax zmax]);
xlabel('x'); ylabel('y'); zlabel('z'); grid on; hold on
view(3)

for i = 1: 3 :length(x1) % <------------------------Cambiar número interior para varias velocidad

    if n >= 1
        addpoints(curve1, x1(i), y1(i), z1(i)) % Para trazar líneas
        cuerpo1 = scatter3(x1(i), y1(i), z1(i),80,'Filled','MarkerFaceColor','r'); % Cuerpo
    end
    if n >= 2
        addpoints(curve2, x2(i), y2(i), z2(i)) 
        cuerpo2 = scatter3(x2(i), y2(i), z2(i),80,'Filled','MarkerFaceColor','b');
    end
    if n >= 3
        addpoints(curve3, x3(i), y3(i), z3(i))
        cuerpo3 = scatter3(x3(i), y3(i), z3(i),80,'Filled','MarkerFaceColor','g');
    end
    if n >= 4
        addpoints(curve4, x4(i), y4(i), z4(i))
        cuerpo4 = scatter3(x4(i), y4(i), z4(i),80,'Filled','MarkerFaceColor','y');
    end
    if n >= 5
        addpoints(curve5, x5(i), y5(i), z5(i))
        cuerpo5 = scatter3(x5(i), y5(i), z5(i),80,'Filled','MarkerFaceColor','m');
    end
    if n >= 6
        addpoints(curve6, x6(i), y6(i), z6(i))
        cuerpo6 = scatter3(x6(i), y6(i), z6(i),80,'Filled','MarkerFaceColor','c');
    end
    if n >= 7
        addpoints(curve7, x7(i), y7(i), z7(i))
        cuerpo7 = scatter3(x7(i), y7(i), z7(i),80,'Filled','MarkerFaceColor','k');
    end
    if n >= 8
        addpoints(curve8, x8(i), y8(i), z8(i))
        cuerpo8 = scatter3(x8(i), y8(i), z8(i),80,'Filled','MarkerFaceColor','k');
    end    
    if n >= 9
        addpoints(curve9, x9(i), y9(i), z9(i))
        cuerpo9 = scatter3(x9(i), y9(i), z9(i),80,'Filled','MarkerFaceColor','r');
    end
    if n >= 10
        addpoints(curve10, x10(i), y10(i), z10(i))
        cuerpo10 = scatter3(x10(i), y10(i), z10(i),80,'Filled','MarkerFaceColor','g');
    end
   

    drawnow

    %pause(0.005)
    if n >=1
    delete(cuerpo1)
    end
    if n >= 2
    delete(cuerpo2)
    end
    if n >= 3
    delete(cuerpo3)
    end
    if n >= 4
    delete(cuerpo4)
    end
    if n >= 5
    delete(cuerpo5)
    end
    if n >= 6
    delete(cuerpo6)
    end
    if n >= 7
    delete(cuerpo7)
    end
    if n >= 8
    delete(cuerpo8)
    end
    if n >= 9
    delete(cuerpo9)
    end
    if n >= 10
    delete(cuerpo10)
    end
  



end

if n >= 1 
scatter3(x1(length(x1)), y1(length(x1)), z1(length(x1)),80,'Filled','MarkerFaceColor','r'); %Cuerpo1
end
if n >= 2
scatter3(x2(length(x1)), y2(length(x1)), z2(length(x1)),80,'Filled','MarkerFaceColor','b'); %Cuerpo2
end
if n >= 3
scatter3(x3(length(x1)), y3(length(x1)), z3(length(x1)),80,'Filled','MarkerFaceColor','g'); %Cuerpo3
end
if n >= 4
scatter3(x4(length(x1)), y4(length(x1)), z4(length(x1)),80,'Filled','MarkerFaceColor','y'); %Cuerpo1
end
if n >= 5
scatter3(x5(length(x1)), y5(length(x1)), z5(length(x1)),80,'Filled','MarkerFaceColor','m'); %Cuerpo2
end
if n >= 6
scatter3(x6(length(x1)), y6(length(x1)), z6(length(x1)),80,'Filled','MarkerFaceColor','c'); %Cuerpo3
end
if n >= 7
scatter3(x7(length(x1)), y7(length(x1)), z7(length(x1)),80,'Filled','MarkerFaceColor','w'); %Cuerpo1
end
if n >= 8
scatter3(x8(length(x1)), y8(length(x1)), z8(length(x1)),80,'Filled','MarkerFaceColor','k'); %Cuerpo2
end
if n >= 9
scatter3(x9(length(x1)), y9(length(x1)), z9(length(x1)),80,'Filled','MarkerFaceColor','r'); %Cuerpo3
end

if n >= 10
scatter3(x10(length(x1)), y10(length(x1)), z10(length(x1)),80,'Filled','MarkerFaceColor','g'); %Cuerpo1
end




%------------------------------ Función aceleración -------------------------------------------%

else
    %clear; clc; clf;
% -------------------------- setup ---------------------------------- %
set(gcf,'color',[.7 .7 .9])                             % figure props
set(gca,'gridcolor',[1 1 0],'color',[0 0 0],...         % axis props
       'TickLength',  [0 0],'XTickLabel',[],...
       'YTickLabel',     [],'ZTickLabel',[])
hold on; grid on; axis([-1 1 -1 1 -1 1]);

%n  =                  3;                               % planet data
m  =      1000*rand(1,n);                     
x  = rand(3,n)-rand(3,n);     
v  =          zeros(3,n);   
dt =              .00005; 

for e = 1:n                                             % planet markers
    planets(e) = plot3(x(1,e),x(2,e),x(3,e),'o',...
        'markersize',m(e)/100,'markerfacecolor',rand(1,3));
end

% ---------------------------- main loop --------------------------- % 
tic;
while toc < 100
    %view(10*toc,30)                                     % rotate axis
    planets = plotUpdate(planets,x);                    % update plot
    [x,v]   = dataUpdate(x,v,m,dt);                     % update data
    pause(.02); 
end

% ------------------------- functions --------------------------------- %
end
    
end
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

function planets = plotUpdate(planets,x)                % update plot
for e = 1:length(x)
    set(planets(e),'XData',x(1,e),'YData',x(2,e),'ZData',x(3,e));
end
end

function [x,v] = dataUpdate(x,v,m,dt)                   % update data
for i = 1:length(x)                                     % [euler method]
    a(:,i) = zeros(3,1);
    for j = 1:length(m)                                 
        if i ~= j
            a(:,i) = a(:,i) + m(j).*(x(:,j) - x(:,i))./...
                (norm(x(:,j) - x(:,i))^3 + .5);
        end
        v(:,i) = v(:,i) + a(:,i)*dt;
        x(:,i) = x(:,i) + v(:,i)*dt;
    end
end
end
