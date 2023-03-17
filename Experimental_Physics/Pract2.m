%% Bessel

n=100;
a=0;
b=2*pi;
m=2;
R=2;

[X,W]=gauleg(a,b,n);

I=0;
for k=1:length(X)
    I=I+W(k)*exp(1i*m*X(k)+1i*R*cos(X(k)));
end

Jexp=1i^(-m)/(2*pi)*I;
J=besselj(m,R);

display(Jexp)
display(J)

%% Gráfica J1(2x)

n=100;
a=0;
b=2*pi;
m=1;
x=linspace(-10,10,1000);
R=2*x;

[X,W]=gauleg(a,b,n);
I=0;
for k=1:length(X)
    I=I+W(k)*exp(1i*m*X(k)+1i*R*cos(X(k)));
end
Jexp=1i^(-m)/(2*pi)*I;

plot(x,real(Jexp)),title('J_{1}(2x)')

%% Resonador Óptico

theta=12.22e-3;
k0=2*pi/(10.6e-6);
a=0.01;
L=0.4092;
R=10*L;
b=0;
m=2;
n=200;

[x,w]=gauleg(0,2*pi,n);
[r,W]=gauleg(b,a,n);

M1=[1 L; 0 1];
M2=[1 0; -2/R 1];

%Axicon
M=M1*M2*M1;
A1=M(1,1);
B1=M(1,2);
C1=M(2,1);
D1=M(2,2);

H=zeros(n);
for c=1:n
    for k=1:n
        I=0;
        X=k0*r(c)*r(k)/B1;
        for t=1:n
            I=I+w(t)*exp(1i*m*x(t)+1i*X*cos(x(t)));
        end
        J=real(1i^(-m)/(2*pi)*I);
        H(c,k)=(-1i)^(m+1)*k0/B1*J*exp(1i*k0/(2*B1)*(A1*r(c)^2+D1*r(k)^2))*r(c);
        H(c,k)=H(c,k)*exp(-1i*2*k0*theta*r(c));
    end
end
Wmat=zeros(n);
for c=1:n
    Wmat(c,c)=W(c);
end

K=H*Wmat;
[V,D]=eig(K);

vecD=zeros(1,n);
for k=1:n
    vecD(k)=abs(D(k,k));
end
[~,ind]=sort(vecD,'descend');
for k=1:n
    vecD(k)=D(ind(k),ind(k));
end

eigf1=abs(V(:,ind(1)));
eigf2=abs(V(:,ind(2)));
eigf3=abs(V(:,ind(3)));
eigf4=abs(V(:,ind(4)));
figure(1)
plot(r,eigf1),title(['eigVal=',num2str(vecD(1))])
figure(2)
plot(r,eigf2),title(['eigVal=',num2str(vecD(2))])
figure(3)
plot(r,eigf3),title(['eigVal=',num2str(vecD(3))])

%Lente convergente
A2=M1(1,1);
B2=M1(1,2);
C2=M1(2,1);
D2=M1(2,2);
H2=zeros(n);
for c=1:n
    for k=1:n
        I=0;
        X=k0*r(c)*r(k)/B2;
        for t=1:n
            I=I+w(t)*exp(1i*m*x(t)+1i*X*cos(x(t)));
        end
        J=real(1i^(-m)/(2*pi)*I);
        H2(c,k)=(-1i)^(m+1)*k0/B2*J*exp(1i*k0/(2*B2)*(A2*r(c)^2+D2*r(k)^2))*r(c);
        H2(c,k)=H2(c,k)*exp(-1i*2*k0*theta*r(c));
    end
end

U1=abs(H2*V(:,ind(1)));
U2=abs(H2*V(:,ind(2)));
U3=abs(H2*V(:,ind(3)));

[V,Dlente]=eig(H2*Wmat);

figure(4)
plot(r,U1),title(['eigVal=',num2str(Dlente(1,1))])
figure(5)
plot(r,U2),title(['eigVal=',num2str(Dlente(2,2))])
figure(6)
plot(r,U3),title(['eigVal=',num2str(Dlente(3,3))])

figure(7)
subplot(1,3,1)
plot(r,eigf1),title(['eigVal=',num2str(vecD(1))])
subplot(1,3,2)
plot(r,eigf2),title(['eigVal=',num2str(vecD(2))])
subplot(1,3,3)
plot(r,eigf3),title(['eigVal=',num2str(vecD(3))])

figure(8)
subplot(1,3,1)
plot(r,U1),title(['eigVal=',num2str(Dlente(1,1))])
subplot(1,3,2)
plot(r,U2),title(['eigVal=',num2str(Dlente(2,2))])
subplot(1,3,3)
plot(r,U3),title(['eigVal=',num2str(Dlente(3,3))])