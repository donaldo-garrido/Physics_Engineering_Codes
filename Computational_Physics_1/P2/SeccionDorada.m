x=lispace(0,4,1000);
xmn=x(1);
xmx=x(end);
r=x2-x1;
if error>1*10^-6
x1=xmx-r*(xmx-xmn)
x2=xmx+r*(xmx-xmn)
error=(1-r)*(xmx-xmn)
end
