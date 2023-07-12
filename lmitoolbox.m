A=[1.0224,1.2310;
    1.6062, -0.0224];
B=[1;
    2.5];
C=[1, 0;
    1, 2];
D=[1;
    0];
sys=ss(A,B,C,D);
K=place(A,B,pole(sys))
mu=.1;
A_=[A, zeros(2,1);
    zeros(1,2), eye(1,1)]
B_=[B;
    zeros(1)]
C_=[C, D]
M=[zeros(1,2);
    eye(size(A))]


setlmis([])
P1= lmivar(2,[3 3])
P3= lmivar(2,[1,1])
H=lmivar(2,[3,2])
gma=lmivar(2,[1,1])
B1=eye(size(B.'*B))-mu*B.'*B
B2= mu*B_.'*(eye(size(A_))-A_-mu*B_*B_.')
M2=[eye(size(B_.'*M))-mu*B_.'*M]
BC=C_+mu*C_*B_*B_.'
G=[zeros(size(M*P1)), M*P1, -M*C_*H]
lmiterm([1,1,1,P3],B2.',B2)
lmiterm([1,1,1,P1],-1,1)

lmiterm([1,1,2,P3],B2.',B1)

lmiterm([1,1,3,P3],B2.',M2)

lmiterm([1,1,4,P1],(A_+mu*B_*B_.').',1)
%lmiterm([1,1,4,-1], (C_*A_+mu*C_*B_*B_.').', H.')

lmiterm([1,1,5,0],BC.')

lmiterm([1,2,5,0],B_.'*C_.')

lmiterm([1,3,5,1],zeros(size(BC.')),1)
lmiterm([1,4,5,1],zeros(size(BC.')),1)
lmiterm([1,4,4,P1],-1,1)
lmiterm([1,5,5,0],-1)
lmiterm([1,2,2,P3], B1.',B1)
lmiterm([1,2,2,P3],-1,1)

lmiterm([1,2,3,P3],B1.',M2)

lmiterm([1,3,3,P3],M2.',M2)
lmiterm([1,3,3,gma],-1,1)
lmiterm([1,3,4,0],G.')



lmiterm([-1,1,1,P1],1)
lmiterm([-1,2,2,P3],1)
lmiterm([-1,1,2,1],zeros(size(P1)))