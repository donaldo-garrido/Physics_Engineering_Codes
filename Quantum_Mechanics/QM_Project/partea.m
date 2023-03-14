%% CONFIGURACIÓN INICIAL
N=1024;%numero de datos
a=1;
h=1;
M=1/2;
%% DEFINICION DE ESPACIOS VECTORIALES
th = linspace(0,pi,N);    % inclination
phi = linspace(0,2*pi,N); % azimuth
rp=linspace(0.00001,a,N); %parte radial
[P,T]=meshgrid(phi,th);
[R]=meshgrid(rp);
%matrices cuadradas
%% ARMONICOS ESFERICOS
%configuracion grafica
LW = 'linewidth'; lw = 1; FS = 'FontSize'; fs = 12;
FC = 'FaceColor'; fc = [0.93 0.93 0.93]; EC = 'EdgeColor'; ec = 'none';
vw = [70 25];
%CONFIGURACION INICIAL

%% GRAFICA DE LA FUNCION A REPRODUCIR
cor=(pi/2)*ones(size(T));
gp=exp(-cos(P+2*T)).*(T.*(pi*ones(size(T))-T));

%% FORMACION DE ESFERICOS
 %CONTADORES
i=1;
g=0;
l=0;
%ERROR ABSOLUTO
err=1;
%C=zeros(9,17);
while err>0.01
% for k=1:5
    j=1;
    for m=-l:l
        Y=harmonicY(l,m,T,P);
        F=gp.*conj(Y).*sin(T);
        C(i,j)=sum(F(:))*(pi/N)*(2*pi/N);
%         disp(C(i,j))
        if abs(real((C(i,j))))>0.001 || abs(imag(C(i,j)))>0.001
        g1=C(i,j)*Y;
        g=g+g1;
        end
        j=j+1;
    end
     err=immse(g,gp);
     disp(err)
     l=l+1;
     i=i+1;
end
%% GRAFICAS DE G(THETA,PHI)
%GRAFICO DE FUNCION ORIGINAL
figure(1)
[X,Y,Z]=sph2cart(P,cor-T,1);
%[gp2,thp,ph]=meshgrid(gp,th,phi);
surf(X,Y,Z,gp)
colormap jet;
title('Función g(\theta,\phi)')
colorbar; shading interp; daspect([1 1 1]); axis tight;
saveas(figure(1),'fig1.png')
%GRAFICA DE FUNCION CON ARMONICOS ESFERICOS
figure(2)
[X2,Y2,Z2]=sph2cart(P,cor-T,1);
surf(X2,Y2,Z2,real(g));
colormap jet;
title('Función g(\theta,\phi)a partir de Y_{lm}')
colorbar; shading interp; daspect([1 1 1]); axis tight;
saveas(figure(2),'fig2.png')
disp(err)
% %VALORES DE LOS ARMONICOS ESFERICOS MÁS OCUPADO
[M2,N2]=size(C);
ne=round(N2/2+0.1);
D=zeros(M2,N2);
for k=1:M2
    j2=1+2*(k-1);
    j3=ne;
    for j=1:j2
    D(k,j3)=C(k,j);
    j3=j3+1;
    end
    ne=ne-1;
end
xv={'-8','-7','-6','-5','-4','-3','-2','-1','0','1','2','3','4','5','6','7','8'};
yv={'0','1','2','3','4','5','6','7','8'};
figure(3)
h=heatmap(xv,yv,abs(D),'Colormap',jet);
%h=heatmap(abs(D),'Colormap',jet);
h.Title = 'Magnitud de Coeficientes Y_{lm}';
h.XLabel = 'valor de m';
h.YLabel = 'valor de l';
saveas(figure(3),'fig3.png')
%% CALCULANDO B
funRad= (a - rp.^2).^2.*rp.^2;   %funcion radial
funAngu = gp.^2.*sin(T);  %funcion angular
I1 = sum(funRad)*(a/N);
I2 = sum(funAngu(:))*(pi/N)*((2*pi)/N);
Integral = I1*I2;
B = sqrt(1/Integral);


