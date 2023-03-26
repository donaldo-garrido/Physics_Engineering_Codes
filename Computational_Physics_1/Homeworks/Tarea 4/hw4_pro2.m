%---------------Inciso A------------------
A = hilb(3); %Matriz de Hilbert 3x3
x0 = [1;1;1] %vector columna {x}
b = A*x0;
for i=1:1:3
    for j=1:1:3   
    y(i,j) = A(i,j);
    y(i,4)=b(i);
    end
end
z=rref(y);
x1=[z(1,4),z(2,4),z(3,4)]
%---------------Inciso B------------------
A = hilb(20); %Matriz de Hilbert 3x3
x0 = [1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1] %Se repite el proceso
b = A*x0;
for i=1:1:20
    for j=1:1:20   
    y(i,j) = A(i,j);
    y(i,21)=b(i);
    end
end
z=rref(y);

for i=1:1:20
x2(i,1)=z(i,21);
end
display(x2)
