Plant=tf(1,[1,1],'InputDelay',.2)
Kc=6;
Ti=.4;
Td=.1;
b=.6;
c=.63;
C=pid(Kc,1/Ti,Td)
X=pid(Kc*b,0,c*Td)
num1=(C+X)*Plant/(1+C*Plant)
Kc1=4;
Ti1=.4;
Td1=.1;
b1=.6;
c1=.63;
C1=pid(Kc1,1/Ti1,Td1)
X1=pid(Kc1*b1,0,c1*Td1)
num2=(C1+X1)*Plant/(1+C1*Plant)
Kc2=2;
Ti2=.6;
Td2=.1;
b2=.6;
c2=.63;
C2=pid(Kc2,1/Ti2,Td2)
X2=pid(Kc2*b2,0,c2*Td2)
num3=(C2+X2)*Plant/(1+C2*Plant)
Kc3=2;
Ti3=.5;
Td3=.08;
b3=.7;
c3=.63;
C3=pid(Kc3,1/Ti3,Td3)
X3=pid(Kc3*b3,0,c3*Td3)
num4=(C3+X3)*Plant/(1+C3*Plant)
stepplot(num1)
hold on                                                                                                   
stepplot(num2)
hold on
stepplot(num3)
hold on
stepplot(num4)
hold on