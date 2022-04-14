%% Demo.m  for mESC-DRM 
%% C. Li et al.  
l1_getxbar_fsolve     % Step 1:  Get all equilibrium states 

if zuNum_es > 0 
    l2_getXXvip       % Step 2:  equilibrium state (es) --> stable state (ss)
    
    l3_landscape      % Step 3:  Landsacpe / potential function visualization 
    
else
    fprintf(' *** PROGRAM TERMINATED ***  There is no equilibrium state.\n\n') ;
end
