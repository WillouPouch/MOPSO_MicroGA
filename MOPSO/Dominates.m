%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Détermine la domination entre 2 individus
%   ind1 et ind2
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function b = Dominates(ind1, ind2)

    if isstruct(ind1)
        ind1 = ind1.Cost;
    end
    
    if isstruct(ind2)
        ind2 = ind2.Cost;
    end

    b = all(ind1 <= ind2) && any(ind1 < ind2);

end