%% Coeficientes radiales
n=100;
cr1=0;
CR=zeros(l,n);
for np=0:n
    for lp=0:(l-1)
        for i=1:(l-1)
        In=(sphbes(1, betha(lp+1,n)*rp(i)).*rp(i).^2.*(1-rp(i).^2)+sphbes(1, betha(l+1,n)*rp(i+1)).*rp(i+1).^2.*(1-rp(i+1).^2))/2*(a/N);
        cr1=cr1+In;
        end
    end
    CR(lp,n)=B*Alm(lp,betha(lp+1,n),a)*cr1;
end
%% Coeficientes CNLM
Cnlm=zeros(l,2*l+1,n);
for i =1:n
   for j=0:(l-1)
       for k=1:(2*j+1)
           Cnlm(j+1,k,n) = CR(j+1,n).*C(j+1,k);
           %Prob= prob+CoefMLN(l,m,n).^2;
       end   
   end   
end
Probas = Cnlm.^2;
probaTot = sum(sum(sum(abs(Probas))));
disp(probaTot)

%% FUNCIONES A USAR
function b=betha(l,n)
bp=besselzero(l+1/2,n);
b=bp(n);
end

function A=Alm(l,betha,a)
A=sqrt(2/a^3)*(1/sphbes(l+1,betha));
end

function x = besselzero(n, k, kind)
% besselzero calculates the zeros of Bessel function of the first and second kind 
%
%   x = besselzero(n)
%   x = besselzero(n, k)
%   x = besselzero(n, k, kind)
%
%% Inputs
% * *n* - The order of the bessel function. n can be a scalar, vector, or
%       matrix.  n can be positive, negative, fractional, or any
%       combinaiton. abs(n) must be less than or equal to
%       146222.16674537213 or 370030.762407380 for first and second kind
%       respectively. Above these values, this algorithm will not find the
%       correct zeros because of the starting values therefore an error is
%       thrown instead.
% * k - The number of postive zeros to calculate.  When k is not supplied,
%       k = 5 is the default. k must be a scalar.
% * kind - kind is either 1 or 2. When kind is not supplied, default is
%          kind = 1.
%
%% Outputs
% * x - The calculated zeros.  size(x) = [size(n) k].
% 
%% Description
% besselzero calculates the first k positive zeros of nth order bessel
% function of the first or second kind.  Note, that zero is not included as
% the first zero.
%
%% Algorithm
% the first three roots of any order bessel can be approximated by a simple
% equations.  These equations were generated using a least squares fit of
% the roots from orders of n=0:10000. The approximation is used to start
% the iteration of Halley's method.  The 4th and higher roots can be
% approximated by understanding the roots are regularly spaced for a given
% order.  Once the 2nd and 3rd roots are found, the spacing can be
% approximated by the distance between the 2nd and 3rd root.  Then again
% Halley's method can be applied to precisely locate the root.
%%
% Because the algorithm depends on good guesses of the first three zeros,
% if the guess is to far away then Halley's method will converge to the
% wrong zero which will subsequently cause any other zero to be incorrectly
% located. Therefore, a limit is put on abs(n) of 146222.16674537213 and
% 370030.762407380 for first and second kind respectively.  If n is
% specified above these limits, then an error is thrown.
%
%% Example
%   n = (1:2)';
%   k = 10;
%   kind = 1;
%   z = besselzero(n, k, kind);
%   x = linspace(0, z(end), 1000);
%   y = nan(2, length(x));
%   y(1,:) = besselj(n(1), x);
%   y(2,:) = besselj(n(2), x);
%   nz = nan(size(z));
%   nz(1,:) = besselj(n(1), z(1,:));
%   nz(2,:) = besselj(n(2), z(2,:));
%   plot(x, y, z, nz,'kx')
%

% Originally written by 
% Written by: Greg von Winckel - 01/25/05
% Contact: gregvw(at)chtm(dot)unm(dot)edu
%
% Modified, Improved, and Documented by 
% Jason Nicholson 2014-Nov-06
% Contact: jashale@yahoo.com

%% Change Log
% * Original release. 2005-Jan-25, Greg von Winckel.
% * Updated Documentation and commented algorithm. Fixed bug in finding the
%   the first zero of the bessel function of the second kind. Improved speed by 
%   factor of 20. 2014-Nov-06, Jason Nicholson.
%

%% Input checking
assert(nargin >=1 | nargin <=3,'Wrong number of input arguments.');

% Take care of default cases of k and kind
if nargin < 2
    k = 5;
end

if nargin < 3
    kind = 1;
end

