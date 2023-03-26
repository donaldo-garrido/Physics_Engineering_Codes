Zpot1 = [-42.5,-39.2,-36,-32.7,-29.4,-26.1,-22.8,-19.5,-16.2,-12.9]
Zpot2 = [-44.5,-41.3,-38,-34.7,-31.4,-28.1,-24.8,-21.5]
Zpot3 = [-44.1,-40.8,-37.5,-34.2,-30.9,-27.6,-24.3,-21.1,-17.8,-14.5]

counts1 = [0,7375,83252,289760,416978,279373,127820,56189,1111,0]
counts2 = [0,33706,150335,341546,404378,217950,41415,0]
counts3 = [0,9645,63477,194174,334105,295949,147507,58925,16074,0]

#electrophoretic mobility UE
T1 = 0
T2 = 0
T3 = 0
for i in range(len(counts1)):
	T1 = T1+counts1[i]
for i in range(len(counts2)):
	T2 = T2+counts2[i]
for i in range(len(counts3)):
	T3 = T3+counts3[i]

tCounts1 = []
tCounts2 = []
tCounts3 = []
for i in range(len(counts1)):
	tCounts1.append(counts1[i]/T1)
for i in range(len(counts2)):
	tCounts2.append(counts2[i]/T2)
for i in range(len(counts3)):
	tCounts3.append(counts3[i]/T3)

med1 = []
med2 = []
med3 = []

for i in range(len(tCounts1)):
	med1.append(tCounts1[i]*Zpot1[i])
for i in range(len(tCounts2)):
	med2.append(tCounts2[i]*Zpot2[i])
for i in range(len(tCounts3)):
	med3.append(tCounts3[i]*Zpot3[i])

pondZ1 = 0
pondZ2 = 0
pondZ3 = 0

for i in range(len(med1)):
	pondZ1 = pondZ1 + med1[i]
for i in range(len(med2)):
	pondZ2 = pondZ2 + med2[i]
for i in range(len(med3)):
	pondZ3 = pondZ3 + med3[i]
print(pondZ1, pondZ2, pondZ3)
totPondZ = pondZ1*10/28+pondZ2*8/28+pondZ3*10/28
print(totPondZ)

DieConst = 78.5
FH = 1.5
Vis = 0.001
EuTot = 2*DieConst*totPondZ*FH/(3*Vis)
print(EuTot)

a = 10e-9
kappa = 4*(FH -1)**(1/2)/a
print('kappa = '+str(kappa))

e = -1.602e-19
kB = 1.38e-23
T = 298.15
I = kappa**2*DieConst*kB*T/(e**2)
print('I = ', str(I))