% ODE parameters  
L0 = 0.0    ;      %   [0,1)  
p = 5; 

% 11 parameters 
xuanMean = [ 0.489 , 0.522 , 0.193 , 0.350 , 0.486 , 0.824 , 0.694 , 0.660 , 0.824 , 0.680 , 0.944 ];
par = xuanMean ; 
a=par(1);
b=par(2);    
s11=par(3); s21=par(6);  s31=par(7);  
s22=par(4); s32=par(8);  % s12=0;
s33=par(5); s23=par(9);  s13 =par(10); 
r1= par(11);  

r = 1;  r2=r; r3=r; 
