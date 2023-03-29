close all

m = 1;

PhiR = 36.5e-4;
PhiTI = 24.5e-4;
PhiTO = 9.82e-4;

C1= [PhiR 0 0; 0 PhiTI 0; 0 0 PhiTO];
C2=1/4*[PhiR+3*PhiTI sqrt(3)*(PhiTI-PhiR) 0; sqrt(3)*(PhiTI-PhiR) 3*PhiR+PhiTI 0; 0 0 4*PhiTO];
C3=1/4*[PhiR+3*PhiTI sqrt(3)*(PhiR-PhiTI) 0; sqrt(3)*(PhiR-PhiTI) 3*PhiR+PhiTI 0; 0 0 4*PhiTO];

a = 2.46e-10;
a1 = a*[sqrt(3)/2,1/2];
a2 = a*[sqrt(3)/2,-1/2];



G = 0;
M = 2*pi/(sqrt(3)*a);
K = 4*pi/(3*a);

% k_G2M = linspace(G,M,1000);
% v1 = 2*pi/a*[1/sqrt(3);1];
% v1_unit = v1/norm(v1);
% 
% k_M2K = linspace(G,M*tan(pi/6),1000);
% v2_unit = mRotation(pi/2)*(v1_unit);
% 
% 
% k_K2G = linspace(G,M/cos(pi/6),1000);
% v3_unit = mRotation(2*pi/3)*v2_unit;
% 
% %plot(real(SectionK(k_G2M,v1_unit,zeros(2,1))))
kx = linspace(0,M,1000);
ky = linspace(0,K,1000);
hBar = 1;
k = sqrt(kx.^2+ky.^2);

DispRel1 = real(491/50.*exp(-((82*1i.*k)/25)).*(3.*exp((82*1i.*k)/25)-sqrt(2.*exp((41*1i.*k)/10)+5.*exp((164*1i.*k)/25)+2.*exp((451*1i.*k)/50))));
DispRel2 = real(491/50.*exp(-((82*1i.*k)/25)).*(3.*exp((82*1i*k)/25)+sqrt(2.*exp((41*1i*k)/10)+5.*exp((164*1i*k)/25)+2.*exp((451*1i*k)/50))));
DispRel3 = real(1/2.*exp(-((82*1i*k)/25)).*(183.*exp((82*1i*k)/25)-sqrt(6566.*exp((41*1i*k)/10)+20357.*exp((164*1i*k)/25)+6566.*exp((451*1i*k)/50))));
DispRel4 = real(1/2.*exp(-((82*1i*k)/25)).*(183.*exp((82*1i*k)/25)+sqrt(6566.*exp((41*1i*k)/10)+20357.*exp((164*1i*k)/25)+6566.*exp((451*1i*k)/50))));
DispRel5 = real(1/2.*exp(-((82*1i*k)/25)).*(183.*exp((82*1i*k)/25)-sqrt(8030.*exp((41*1i*k)/10)+17429.*exp((164*1i*k)/25)+8030.*exp((451*1i*k)/50))));
DispRel6 = real(1/2.*exp(-((82*1i*k)/25)).*(183.*exp((82*1i*k)/25)+sqrt(8030.*exp((41*1i*k)/10)+17429.*exp((164*1i*k)/25)+8030.*exp((451*1i*k)/50))));

val = [DispRel1; DispRel2; DispRel3; DispRel4; DispRel5; DispRel6];

func = hBar*val(5,:)./(exp(hBar*val(5,:))-1);
plot(k,func)

