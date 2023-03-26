A=[55,0,-25;0,0,0;0,-37,-4;-25,-4,29]; %Matriz de corrientes ordenada correctamente
B=[-200;0;-250;100] %Vector B
x = A\B; %Solución del sistema
display(x);
