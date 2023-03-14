function analitica_cuerpos(m_1,v_1,r_1,m_2,v_2,r_2,m_3,v_3,r_3)
%%se le tienen que pasar los vectores de posicion y velocidad 



ax = axes('XLim',[-100 100],'YLim',[-100 100],'ZLim',[-100 100]);
view(3);
grid off;
axis equal;
[Xg,Yg] = meshgrid(0:5:100,0:5:100);                                
Zg =.00001*Xg+.00001*Yg;                                        
surf(Xg,Yg,Zg)
colormap white
axis equal
set(gcf,'Color','white')
scrsz = get(0,'ScreenSize');
set(gcf,'Position',[scrsz(1) scrsz(2)+scrsz(4)/20 scrsz(3) scrsz(4)*17/20]);




[xt,yt,zt] = sphere(20);

h(1) = surface(3*xt,-3*yt,3*zt+1,'FaceColor','red');
hh(1) = surface(3*xt,-3*yt,3*zt+1,'FaceColor','blue');
hhh(1) = surface(3*xt,-3*yt,3*zt+1,'FaceColor','black');
t1 = hgtransform('Parent',ax);
set(hh,'Parent',t1)
set(gcf,'Renderer','opengl')
t2 = hgtransform('Parent',ax);
set(hhh,'Parent',t2)
set(gcf,'Renderer','opengl')
t3 = hgtransform('Parent',ax);
set(h,'Parent',t3)
set(gcf,'Renderer','opengl')
drawnow



G = 6.674e-11;
dt = 0.05;
zbea = 0;

for i = 1:100
    
    
    %1
    r_12 = norm(r_2-r_1);
    r_13 = norm(r_3-r_1);
  
    dv_12 = G*m_1*m_2/r_12.^2*dt;
    dv_13 = G*m_1*m_3/r_13.^2 *dt; 
    
    v_1(1) =  v_1(1) + dv_12*(r_2(1)-r_1(1))/r_12 + dv_13*(r_3(1)-r_1(1))/r_13;
    v_1(2) =  v_1(2) + dv_12*(r_2(2)-r_1(2))/r_12 + dv_13*(r_3(2)-r_1(2))/r_13;
    v_1(3) =  v_1(3) + dv_12*(r_2(3)-r_1(3))/r_12 + dv_13*(r_3(3)-r_1(3))/r_13;
    
    
    r_1(1) = r_1(1) + v_1(1)*dt;
    r_1(2) = r_1(2) + v_1(2)*dt;
    r_1(3) = r_1(3) + v_1(3)*dt;
    
    
    %%2
    r_23 = norm(r_3-r_2);
  
    dv_21 = G*m_2*m_1/r_12.^2*dt;
    dv_23 = G*m_2*m_3/r_23.^2 *dt; 
    
    v_2(1) =  v_2(1) + dv_21*(r_1(1)-r_2(1))/r_12 + dv_23*(r_3(1)-r_2(1))/r_23;
    v_2(2) =  v_2(2) + dv_21*(r_1(2)-r_2(2))/r_12 + dv_23*(r_3(2)-r_2(2))/r_23;
    v_2(3) =  v_2(3) + dv_21*(r_1(3)-r_2(3))/r_12 + dv_23*(r_3(3)-r_2(3))/r_23;
    
    
    r_2(1) = r_2(1) + v_2(1)*dt;
    r_2(2) = r_2(2) + v_2(2)*dt;
    r_2(3) = r_2(3) + v_2(3)*dt;
    
    
    %%3
    
    dv_31 = G*m_3*m_1/r_13.^2*dt;
    dv_32 = G*m_3*m_2/r_23.^2 *dt;
    
    v_3(1) =  v_3(1) + dv_31*(r_1(1)-r_3(1))/r_13 + dv_32*(r_2(1)-r_3(1))/r_23;
    v_3(2) =  v_3(2) + dv_31*(r_1(2)-r_3(2))/r_13 + dv_32*(r_2(2)-r_3(2))/r_23;
    v_3(3) =  v_3(3) + dv_31*(r_1(3)-r_3(3))/r_13 + dv_32*(r_2(3)-r_3(3))/r_23;
    
    r_3(1) = r_3(1) + v_3(1)*dt;
    r_3(2) = r_3(2) + v_3(2)*dt;
    r_3(3) = r_3(3) + v_3(3)*dt;
     
    
    
    mov1=makehgtform('translate',[r_1(1) r_1(2) r_1(3)]);
    rot1=makehgtform('zrotate',zbea);
    mov2=makehgtform('translate',[r_2(1) r_2(2) r_2(3)]);
    rotz2=makehgtform('zrotate',zbea);
    mov3=makehgtform('translate',[r_3(1) r_3(2) r_3(3)]);
    rotz3=makehgtform('zrotate',zbea);
    set(t1,'matrix',mov1*rot1);
    set(t2,'matrix',mov2*rotz2);
    set(t3,'matrix',mov3*rotz3);
    
    pause(dt)

end 