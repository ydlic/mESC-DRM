function [ Xstate, tzzA ] = fsLocalbyJxA(N,JxA)
% Judge the stability , by Jacobian matrix  

    lambda = eig(JxA);  % by real parts of eigenvalues   
    tzzA = lambda ; 
    flagS= 0; flagS0= 0;
    for tj=1:N
        if real(lambda(tj)) > 0
            Xstate = -1 ;
%             fprintf('    ---- sorry, the real part of %d-th eigenvalue >0,  unstable £¡£¡£¡\n \n' ,tj);
            break;
        else
            if real(lambda(tj)) < 0 
                flagS = flagS + 1;
            else   % ==0
                flagS0 = flagS0 + 1;
            end            
        end
    end
    if flagS == N
        Xstate = 1;
%         fprintf('    --- OK, stable, all real parts <0  £¡£¡£¡ \n\n' );            
    end
    if flagS0>0 & (flagS0+ flagS) == N
        Xstate = 0  ; % 
%         fprintf('\n    may be saddle point,  %d real parts = 0£¬other %d  real parts <0  £¡£¡£¡ \n' ,flagS0, flagS);     
    end    
end