% function [DispRel2PLot] = SectionK(k_,v_unit,v_0)
%     DispRel2Plot = zeros(length(k_),6);
%     for ii=1:length(k_)
%         k_direction = k_(ii)*v_unit+v_0;
%         wp = diag(omegaP(k_direction));
%         wm = diag(omegaM(k_direction));
%         DispRel2PLot(ii,1:3) = wp;
%         DispRel2PLot(ii,4:6) = wm;
%     end
% end
% 
% 
% function [val] = DispRelation(k)
%     DispRel1 = 491/50.*exp(-((82*1i.*k)/25)).*(3.*exp((82*1i.*k)/25)-sqrt(2.*exp((41*1i.*k)/10)+5.*exp((164*1i.*k)/25)+2.*exp((451*1i.*k)/50)));
%     DispRel2 = 491/50.*exp(-((82*1i*k)/25)).*(3.*exp((82*1i*k)/25)+sqrt(2.*exp((41*1i*k)/10)+5.*exp((164*1i*k)/25)+2.*exp((451*1i*k)/50)));
%     DispRel3 = 1/2.*exp(-((82*1i*k)/25)).*(183.*exp((82*1i*k)/25)-sqrt(6566.*exp((41*1i*k)/10)+20357.*exp((164*1i*k)/25)+6566.*exp((451*1i*k)/50)));
%     DispRel4 = 1/2.*exp(-((82*1i*k)/25)).*(183.*exp((82*1i*k)/25)+sqrt(6566.*exp((41*1i*k)/10)+20357.*exp((164*1i*k)/25)+6566.*exp((451*1i*k)/50)));
%     DispRel5 = 1/2.*exp(-((82*1i*k)/25)).*(183.*exp((82*1i*k)/25)-sqrt(8030.*exp((41*1i*k)/10)+17429.*exp((164*1i*k)/25)+8030.*exp((451*1i*k)/50)));
%     DispRel6 = 1/2.*exp(-((82*1i*k)/25)).*(183.*exp((82*1i*k)/25)+sqrt(8030.*exp((41*1i*k)/10)+17429.*exp((164*1i*k)/25)+8030.*exp((451*1i*k)/50)));
%     
%     val = [DispRel1 DispRel2 DispRel3 DispRel4 DispRel5 DispRel6];
% end
% 
% function [WP] = omegaP(k)
% m = 1;
% PhiR = 36.5e-4;
% PhiTI = 24.5e-4;
% PhiTO = 9.82e-4;
% 
% C1= [PhiR 0 0; 0 PhiTI 0; 0 0 PhiTO];
% C2=1/4*[PhiR+3*PhiTI sqrt(3)*(PhiTI-PhiR) 0; sqrt(3)*(PhiTI-PhiR) 3*PhiR+PhiTI 0; 0 0 4*PhiTO];
% C3=1/4*[PhiR+3*PhiTI sqrt(3)*(PhiR-PhiTI) 0; sqrt(3)*(PhiR-PhiTI) 3*PhiR+PhiTI 0; 0 0 4*PhiTO];
% 
% a = 2.46;
% a1 = a*[sqrt(3)/2,1/2];
% a2 = a*[sqrt(3)/2,-1/2];
%     WP = sqrt(C1+C2+C3+sqrt(C1+C2*exp(-1i*m*dot(k,a2))+C3*exp(-1i*m*dot(k,a1))*(C1+C2*exp(1i*m*dot(k,a2))+C3*exp(1i*m*dot(k,a1)))));
% end
% 
% function [WM] = omegaM(k)
% m = 1;
% PhiR = 36.5e-4;
% PhiTI = 24.5e-4;
% PhiTO = 9.82e-4;
% 
% C1= [PhiR 0 0; 0 PhiTI 0; 0 0 PhiTO];
% C2=1/4*[PhiR+3*PhiTI sqrt(3)*(PhiTI-PhiR) 0; sqrt(3)*(PhiTI-PhiR) 3*PhiR+PhiTI 0; 0 0 4*PhiTO];
% C3=1/4*[PhiR+3*PhiTI sqrt(3)*(PhiR-PhiTI) 0; sqrt(3)*(PhiR-PhiTI) 3*PhiR+PhiTI 0; 0 0 4*PhiTO];
% 
% a = 2.46;
% a1 = a*[sqrt(3)/2,1/2];
% a2 = a*[sqrt(3)/2,-1/2];
%     WM = sqrt(C1+C2+C3-sqrt(C1+C2*exp(-1i*m*dot(k,a2))+C3*exp(-1i*m*dot(k,a1))*(C1+C2*exp(1i*m*dot(k,a2))+C3*exp(1i*m*dot(k,a1)))));
% end
% 
% 
% function [matrix] = mRotation(theta)
%     matrix = [cos(theta) -sin(theta); sin(theta) cos(theta)];
% end