function gF = fJpds(x)
%  
x1=x(1);  x2=x(2);  x3=x(3); 
f_ODExs 

%% gF1,   f1, x1 x2 x3   
gF1 = [  
 L0 - r1 + (a*p*x1^(p - 1))/(s11^p + x1^p) - (a*p*x1^p*x1^(p - 1))/(s11^p + x1^p)^2
          (a*p*x2^(p - 1))/(s21^p + x2^p) - (a*p*x2^p*x2^(p - 1))/(s21^p + x2^p)^2
                                          -(b*p*s31^p*x3^(p - 1))/(s31^p + x3^p)^2                                     
];

gF2 = [ 
                                                                            0
 (a*p*x2^(p - 1))/(s22^p + x2^p) - r2 - (a*p*x2^p*x2^(p - 1))/(s22^p + x2^p)^2
                                     -(b*p*s32^p*x3^(p - 1))/(s32^p + x3^p)^2
];

gF3 = [
                                     -(b*p*s13^p*x1^(p - 1))/(s13^p + x1^p)^2
     (a*p*x2^(p - 1))/(s23^p + x2^p) - (a*p*x2^p*x2^(p - 1))/(s23^p + x2^p)^2
 (a*p*x3^(p - 1))/(s33^p + x3^p) - r3 - (a*p*x3^p*x3^(p - 1))/(s33^p + x3^p)^2
];

gF = [ gF1'; gF2'; gF3'];
end