assert(isscalar(kind) & any(kind == [1 2]), '''kind''must be a scalar with value 1 or 2 only.');
assert(isscalar(k) & fix(k)==k & k>0, 'k must a positive scalar integer.');
assert(all(isreal(n(:))), 'n must be a real number.');

% negative orders have the same roots as the positive orders
n = abs(n);

% Check for that n is less than the ORDER_MAX
if kind==1
    ORDER_MAX = 146222.16674537213;
    assert(all(n <= ORDER_MAX), 'all n values must be less than or equal %6.10f for kind=1.', ORDER_MAX);
elseif kind==2
    ORDER_MAX = 370030.762407380;
    assert(all(n(:) <= ORDER_MAX), 'all n values must be less than or equal %6.10f for kind=2.', ORDER_MAX);
end
%% Setup Arrays

% output size
nSize = size(n);
if nSize(end) ==1
    outputSize = [nSize(1:end-1) k];
else
    outputSize = [nSize k];
end
% number of orders for each kth root
nOrdersPerRoot = prod(outputSize(1:end-1));
x = nan(outputSize);

%% Solve for Roots
switch kind
    case 1
        % coefficients and exponent are from least squares fitting the k=1,
        % n=0:10000.
        coefficients1j = [0.411557013144507;0.999986723293410;0.698028985524484;1.06977507291468];
        exponent1j = [0.335300369843979,0.339671493811664];
        % guess for k = 1
        x((1:nOrdersPerRoot)') = coefficients1j(1) + coefficients1j(2)*n(:) + coefficients1j(3)*(n(:)+1).^(exponent1j(1)) + coefficients1j(4)*(n(:)+1).^(exponent1j(2));
        % find first zero
        x((1:nOrdersPerRoot)') = arrayfun(@(n, x0) findzero(n, 1, x0, kind), n(:), x((1:nOrdersPerRoot)'));
        
        if k >= 2
            % coefficients and exponent are from least squares fitting the k=2,
            % n=0:10000.
            coefficients2j = [1.93395115137444;1.00007656297072;-0.805720018377132;3.38764629174694];
            exponent2j = [0.456215294517928,0.388380341189200];
            % guess for k = 2
            x((nOrdersPerRoot+1:2*nOrdersPerRoot)') = coefficients2j(1) + coefficients2j(2)*n(:) + coefficients2j(3)*(n(:)+1).^(exponent2j(1)) + coefficients2j(4)*(n(:)+1).^(exponent2j(2));
            % find second zero
            x((nOrdersPerRoot+1:2*nOrdersPerRoot)') = arrayfun(@(n, x0) findzero(n, 2, x0, kind), n(:), x((nOrdersPerRoot+1:2*nOrdersPerRoot)'));
        end
        
        if k >= 3
            % coefficients and exponent are from least squares fitting the k=3,
            % n=0:10000.
            coefficients3j = [5.40770803992613;1.00093850589418;2.66926179799040;-0.174925559314932];
            exponent3j = [0.429702214054531,0.633480051735955];
            % guess for k = 3
            x((2*nOrdersPerRoot+1:3*nOrdersPerRoot)') = coefficients3j(1) + coefficients3j(2)*n(:) + coefficients3j(3)*(n(:)+1).^(exponent3j(1)) + coefficients3j(4)*(n(:)+1).^(exponent3j(2));
            % find second zero
            x((2*nOrdersPerRoot+1:3*nOrdersPerRoot)') = arrayfun(@(n, x0) findzero(n, 3, x0, kind), n(:), x((2*nOrdersPerRoot+1:3*nOrdersPerRoot)'));
        end
    case 2
        % coefficients and exponent are from least squares fitting the k=1,
        % n=0:10000.
        coefficients1y = [0.0795046982450635;0.999998378297752;0.890380645613825;0.0270604048106402];
        exponent1y = [0.335377217953294,0.308720059086699];
        % guess for k = 1
        x((1:nOrdersPerRoot)') = coefficients1y(1) + coefficients1y(2)*n(:) + coefficients1y(3)*(n(:)+1).^(exponent1y(1)) + coefficients1y(4)*(n(:)+1).^(exponent1y(2));
        % find first zero
        x((1:nOrdersPerRoot)') = arrayfun(@(n, x0) findzero(n, 1, x0, kind), n(:), x((1:nOrdersPerRoot)'));
        
        if k >= 2
            % coefficients and exponent are from least squares fitting the k=2,
            % n=0:10000.
            coefficients2y = [1.04502538172394;1.00002054874161;-0.437921325402985;2.70113114990400];
            exponent2y = [0.434823025111322,0.366245194174671];
            % guess for k = 2
            x((nOrdersPerRoot+1:2*nOrdersPerRoot)') = coefficients2y(1) + coefficients2y(2)*n(:) + coefficients2y(3)*(n(:)+1).^(exponent2y(1)) + coefficients2y(4)*(n(:)+1).^(exponent2y(2));
            % find second zero
            x((nOrdersPerRoot+1:2*nOrdersPerRoot)') = arrayfun(@(n, x0) findzero(n, 2, x0, kind), n(:), x((nOrdersPerRoot+1:2*nOrdersPerRoot)'));
        end
        
        if k >= 3
            % coefficients and exponent are from least squares fitting the k=3,
            % n=0:10000.
            coefficients3y = [3.72777931751914;1.00035294977757;2.68566718444899;-0.112980454967090];
            exponent3y = [0.398247585896959,0.604770035236606];
            % guess for k = 3
            x((2*nOrdersPerRoot+1:3*nOrdersPerRoot)') = coefficients3y(1) + coefficients3y(2)*n(:) + coefficients3y(3)*(n(:)+1).^(exponent3y(1)) + coefficients3y(4)*(n(:)+1).^(exponent3y(2));
            % find second zero
            x((2*nOrdersPerRoot+1:3*nOrdersPerRoot)') = arrayfun(@(n, x0) findzero(n, 3, x0, kind), n(:), x((2*nOrdersPerRoot+1:3*nOrdersPerRoot)'));
        end
    otherwise
        error('Code should never get here.');
end

if k >= 4
    for iRoot = 4:k
        % guesses for remaining roots x[k] = rootSpacing + x[k-1]
        x(((iRoot-1)*nOrdersPerRoot+1:iRoot*nOrdersPerRoot)') = 2*x(((iRoot-2)*nOrdersPerRoot+1:(iRoot-1)*nOrdersPerRoot)')- x(((iRoot-3)*nOrdersPerRoot+1:(iRoot-2)*nOrdersPerRoot)');
        % find the remaining zeros
        x(((iRoot-1)*nOrdersPerRoot+1:iRoot*nOrdersPerRoot)') = arrayfun(@(n, x0) findzero(n, k, x0, kind), n, x(((iRoot-1)*nOrdersPerRoot+1:iRoot*nOrdersPerRoot)'));
    end
end

end



function x=findzero(n,k,x0,kind)
% Uses Halley's method to find a zero given the starting point x0
% http://en.wikipedia.org/wiki/Halley's_method

ITERATIONS_MAX = 100;       % Maximum number of iteration
TOLERANCE_RELATIVE = 1e4;   % 16-4 = 12 significant digits

% Setup loop
error = 1;
loopCount = 0;
x = 1; % Initialization value only.  It is is not used.

% Begin loop
while abs(error)>eps(x)*TOLERANCE_RELATIVE && loopCount<ITERATIONS_MAX
    
    switch kind
        case 1
            a = besselj(n,x0);
            b = besselj((n+1),x0);
        case 2
            a = bessely(n,x0);
            b = bessely((n+1),x0);
    end
    
    xSquared = x0*x0;
    
    error = 2*a*x0*(n*a-b*x0)/(2*b*b*xSquared-a*b*x0*(4*n+1)+(n*(n+1)+xSquared)*a*a);
    
    % Prepare for next loop
    x=x0-error;
    x0=x;
    loopCount=loopCount+1;
    
end

% Handle maximum iterations
if loopCount>ITERATIONS_MAX-1
    warning('Failed to converge to within relative tolerance of %e for n=%f and k=%d in %d iterations', eps(x)*TOLERANCE_RELATIVE, n, k, ITERATIONS_MAX);
end

end

function js = sphbes(nu, x)
% returns the spherical Bessel functions jnu(x)
% x is a vector or it may be a matrix if nu is a scalar
% if nu is a row and x a column vector, the output js is a matrix

[nnu lnu] = size(nu);
[nx lx] = size(x);
xm = repmat(x, 1, lnu);
js = sqrt(pi ./(2* xm)) .* besselj(nu + 0.5, x);
end
