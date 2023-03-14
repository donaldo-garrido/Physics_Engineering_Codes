close all
load('coeficientesH.mat') %Es la matriz con los coeficientes 
%de los arm�nicos esf�ricos del problema 2


u = 21;
dimN = 500;
n1 = 2000;

% C�lculo constante B
theta1 = linspace(0,pi,dimN);
phi1 = linspace(0,2*pi,dimN);
r = linspace(0,2000,n1);
R = linspace(0.0001,1,u);
[T,P] = meshgrid(theta1,phi1);
f = (pi.*T-T.^2).^2.*sin(T).*exp(-2*cos(P+2.*T));
dt = (theta1(2)-theta1(1));
dp = (phi1(2)-phi1(1));
IntA = 0; %Integral angular
for i = 1:dimN
    for j = 1:dimN
        IntA = dt.*dp.*f(i,j)+IntA;
    end
end
IntR = 8/105; %Integral radial
I = IntA*IntR;
B = 1/sqrt(I)


% ------------ C�lculo de ceros para Bessel -----------%
%Primera aproximaci�n (rudmentaria)
for j=0:u-1
radial = sphbes(j, r);
k1 = 1;
for i=1:n1-1
    if radial(i)>0 && radial(i+1)<0
        Ser(j+1,k1) = r(i);
        k1 = k1+1;
    elseif radial(i)<0 && radial(i+1)>0
        Ser(j+1,k1) = r(i);
        k1 = k1+1;
    end
end
end

% C�lculo exacto de las Betas
for l = 0:u-1
    for n = 1:dimN
        myfun = @(x,nu) sqrt(pi ./(2* x)) .* besselj(nu + 0.5, x);  
        nu = l;                    
        fun = @(x) myfun(x,nu);    
        beta(l+1,n) = fzero(fun, Ser(l+1,n));
    end
end
energias = beta.^2; %Energ�as permitidas




%---   Coeficientes Radiales  ----%
Cs = zeros(u,dimN);
dR = R(2)-R(1);
for l=0:u-1
    for n = 1:dimN
    cte = 0;
        for i=1:u-1
        In = (sphbes(1, beta(l+1,n)*R(i)).*R(i).^2.*(1-R(i).^2)+sphbes(1, beta(l+1,n)*R(i+1)).*R(i+1).^2.*(1-R(i+1).^2))/2*dR;
        cte = cte+In;
        end
    Cs(l+1,n) = B*Aln(l,beta(l+1,n))*cte; %Matriz con coeficientes 
    end
end


% ------------ Armar los Coeficientes nlm------------
CoefNLM = zeros(11,21,dimN);
Prob=0;
for l = 1:11
   for m = 1:21
       for n = 1:dimN
           CoefNLM(l,m,n) = Cs(l,n).*coefMatrix(l,m);
           %Prob= prob+CoefMLN(l,m,n).^2;
       end 
   end 
end
Probas = abs(CoefNLM).^2;
probaTot = sum(sum(sum(Probas)));


% C
%---- Encontrar la energ�a m�s probable --------------

for n = 1:dimN
   for l = 1:11
       p1=0;
       for m = 1:21
           p1=p1+Probas(l,m,n);
       end  
       Eprob(l,n)=p1;
       if p1<0.0001
           Eprob(l,n) = 0;
       end
   end   
end
X = sum(sum(abs(Eprob)));
[Ml,IndL] = max(Eprob);
[Mn,nmax] = max(Ml);
lmax = IndL(nmax);
disp('Indice l de energ�a')
disp(lmax-1) %Indice l de energ�a
disp('Indice n de energ�a')
disp(nmax) %Indice n de energ�a
EnergMasProb =(beta(lmax,nmax))^2 %Vslor m�s probable para medici�n de energ�a



%D
%------ Valor esperado de energ�a -------------------
EnergEsperada = sum(sum(Eprob))




%E
%---------- Valor m�s probanle Lz ---------------------------
% Matriz para poner a cada t�rmino su m como coefciente
Mm = zeros(11,21);
for i = 2:11
    k = 0;
    for j=(12-i):(10+i)
        Mm(i,j) = -i+1+k;
        k = k+1;
    end
    
end
% Medicion de Lz y c�lculo de probabilidad:
medLz = (abs(coefMatrix.*Mm)).^2;
%Podemos calcular un coeficiente de normalizaci�n
cNormLz = 1/sum(sum(medLz));
medLz = cNormLz*medLz;
ProbM = zeros(1,21);
for i = 1:21
    ProbM(1,i)=sum(medLz(:,i));
end
[mLz,LzIndM] = max(ProbM)
%El valor m�s probable para Lz:
LzProbable = Mm(2,LzIndM) %Y es 1 tambi�n



%F
%---------- Valor esperado para Z^2 ---------------------------
% Matriz para poner a cada t�rmino su l(l+1) como coefciente
Ml = zeros(11,21);
for i = 1:11
    k = 0;
    for j=(12-i):(10+i)
        Ml(i,j) = (i-1)*i;
    end
    
end
medL2 = (abs(coefMatrix.*Ml)).^2;
cNormL2 = 1/sum(sum(medL2));
medL2 = cNormL2*medL2;
%Valor esperado para L2:
EsperadoL2 = sum(sum(medL2.*Ml))


%Coeficientes para las eigenfunciones para graficar en la esfera.
R12=zeros(11,10);
for l=0:10
    for n =1:10
        R12(l+1,n) = Aln(l,beta(l+1,n)).*sphbes(l, beta(l+1,n)*0.5);
    end
end





function js = sphbes(nu, x)
% Regresa las funciones esf�ricas de Bessel(x)

[nnu lnu] = size(nu);
[nx lx] = size(x);
xm = repmat(x, 1, lnu);
js = sqrt(pi ./(2* xm)) .* besselj(nu + 0.5, x);
end

%Funci�n de c�lculo de las constantes A
function A = Aln(l,beta)
    A = sqrt(2)/(besselj(l+1,beta));
end