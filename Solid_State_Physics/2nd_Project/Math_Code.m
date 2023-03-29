     
PhiR = 36.5*10^4

PhiTI = 24.5*10^4

PhiTO = 9.82*10^4

C1 = {{PhiR, 0, 0}, {0, PhiTI, 0}, {0, 0, PhiTO}}

C2 = 1/4*{{PhiR + 3*PhiTI, Sqrt[3]*(PhiTI - PhiR), 
     0}, {Sqrt[3]*(PhiTI - PhiR), 3*PhiR + PhiTI, 0}, {0, 0, 
     4*PhiTO}}     
     
C3 = 1/4 {{PhiR + 3*PhiTI, Sqrt[3]*(PhiR - PhiTI), 
     0}, {Sqrt[3]*(PhiR - PhiTI), 3*PhiR + PhiTI, 0}, {0, 0, 
     4*PhiTO}}
     
mOmega = m*w^2*ConstantArray[1, {3, 3}]
     
a1 = a*{Sqrt[3]/2, 1/2};
a2 = a*{Sqrt[3]/2, -1/2};
k = {kx, ky};
i = Sqrt[-1];
D11 = -mOmega + C1 + C2 + C3


Dmatrix = {{-mOmega + C1 + C2 + C3, -Exp[i/3* Dot[k, (a1 + a2)]]*(C1 + 
      C2*Exp[-i*Dot[k, a2]] + 
      C3*Exp[-i*Dot[k*a1]])}, {-Exp[-i/3* Dot[k, (a1 + a2)]]*(C1 + 
      C2*Exp[i*Dot[k, a2]] + C3*Exp[i*Dot[k*a1]]), -mOmega + C1 + C2 +
     C3}}
     
