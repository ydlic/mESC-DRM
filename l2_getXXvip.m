%% Xxbar has been obtained by fsolve. 
% Get the  equilibrium points (representative) , 
% Judge the stability of all equilibrium states (find stable equilibrium states)

fgStep= repmat('*',1,56);  
fprintf('\n%s\n',fgStep ); 
fprintf('   Step 2: equilibrium state(es) --> stable state(ss)   ');
fprintf('\n%s\n',fgStep ); 

%%
f_load ;   
f_ODExs   %%

%%
XXvip=[];
% zuNum = input('Please input the approximate number of the representative equilibrium states =   ') ;  
zuNum = zuNum_es ;  %  3   %   
XXn = Xxbar;
fprintf('\n The representative equilibrium states: \n ');  

[XXid,XXvip,~,XXdist,vipIdx] = kmedoids(XXn,zuNum ); %%  
XXvip  
sizevip = zeros(1,zuNum);  % size, that is weight
for k=1:zuNum
    sizevip(k) = length(find(XXid==k)) ;
end 
sizevip

xbarAll = XXvip ;
Otherxbar = [];
fprintf('\n--------- Stability Analysis --------- \n');
pause(0.5) ; %
%% Judge the stability of all equilibrium states
% check x of xbarAll
chk= 1;
if chk ==1
    [mr,mc] = size(xbarAll);  N=mc;
    idxS123 = zeros(1,mr) ;
    for j=mr:-1:1 
        j ;
        x=xbarAll(j,:) ;
        ff1= fforce1(x);        %%
        d1 = norm(ff1)  ;     
        JxA= fJpds(x);         %%
        [ sIndex_1A, tzzA ] = fsLocalbyJxA(N,JxA) ;   %%
        idxS123(1,j)=sIndex_1A;
        if sIndex_1A ~=1 
            Otherxbar= [x; Otherxbar];
            XXvip(j,:)=[];  
            sizevip(j)=[];
        end
    end
end
idxS123  % three kinds of equilibrium states
XXvip
sizevip
Otherxbar
[zuNum,~] = size(XXvip);    
Num_uss = sum( idxS123(:)==-1 ) ;
fprintf('\nSo,  [ %d ] unstable and [ %d ] stable states \n', Num_uss, zuNum);

%% XXvip  , find sigma 
va = vars_dm  ;  
vipSgm = zeros(N,N,zuNum);
for k=1:zuNum   
%     k
    x = XXvip(k,:)' ;  
    xbar_Localmini = x' ;
    [ sigma, flagVip, ~ ] = fsigma(N,h,x,va,tolsgm);    %%
    if flagVip==1
%         fprintf('\nFind  sigma of  %d-th stable state \n', k);
        Moment2 = diag(sigma,0)'  ;
        vipSgm(:,:,k)=sigma;  
%         fprintf('------------------------------------\n');
    end
end

% save
mkdir('XbarSgm');   
a_x_sgm = sprintf( 'XbarSgm\\L0_%s-Xbar_sigma.mat',num2str(L0) ) ; 
save(a_x_sgm,'Xxbar','XXvip','vipSgm','sizevip','Otherxbar','xbarAll','idxS123','zuNum','zuNum_es', 'L0')  
% load(a_x_sgm) ; 

fprintf('\n Note: The number of the stable states = [ %d ]\n', zuNum);
fprintf('%s\n\n ',fenge ); 

%% next step: l3