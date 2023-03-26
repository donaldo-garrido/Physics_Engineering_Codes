i=3000;                                 %numero de iteraciones
N=2000;                                 %numero de agentes
M=50*N;                               
dm=0.02*M/N;                            %cantidad de dinero por interacción
agents=linspace(1,N,N);                 
m=zeros(i,N);                           
m(1,:)=M/N*ones(1,N); %linspace(1,300,N); para distribución constante
a = 1;
for c=2:i
    m(c,:)=m(c-1,:);
    for k=1:N
        L=agents(agents~=agents(k));    
        r=randi(L(length(L)));          %índice al azar de interacción
        s=sign(rand-0.5);               %signo positivo o negativo
        mk=(m(c-1,k)+s*dm);               %nuevo valor para el agente k
        mr=(m(c-1,r)-s*dm);               %nuevo valor para el agente r
        if mk>=0 && mr>=0
            m(c,k)=mk;%*a*mk;
            m(c,r)=mr;%*a*mr;
        end
    end
end

%Animation
classes=0:10:300;                       %límite de las claases
measure=10:10:i;                      
dist = 'Distribución inicial Delta, iteración: ';
for t=measure
    s=num2str(t/10);
    figure(1)
    histogram(m(t,:),classes,'facecolor', 'k'),title(append(dist,s))
    axis([0 300 0 1000])
    pause(0.1)
end

%% Cálculo de S
sum=0;
S=zeros(1,length(measure));
for t=measure
    h=histogram(m(t,:),classes);title(s);
    for n=1:length(classes)-1
        if h.Values(n)>0
            sum=sum+h.Values(n)*log(h.Values(n));
        end
    end
    S(t/10)=N*log(N)-sum;
    sum=0;
end

figure(2)
plot(measure,S, 'k');                      
title('S para distribución inicial Delta, \Delta m = 0.02')
xlabel('iteraciones')
ylabel('S')
hold off



%% Función Objetivo
sum=0;
S=zeros(1,length(measure));
for t=measure
    h=histogram(m(t,:),classes);title(s);
    for n=1:length(classes)-1
        if h.Values(n)>0
            sum=(1-exp(-a*classes(n)))*(sum+h.Values(n)*log(h.Values(n)));
        end
    end
    OF(t/10)=sum;
    sum=0;
end

figure(3)
plot(measure,OF,'k')                        
title('Función objetivo o_1(M) = -aM, dist. inicial Delta')

