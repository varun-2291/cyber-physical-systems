function [gamma,K]=GetGamma2(A,C)
n=size(A,1); m=size(C,1); setlmis([]);
P=lmivar(1,[n 1]); L=lmivar(2,[n m]); X=lmivar(1,[n 1]);
Y=lmivar(1,[n 1]); Beta=lmivar(1,[1 1]);
lmiterm([-1 1 1 P],1,1); lmiterm([-2 1 1 Beta],1,1);
lmiterm([-3 1 1 Beta],1,1);lmiterm([-3 2 2 Beta],1,1);
lmiterm([-3 2 1 P],1,1);
lmiterm([-4 1 1 X],1,1); lmiterm([-4 2 2 0],1);
lmiterm([-4 2 1 P],1,A); lmiterm([-4 2 1 L],-1,C);
lmiterm([5 1 1 P],-1,1); lmiterm([5 2 2 P],-1,1);
lmiterm([5 2 1 P],-1,A); lmiterm([5 2 1 L],1,C);
lmiterm([5 1 1 Y],-1,1); lmiterm([5 1 1 X],1,1);
lmiterm([6 1 1 Y],1,1); lmiterm([-6 1 1 Beta],1,1);
lmiterm([-6 1 1 0],1);
LMIss=getlmis;
[lambda, popt]=gevp(LMIss,1);
if lambda>0 error('The problem cannot be solved'); end;
gamma=sqrt(-lambda)
P=dec2mat(LMIss,popt,P)
L=dec2mat(LMIss,popt,L)
K=inv(P)*L