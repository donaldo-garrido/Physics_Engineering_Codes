r1inicial=[100,0,0];
r2inicial=[-100,0,0];
m1=0.8e11;
m2=1.2e12;
v1inicial=[0,800,0];
v2inicial=[0,-800,0];
G=6.67408e-11; %Constante de gravitación universal
t=linspace(0,0.3,1000); %tiempo

r1x(1)=r1inicial(1); v1x=v1inicial(1);
r2x(1)=r2inicial(1); v2x=v2inicial(1);
r1y(1)=r1inicial(2); v1y=v1inicial(2);
r2y(1)=r2inicial(2); v2y=v2inicial(2);
r1z(1)=r1inicial(3); v1z=v1inicial(3);
r2z(1)=r2inicial(3); v2z=v2inicial(3);

posicion1x=zeros(1,length(t));
posicion1y=zeros(1,length(t));
posicion1z=zeros(1,length(t));
posicion2x=zeros(1,length(t));
posicion2y=zeros(1,length(t));
posicion2z=zeros(1,length(t));

for i=1:1:length(t)
    r1_2=sqrt((r2x(i)-r1x(i))^2+(r2y(i)-r1y(i))^2+(r2z(i)-r1z(i))^2); %Magnitud de r 1-2
    
    v1x=(G*m2/r1_2)*r1x(i)*t(i)+v1inicial(1);
    v1y=(G*m2/r1_2)*r1y(i)*t(i)+v1inicial(2);
    v1z=(G*m2/r1_2)*r1z(i)*t(i)+v1inicial(3);
    
    v2x=(G*m1/r1_2)*r2x(i)*t(i)+v2inicial(1);
    v2y=(G*m1/r1_2)*r2y(i)*t(i)+v2inicial(2);
    v2z=(G*m1/r1_2)*r2z(i)*t(i)+v2inicial(3);
    
    posicion1x(i)=v1x*t(i)+r1x(1);
    posicion1y(i)=v1y*t(i)+r1y(1);
    posicion1z(i)=v1z*t(i)+r1z(1);
    
    posicion2x(i)=v2x*t(i)+r2x(1);
    posicion2y(i)=v2y*t(i)+r2y(1);
    posicion2z(i)=v2z*t(i)+r2z(1);
    
    r1x(i+1)= posicion1x(i);
    r1y(i+1)= posicion1y(i);
    r1z(i+1)= posicion1z(i);
    
    r2x(i+1)= posicion2x(i);
    r2y(i+1)= posicion2y(i);
    r2z(i+1)= posicion2z(i);
   
    plot3(posicion1x(i),posicion1y(i),posicion1z(i),'o') %graficar los puntos obtenidos para cada vértice
    
    plot3(posicion2x(i),posicion2y(i),posicion2z(i),'o')
    pause(1/10)
end



%comet3(posicion1x,posicion1y,posicion1z)
%comet3(posicion2x,posicion2y,posicion2z)


         %ajuste de los ejes
        %pause(1/10); %la pausa es controlada por la velocidad
         %Este comando se agrega para que no se guarden los marcadores de los ploteos anteriores, si se quiere verlos, solamente se elimina %       cl