%normalizing by col, range 0 to 1
function SSnor= fNor(SS)
    % N = 3; 
    [km,kn]=size(SS);
    ma=zeros(1,kn);
    SSnor=zeros(km,kn);
    for ni=1:kn
        ma(ni)=max(SS(:,ni));
        for nj=1:km
            SSnor(nj,ni)=SS(nj,ni)./ma(ni);
        end
    end
end

