% ODEs, force1
function f = fforce1(x)
x1=x(1);   x2=x(2);  x3=x(3);  

% ODE model parameters from f_ODExs.m
f_ODExs

%% ODEs    
f1 =  a*x1^p/(x1^p + s11^p) +  a*x2^p/(x2^p + s21^p) + b*s31^p/(x3^p + s31^p)  - r1*x1 + L0*x1 ;
f2 =  a*x2^p/(x2^p + s22^p) + b*s32^p/(x3^p + s32^p) - r2*x2  ;
f3 =  a*x2^p/(x2^p + s23^p) + a*x3^p/(x3^p + s33^p) + b*s13^p/(x1^p + s13^p) - r3*x3  ;

f=[f1,f2,f3 ]'; 
end
