%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   On vérifie que la mémoire externe n'est pas pleine
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  Rep = RepFull(Rep, maxSizeRep)

gamma = 2;
beta = 2;

%Si la taille Rep dépasse la taille max
if size(Rep,1) > maxSizeRep
        surplus = size(Rep,1) - maxSizeRep;
        
        %Suppression d'un individu
        for i = 1:surplus
            
            gridIndex = [Rep.GridIndex];
            cellulesOccupees = unique(gridIndex);

            %Nombre de particules dans les cellules occupées
            nbParticules = zeros(size(cellulesOccupees));

            for k = 1:numel(cellulesOccupees)
                nbParticules(k) = numel(find(gridIndex == cellulesOccupees(k)));
            end

            %Proba de sélection
            P = exp(-beta*nbParticules);
            P = P / sum(P);

            %Roulette Wheel Selection
            C = cumsum(P);
            r = rand;
            indexCelluleSelectionnee = find(r <= C, 1, 'first');

            celluleSelectionnee = cellulesOccupees(indexCelluleSelectionnee);
            membresCelluleSelectionnee = find(gridIndex == celluleSelectionnee);
            IndexMembreSelectionne = randi([1 numel(membresCelluleSelectionnee)]);
            membreSelectionne = membresCelluleSelectionnee(IndexMembreSelectionne);

            Rep(membreSelectionne) = [];
        end
    
end
