clear all; close all; clc;

load A1
%  break
%%%%%%%%% betta_1 regime %%%%%%%%%

st=1;
fin=161;
sample=[st:fin];
% break
n=1024;
X=A1(sample,:)';
% X=abs(X);
m=3;

%compute the nonlinear part
beta=1.45; %mu
nu=0;
sigma=-0.1; %eps

for j=1:fin-st+1
    
    NL(:,j)=(i+beta)*(abs(X(:,j))).^2.*X(:,j)+...
        (i*nu+sigma)*(abs(X(:,j))).^4.*X(:,j);
    
end


[u,s,v]=svd(abs(NL),0);

% 
% figure(1)
% plot(cumsum(diag(s2)/sum(diag(s2))), 'ko')
% break

[ro,g(1)]=max(abs(u(:,1)));
U=[u(:,1)]; 
z=zeros(n,1);
P=z; P(g(1))=1;

for l=2:m
    c=(P'*U)\(P'*u(:,l));
    r=u(:,l)-U*c;
    [ro,g(l)]=max(abs(r));
    U=[U,u(:,l)]; 
    P=[P,z]; P(g(l),l)=1;
   
end


abs(513-g)
