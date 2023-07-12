A=[1.0224,1.2310;
    1.6062, -0.0224];
B=[1;
    2.5];
C=[1, 0;
    1, 2];
D=[1;
    0];
I=[1,0;
    0,1];
sys=ss(A,B,C,D);
K=place(A,B,pole(sys))
mu=.1;
A_=[A, zeros(size(A));
    zeros(size(A)), I];
B_=[B;
    zeros(size(B))];
C_=[C, D]
M=[zeros(size(A));
    I];
%F=eye(size(B_.'))-mu*B_.'*B_
%G=-mu*B_.'*B_
%H=mu*B_.'*(eye(size(A_))-A_-mu*B_*B_.')
%S=[G, H]
%P=mu*B_.'
%sys2=ss(F,S,eye(size(A_)),[zeros(size(P)), P])


