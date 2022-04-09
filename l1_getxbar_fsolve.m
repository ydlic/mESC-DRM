%%  get Xxbar, way 1 =  fsolve
clear, clc, format short; 

fgStep= repmat('*',1,56);  
fprintf('\n%s\n',fgStep ); 
fprintf('   Step 1:    Get all the equilibrium states   ');
fprintf('\n%s\n',fgStep ); 

%%
f_load ;     %% default parameters
f_ODExs      %% ODE parameters 
n = p ; 
L0

fprintf('\n   Working ......\n'); 
pause(2);
%% 
x = sym('x', [1,3]);  
dxdt = [  
  a*x(1)^n/(x(1)^n + s11^n) +  a*x(2)^n/(x(2)^n + s21^n) + b*s31^n/(x(3)^n + s31^n)  - r1*x(1)  + L0*x(1) ,
  a*x(2)^n/(x(2)^n + s22^n) + b*s32^n/(x(3)^n + s32^n) - r2*x(2)  ,
  a*x(2)^n/(x(2)^n + s23^n) + a*x(3)^n/(x(3)^n + s33^n) + b*s13^n/(x(1)^n + s13^n) - r3*x(3)  
  ] ; 
f_ODEv3 = matlabFunction(dxdt, 'Vars',{[x(1), x(2), x(3)]}); 

%% fsolve 
options = optimoptions('fsolve','MaxIterations',10^9, 'MaxFunctionEvaluations',10^9, ...
    'Algorithm' , 'levenberg-marquardt', 'Display','off')  ;   %  'final/off'
  
Xxbar=[] ;
range= 0:0.1:1.1 ;
for rx1=range 
    for rx2=range
        for rx3=range
            X0 = [rx1 rx2 rx3];  % Initial point 
            [x, fval, exitflag, output] = fsolve( f_ODEv3, X0, options) ;
            if exitflag ==1  % | exitflag >=2   
                Xxbar= [Xxbar; x] ;
                fval' ;
            end
        end
    end
end
Yuan_xbar = Xxbar'  ;  % bakeup
[mr,mc] = size(Xxbar);  N=mc; 
for i = mr:-1:1
    for j=1:mc 
        if Xxbar(i,j)<0 | Xxbar(i,j)>1.2  % range
            Xxbar(i,:)=[];
            break;
        end
    end
end
fprintf('\nPossible solutions  found \n'); 
Xxbar = roundn(Xxbar,-5) ;
Xxbar'  ; 
[mr,mc] = size(Xxbar)

% format long; 
Xxbar_es=unique(Xxbar,'rows')     % equilibrium states, also vip

format short; 
[zuNum_es ,~] =  size(Xxbar_es)   % for step 2 
fprintf('\n No. of representative es (xvip) = [ %d ] \n',zuNum_es); 
fprintf('%s\n\n ',fenge ); 

%% next step: l2
