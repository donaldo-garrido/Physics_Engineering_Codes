%function [ E, Kx, Ky, nx, ny ] = bloch2Dsymm( N, v, p1, p2, iter )
%BLOCH2DSYMM Bloch condition applies to the 2D periodic well
%   High symmetry points case
%   N  = number of basis states in 1D (total matrix size is N+1 x N+1)
%   v  = depth of well, should be negative
%   p1 = start of the well in units of a
%   p2 = end   of the well in units of a
%   iter = number of points in K-space to sample from
%   E  = eigenvalues of resultant matrix diagonalizations
%   Kx, Ky = array of points along K_x, K_y axis
%   nx, ny = quantum numbers of plane-wave basis states
%   To adjust output plot, change value of Yupper on line 109

N = 12; v = -1; p1 = 0.25; p2 = 0.75; iter = 200; 

E = zeros((iter+1),(iter+1),(N+1)*(N+1));

% Compute matrix elements for Ka = 0
%h = periodicwell2d (N, v, p1, p2);
h = muffinPotential (N, v, p1, p2);

% Converts {1,2,3,4,...} -> {0,1,-1,2,-2,...}
j = 1:N+1;
a = (1 + (2*j - 1).*(-1).^j)./4;

% Naive encoding, using meshgrid to generate pairwise combinations
[p,q] = meshgrid(a,a);
n     = [p(:) q(:)];
nx = n(:,1); ny = n(:,2);

% Increasing energy encoding
n2 = zeros((N+1)*(N+1),1);
n  = [n2,n];
% Appending n^2 column to sort by
n(:,1) = n(:,2).*n(:,2) + n(:,3).*n(:,3);
% Sorting by n^2 to give increasing energy encoding
[T,I] = sort(n(:,1));
n     = n(I,:);
nx    = n(:,2); ny = n(:,3); n2 = n(:,1);
%====================================================================
% Rectangular K-space values
Kx = 0:(pi/(iter)):pi;
Ky = 0:(pi/(iter)):pi;

% Matrix indexing parameter
m = 1:(N+1)*(N+1);

% Add Bloch elements to diagonal, \Gamma -> X'
for i = 1:iter+1
        bloch = (4/pi) * (nx(m)*Kx(1) + ny(m)*Ky(i)) + ...
                (Kx(1)*Kx(1) + Ky(i)*Ky(i))/(pi*pi);
            
        [c, Ebloch] = eig (h + diag(bloch));
        Ebloch = diag(Ebloch);
        E(1,i,:) = Ebloch;
end

% Add Bloch elements to diagonal, X' -> M
for i = 1:iter+1
        bloch = (4/pi) * (nx(m)*Kx(i) + ny(m)*Ky(iter+1)) + ...
                (Kx(i)*Kx(i) + Ky(iter+1)*Ky(iter+1))/(pi*pi);
            
        [c, Ebloch] = eig (h + diag(bloch));
        Ebloch = diag(Ebloch);
        E(i,iter+1,:) = Ebloch;
end

% Add Bloch elements to diagonal, M -> \Gamma
for i = iter+1:-1:1
        bloch = (4/pi) * (nx(m)*Kx(i) + ny(m)*Ky(i)) + ...
                (Kx(i)*Kx(i) + Ky(i)*Ky(i))/(pi*pi);
            
        [c, Ebloch] = eig (h + diag(bloch));
        Ebloch = diag(Ebloch);
        E(i,i,:) = Ebloch;
end

% Energies for plotting
Esymm = zeros(3*iter+1,(N+1)*(N+1));
K = 0:1/(3*iter):1;

% Diagonal path M -> \Gamma needs a sqrt(2) scaling factor
K1 = K(1:1+2*iter);
K2 = K(2+2*iter:end);
K = horzcat (K1, K2 + sqrt(2)*0.3333*(K2 - 0.66667));

% Filling in 1D Esymm array
for i = 1:iter+1
    Esymm(i,:) = E(1,i,:);
    Esymm(i+iter,:) = E(i,iter+1,:);
    Esymm(i+2*iter,:) = E(iter+2-i,iter+2-i,:);
end
figure(4)
% Plotting
plot(K, Esymm(:,1), 'b.', 'MarkerSize', 12); hold on;
plot(K, Esymm(:,2), 'r.', 'MarkerSize', 12);
plot(K, Esymm(:,3), 'g.', 'MarkerSize', 12); 
plot(K, Esymm(:,4), 'm.', 'MarkerSize', 12);
plot(K, Esymm(:,5), '.',  'Color', [1 .5 .2], 'MarkerSize', 12);
plot(K, Esymm(:,6), 'b.', 'MarkerSize', 12);
plot(K, Esymm(:,7), 'g.', 'MarkerSize', 12);
plot(K, Esymm(:,8), 'r.', 'MarkerSize', 12);
plot(K, Esymm(:,9), 'm.', 'MarkerSize', 12); hold off;


%======================================================0
% Plotting options
NumTicksX = 0;
LX = get(gca,'XLim');
set(gca,'XTick',linspace(LX(1),LX(2),NumTicksX))
set(gca,'XLim', [0 K(end)]);

% Limits on the y-axis window
Yupper = 6; % Width of vertical axis in units of E_ISW
set(gca,'YLim', [floor(Esymm(1,1)) floor(Esymm(1,1))+Yupper]);
LY = get(gca,'YLim');
set(gca,'YTick',linspace(LY(1),LY(2),Yupper))
y = get(gca, 'YTick');
set(gca,'yticklabel', sprintf('%.1f |',y'));

set(gca,'FontSize', 14);
ylabel('E/E_{ISW}', 'FontSize', 18);

% Vertical dashed lines
hy1 = graph2d.constantline(0.3333, 'LineStyle',':', 'LineWidth', 3, 'Color',[.7 .7 .7]);
changedependvar(hy1,'x');

hy2 = graph2d.constantline(0.6667, 'LineStyle',':', 'LineWidth', 3, 'Color',[.7 .7 .7]);
changedependvar(hy2,'x');

% Need to hardcode in x-axis labels because of Greek symbol use
text(-0.01,       floor(Esymm(1,1))-0.25,'\Gamma','FontSize', 18);
text(0.32,        floor(Esymm(1,1))-0.25,'X''',   'FontSize', 18);
text(0.65,        floor(Esymm(1,1))-0.25,'M',     'FontSize', 18);
text(K(end)-0.01, floor(Esymm(1,1))-0.25,'\Gamma','FontSize', 18);

%end

