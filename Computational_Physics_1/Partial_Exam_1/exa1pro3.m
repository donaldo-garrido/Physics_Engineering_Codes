function []=exa1pro3
load problema3(1)
a=x(1); %Lo probé y es -15
b=x(end); %Lo probé y es +15

[X,Y]=size(y);
c=0.1;
while Y>2
indx=find(y<c & y>-c);
[X,Y]=size(indx);
c=c/10;
end
x1=x(indx(1,1))
x2=x(indx(1,2))
cero=['La mejor aproximación a cero fue ',num2str(c)];
raiz=['Las raices son ',num2str(x1), ' y ',num2str(x2)];
disp(cero)
disp(raiz)
end