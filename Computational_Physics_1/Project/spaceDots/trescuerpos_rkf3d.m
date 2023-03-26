function trescuerpos_rkf3d(inter,ic,m1,m2,m3,m4,m5,m6,n,p,nombre)
    h=(inter(2)-inter(1))/n; %razon de cambio de tiempo

    x1=ic(1);   vx1=ic(2);  y1=ic(3);   vy1=ic(4);  z1=ic(5); vz1=ic(6); %componentes de primer elemento
    x2=ic(7);   vx2=ic(8);  y2=ic(9);   vy2=ic(10); z2=ic(11); vz2=ic(12);%componentes de segundo elemento
    x3=ic(13);  vx3=ic(14); y3=ic(15);  vy3=ic(16); z3=ic(17); vz3=ic(18);%componentes de tercer elemento
    x4=ic(19);  vx4=ic(20); y4=ic(21);  vy4=ic(22); z4=ic(23); vz4=ic(24);%componentes de tercer elemento
    x5=ic(25);  vx5=ic(26); y5=ic(27);  vy5=ic(28); z5=ic(29); vz5=ic(30);%componentes de tercer elemento
    x6=ic(31);  vx6=ic(32); y6=ic(33);  vy6=ic(34); z6=ic(35); vz6=ic(36);%componentes de tercer elemento

    y(1,:)=[x1 vx1 y1 vy1 z1 vz1 x2 vx2 y2 vy2 z2 vz2 x3 vx3 y3 vy3 z3 vz3 x4 vx4 y4 vy4 z4 vz4 x5 vx5 y5 vy5 z5 vz5 x6 vx6 y6 vy6 z6 vz6]; %vector con todos los datos proporcionados
    t(1)=inter(1); % primer iteracion

    set(gca,'XLim',[-50 50],'YLim',[-50 50],'ZLim',[-50 50],'XTick',[-50 0 50],'YTick',[-50 0 50],'ZTick',[-50 0 50]);

    object1_h=animatedline('color',[0,0.4470,0.7410],'Marker','.','markersize',20);
    object1_t=animatedline('color',[0.3010,0.7450,0.9330],'LineStyle','-');
    object2_h=animatedline('color',[0.8500,0.3250,0.0980],'Marker','.','markersize',30);
    object2_t=animatedline('color',[0.6350,0.0780,0.1840],'LineStyle','-');
    object3_h=animatedline('color',[0.4660,0.6740,0.1880],'Marker','.','markersize',10);
    object3_t=animatedline('color',[0.4660,0.6740,0.1880],'LineStyle','-');
    object4_h=animatedline('color',[0,0.3470,0.5410],'Marker','.','markersize',25);
    object4_t=animatedline('color',[0.2010,0.7450,0.7330],'LineStyle','-');
    object5_h=animatedline('color',[0.6500,0.3250,0.2980],'Marker','.','markersize',35);
    object5_t=animatedline('color',[0.5350,0.0780,0.3840],'LineStyle','-');
    object6_h=animatedline('color',[0.3660,0.6740,0.5880],'Marker','.','markersize',45);
    object6_t=animatedline('color',[0.8660,0.6740,0.6880],'LineStyle','-');

    for k=1:n/p
        for i=1:p
            t(i+1)=t(i)+h; %aqui esta ocurriendo runge kuta 
            y(i+1,:)=rkf(t(i),y(i,:),h,m1,m2,m3,m4,m5,m6); 
        end
        y(1,:)=y(p+1,:);t(1)=t(p+1);

        clearpoints(object1_h); %limpiamos puntos anteriores
        clearpoints(object2_h);
        clearpoints(object3_h);
        clearpoints(object4_h);
        clearpoints(object5_h);
        clearpoints(object6_h);

        addpoints(object1_h,y(1,1),y(1,3),y(1,5)) %agregamos los nuevos puntos
        addpoints(object1_t,y(1,1),y(1,3),y(1,5))
        addpoints(object2_h,y(1,7),y(1,9),y(1,11))
        addpoints(object2_t,y(1,7),y(1,9),y(1,11))
        addpoints(object3_h,y(1,13),y(1,15),y(1,17))%Aguas AQUIIIIIIIIIIII!!
        addpoints(object3_t,y(1,13),y(1,15),y(1,17))
        addpoints(object1_h,y(1,19),y(1,21),y(1,23))
        addpoints(object1_t,y(1,19),y(1,21),y(1,23))
        addpoints(object2_h,y(1,25),y(1,27),y(1,29))
        addpoints(object2_t,y(1,25),y(1,27),y(1,29))
        addpoints(object3_h,y(1,31),y(1,33),y(1,35))
        addpoints(object3_t,y(1,31),y(1,33),y(1,35))
        drawnow;
    end

