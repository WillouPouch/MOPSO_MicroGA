%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Quand la position courante de la particule est meilleure que celle en
%   mémoire on la sauvegarde
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 function Po = KeepBest(Po)

for i = 1:size(Po,1)
    
    if Dominates(Po(i),Po(i).Best)
        
        Po(i).Best.Position = Po(i).Position;
        Po(i).Best.Cost = Po(i).Cost;
            
    elseif Dominates(Po(i).Best,Po(i))
        % On fait rien

    else
        if rand<0.5
            Po(i).Best.Position = Po(i).Position;
            Po(i).Best.Cost = Po(i).Cost;
        end
    end
    
end