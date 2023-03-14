function trescuerpos_rkf(inter,ic,m1,m2,m3,n,p,nombre)
    h=(inter(2)-inter(1))/n;

    x1=ic(1);   vx1=ic(2);  y1=ic(3);   vy1=ic(4);
    x2=ic(5);   vx2=ic(6);  y2=ic(7);   vy2=ic(8);
    x3=ic(9);   vx3=ic(10); y3=ic(11);  vy3=ic(12);

    y(1,:)=[x1 vx1 y1 vy1 x2 vx2 y2 vy2 x3 vx3 y3 vy3];
    t(1)=inter(1);

    set(gca,'XLim',[-10 10],'YLim',[-10 10],...
    'XTick',[-10 0 10],'YTick',[-10 0 10]);

    object1_h=animatedline('color','y','Marker','.','markersize',20);
    object1_t=animatedline('color','k','LineStyle','-');
    object2_h=animatedline('color','r','Marker','.','markersize',50);
    object2_t=animatedline('color','b','LineStyle','-');
    object3_h=animatedline('color','g','Marker','.','markersize',10);
    object3_t=animatedline('color','c','LineStyle','-');

    v=VideoWriter(nombre,'MPEG-4');open(v)
    for k=1:n/p
        for i=1:p
            t(i+1)=t(i)+h;
            y(i+1,:)=rkf(t(i),y(i,:),h,m1,m2,m3);
        end
        frame=getframe;writeVideo(v,frame);
        y(1,:)=y(p+1,:);t(1)=t(p+1);

        clearpoints(object1_h);
        clearpoints(object2_h);
        clearpoints(object3_h);

        addpoints(object1_h,y(1,1),y(1,3))
        addpoints(object1_t,y(1,1),y(1,3))
        addpoints(object2_h,y(1,5),y(1,7))
        addpoints(object2_t,y(1,5),y(1,7))
        addpoints(object3_h,y(1,9),y(1,11))
        addpoints(object3_t,y(1,9),y(1,11))
        drawnow;
    end
    close(v)
end

function y=rkf(t,x,h,m1,m2,m3)
    z1=dependencia(t,x,m1,m2,m3);
    g=x+(h/2)*z1;
    z2=dependencia(t+h/2,g,m1,m2,m3);
    g=x+(h/2)*z2;
    z3=dependencia(t+h/2,g,m1,m2,m3);
    g=x+(h/2)*z3;
    z4=dependencia(t+h/2,g,m1,m2,m3);
    y=x+h*(z1+z2+z3+z4)/6;
end

function z=dependencia(t,x,m1,m2,m3)
    g=1;
    mg1=m1*g;   mg2=m2*g;   mg3=m3*g;

    px1=x(1);   py1=x(3);   vx1=x(2);   vy1=x(4);
    px2=x(5);   py2=x(7);   vx2=x(6);   vy2=x(8);
    px3=x(9);   py3=x(11);  vx3=x(10);  vy3=x(12);

    dist12=sqrt((px1-px2)^2+(py1-py2)^2);
    dist23=sqrt((px2-px3)^2+(py2-py3)^2);
    dist13=sqrt((px1-px3)^2+(py1-py3)^2);

    z=zeros(1,12);

    z(1)=vx1;
    z(2)=(mg2*(px2-px1))/(dist12^3)+(mg3*(px3-px1))/(dist13^3);
    z(3)=vy1;
    z(4)=(mg2*(py2-py1))/(dist12^3)+(mg3*(py3-py1))/(dist13^3);

    z(5)=vx2;
    z(6)=(mg1*(px1-px2))/(dist12^3)+(mg3*(px3-px2))/(dist23^3);
    z(7)=vy2;
    z(8)=(mg1*(py1-py2))/(dist12^3)+(mg3*(py3-py2))/(dist23^3);

    z(9)=vx3;
    z(10)=(mg1*(px1-px3))/(dist13^3)+(mg2*(px2-px3))/(dist23^3);
    z(11)=vy3;
    z(12)=(mg1*(py1-py3))/(dist13^3)+(mg2*(py2-py3))/(dist23^3);
end