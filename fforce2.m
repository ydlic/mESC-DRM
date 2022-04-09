function [ fME,JxA ] = fforce2(x,sigma,N,va)
% fME,  force of Moment Equation

D= 0.02 * eye(N);

A= fJpds(x);  
B=sigma*A';
C=A*sigma;
fME=B+C+D;
JxA= A; % Jacobian matrix  J(x)
end