% 加载数据（参数）
format compact ; % format loose

fenge=repmat('-',1,50);  
Nnodes={'Nanog','OS','G'}  
N=length(Nnodes)  ; %number of nodes

% diffusion matrix 
vars_dm = 0.02*ones(N,1) ; 
h=0.05;

tolerr = 10^(-6)   %  Tolerance for the error 
tolsgm = 10^(-6) %  Tolerance for sigma
%% ODE model parameters from f_ODExs.m
f_ODExs  