end

function y=rkf(t,x,h,m1,m2,m3,m4,m5,m6) %runge kuta de orden 4
    z1=dependencia(t,x,m1,m2,m3,m4,m5,m6);
    g=x+(h/2)*z1;
    z2=dependencia(t+h/2,g,m1,m2,m3,m4,m5,m6);
    g=x+(h/2)*z2;
    z3=dependencia(t+h/2,g,m1,m2,m3,m4,m5,m6);
    g=x+(h/2)*z3;
    z4=dependencia(t+h/2,g,m1,m2,m3,m4,m5,m6);
    y=x+h*(z1+z2+z3+z4)/6;
end

function z=dependencia(t,x,m1,m2,m3,m4,m5,m6) %el vector x es en realidad el vector y del inicio del programa
    g=1; %valor original =1, para prueba cambie a 6.67
    mg1=m1*g;   mg2=m2*g;   mg3=m3*g; %calculamos pesos
    mg4=m4*g;   mg5=m5*g;   mg6=m6*g; %calculamos pesos

    px1=x(1);   py1=x(3); pz1=x(5);  vx1=x(2);   vy1=x(4); vz1=x(6); % sacamos puntos de posicion para calcular las diferencias
    px2=x(7);   py2=x(9); pz2=x(11);  vx2=x(8);   vy2=x(10); vz2=x(12);
    px3=x(13);   py3=x(15); pz3=x(17);  vx3=x(14);  vy3=x(16); vz3=x(18);
    px4=x(19);   py4=x(21); pz4=x(23);  vx4=x(20);   vy4=x(22); vz4=x(24); 
    px5=x(25);   py5=x(27); pz5=x(29);  vx5=x(26);   vy5=x(28); vz5=x(30);
    px6=x(31);   py6=x(33); pz6=x(35);  vx6=x(32);  vy6=x(34); vz6=x(36);
    
    

    dist12=sqrt((px1-px2)^2+(py1-py2)^2+(pz1-pz2)^2); %calculamos distancias entre los puntos
    dist23=sqrt((px2-px3)^2+(py2-py3)^2+(pz2-pz3)^2);
    dist13=sqrt((px1-px3)^2+(py1-py3)^2+(pz1-pz3)^2);
    dist12=sqrt((px1-px2)^2+(py1-py2)^2+(pz1-pz2)^2); %calculamos distancias entre los puntos
    dist23=sqrt((px2-px3)^2+(py2-py3)^2+(pz2-pz3)^2);
    dist13=sqrt((px1-px3)^2+(py1-py3)^2+(pz1-pz3)^2);

    z=zeros(1,18); %creamos vector de ceros donde se van a guardar nuestras ecuaciones diferenciales

    z(1)=vx1;
    z(2)=(mg2*(px2-px1))/(dist12^3)+(mg3*(px3-px1))/(dist13^3); %ley de gravitacion universal entre m2 y m3 en x
    z(3)=vy1;
    z(4)=(mg2*(py2-py1))/(dist12^3)+(mg3*(py3-py1))/(dist13^3);%ley de gravitacion universal para m2 y m3 en y
    z(5)=vz1;
    z(6)=(mg2*(pz2-pz1))/(dist12^3)+(mg3*(pz3-pz1))/(dist13^3);

    z(7)=vx2;
    z(8)=(mg1*(px1-px2))/(dist12^3)+(mg3*(px3-px2))/(dist23^3); %ley de gravitacion universal entre m1 y m3 en x
    z(9)=vy2;
    z(10)=(mg1*(py1-py2))/(dist12^3)+(mg3*(py3-py2))/(dist23^3);
    z(11)=vz2;
    z(12)=(mg1*(pz1-pz2))/(dist12^3)+(mg3*(pz3-pz2))/(dist23^3);%ley de gravitacion universal entre m1 y m3 en y

    z(13)=vx3;
    z(14)=(mg1*(px1-px3))/(dist13^3)+(mg2*(px2-px3))/(dist23^3);%ley de gravitacion universal entre m2 y m3 en x
    z(15)=vy3;
    z(16)=(mg1*(py1-py3))/(dist13^3)+(mg2*(py2-py3))/(dist23^3);
    z(17)=vz3;
    z(18)=(mg1*(pz1-pz3))/(dist13^3)+(mg2*(pz2-pz3))/(dist23^3);%ley de gravitacion universal entre m2 y m3 en x
end