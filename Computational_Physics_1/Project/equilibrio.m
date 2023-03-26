MH2 = -137000;
MI2 = -204000;
MHI = -185000;
RT = 8314;
chunche = [0 0.2 0.4 0.6 0.8 1];
for i=1:6
    G(i) = (1-chunche(i))*MH2 + (1-chunche(i))*RT*log((1-chunche(i))/2) + (1-chunche(i))*MI2 + (1-chunche(i))*RT*log((1-chunche(i))/2)+(2*chunche(i))*MHI+(2*chunche(i))*RT*log(chunche(i))
end
%disp(G)
chunche(1)
chunche(6)