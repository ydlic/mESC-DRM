function [ sigma, flag2,JxA ] = fsigma(N,h,x,va,tolsgm)
% find Moment2, sigma
    flag2 = 0;
    sigma= 100 * rand(N) ; % 
    ci = 10^7 ;    
    for cj=1: ci 
        [ff2, JxA ] = fforce2(x,sigma,N,va);             
        d2 = norm(ff2,'fro');
        if d2<tolsgm %  d_sigma/dt= 0 £¬ff2 = 0               
%             fprintf('     find sigma, at %d / %d ,err <= %f \n', cj, ci,d2); 
            flag2 = 1;
            break;
        else
            if cj==ci
                fprintf('    ---- sorry, no find sigma, end: %d \n', cj); 
                pause(0.5);
            end
        end
        sigma = sigma + h*ff2;  
    end
end