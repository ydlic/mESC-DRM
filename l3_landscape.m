%% landsacpe 
% clc
clear; 
format short;

fgStep= repmat('*',1,56);  
fprintf('\n%s\n',fgStep ); 
fprintf('   Step 3:  The landsacpe with all stable states   ');
fprintf('\n%s\n',fgStep ); 

%%
f_load ; %% 
f_ODExs   %% 
a_x_sgm = sprintf( 'XbarSgm\\L0_%s-Xbar_sigma.mat',num2str(L0) ) ; 
load(a_x_sgm) ; 

Highbs = 25; Highmax = 450;   % enhancement factor  
tiled =1  ;  % create figures in tiled positions

%%    XXvip  :  stable states 
XXvip 
if zuNum==1 %%%
    Xxnor = XXvip;  Xxnor = Xxnor./max(Xxnor)     
    tiled = 0 ;
else
    Xxnor = fNor(XXvip)    %%    
end      
% SS = Xxnor';  %%% normalized Stable State 

%%  %%%%%%%%%
vslun = [ 1 3; 1 2; 2 3] ;
for tu= 1: 3 
    fprintf('\n ----------- Landscape : %d  vs  %d  ----------- \n', vslun(tu,1),vslun(tu,2)   );
    pause(0.9)  ;     
    
    twonodes = vslun(tu,:) ;  % input( info );    
    gx1=twonodes(1) ;  % gene x1
    gx2=twonodes(2) ; 
    sw = sizevip  ;   % weight      
    sw = sw/sum(sw)   ;

    positionvip = Xxnor(:,[gx1,gx2]) 
    Xbarnor = fNor(xbarAll)  ; % include unstable points
      
    [z1,z2]=meshgrid(0:0.01:1.2); 
    z3=0;
    for k = 1 : zuNum  % Gaussian distributions
        Pk = sw(k).*fGd(z1,Xxnor(k,gx1),vipSgm(gx1,gx1,k)).*fGd(z2,Xxnor(k,gx2),vipSgm(gx2,gx2,k)); 
        z3 = z3 + Pk;    
    end
    z3U= min(-Highbs*log(z3),Highmax) ;

    figname = sprintf( 'gx1<%s>  vs  gx2<%s> ',Nnodes{1,gx1},Nnodes{1,gx2});     
    if tiled ==1  %  
        if tu==1
            figure('name','three in 1', 'position',[400,300,1000,330]);
        end
        subplot(1,3,tu);   %  tiled  
    else
        figure('name',figname, 'position',[400,150,550,500]);
    end

    surf(z1,z2,z3U) 
    colormap(jet) %hot
    shading interp

    xlabel(Nnodes{1,gx1})  % 'x1'
    ylabel(Nnodes{1,gx2})  % 'x2'
    zlabel('U') 
    figtitle = sprintf( ' gx1<%s>  vs  gx2<%s>   ( L0 = %s )',Nnodes{1,gx1},Nnodes{1,gx2},num2str(L0) ) ;
    title(figtitle); 

    hold on;
    pause(0.9);
    
%     view(2) ; 
    view([-30 63]) ;     

end 
fprintf(' ---------------------------------------------- \n'); 

%%
fprintf('\n<<<Hint>>>  Any key to close all Figs ! \n\n');
pause ;
close all ;
format short;
