%{ 
    Complex Roots
    Este programa se encarga de calcular las raices
    de alguna funcion compleja. En este caso:
    (z)^5 + (z)^3 - pi = 0
%}

function complexRoots()    
  
    x2 = -2:2;  
    [X,Y] = meshgrid(x2);  % Se crea una matriz con distintos punto x y y   
    zInicial = X + 1i.*Y;  %Creacion de una mtriz con z iniciales de prueba 
                           % Se explora los cuatro cuadrantes del plano
                           % complejo    
    dimensions = size(zInicial);
    roots = zeros(1,dimensions(1)*dimensions(2)); % Arreglo donde se guardaran las raices
    temporalArray = zeros(1,dimensions(1)*dimensions(2));
    
    count = 1;
    %Estimando la raiz para cada z inicial de la matriz
    for k = 1:dimensions(1)
        for h = 1:dimensions(2)
            z_0 = zInicial(k,h);   
            roots(count) = computeRoot(z_0); %Se llama a la funcion computeRoot para cada z_0
            count = count + 1;
        end
    end
    count = 1;
    %{
    Ciclo For para desplegar unicamente las raices que no estan repetias
    dentro del arreglo "roots"
    %}
    for k = 1: length(roots)
        
        bool = 0;
      
        if k > 1
            %Buscar que las raices no se desplieguen en pantalla dos veces
            for r = 1:length(temporalArray)
                
                if roots(k) == temporalArray(r) 
                    bool = 1; 
                    break;
                end                
            end
            
            if bool==0 && ~isnan(roots(k))
                disp("z = "+roots(k));
                temporalArray(count) = roots(k);
                count = count + 1;
            end
            
        else
            disp("z = "+roots(k));
            temporalArray(count) = roots(k);
            count = count + 1;
        end
    end
    
end

%{
    Funcion encargada de calcular la raiz dada una z inicial a teves del
    metodo de Newton-Raphson
%}
function [root] = computeRoot(z_0)
    
   % Se tiene un maximo de 1000 iteraciones
   for i =1:1000
        
      x = real(z_0);
      y = imag(z_0);
      z = x + 1i*y;

      f  = (z)^5 + (z)^3 - pi;
      fPrima = 5*(z)^4 + 3*(z)^2 ;

      z1 = z_0 - (f/fPrima);          
      z_0 =z1;       
      
   end   
   root = z_0;     %Se regresa la raiz calculada
end