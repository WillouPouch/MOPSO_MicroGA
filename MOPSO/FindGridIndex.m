%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Trouver index de la grille
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function particle = FindGridIndex(particle, grid)

%-----------------------------------------
%   Init variables
%-----------------------------------------
nbObjectifs = 2;
gridSize = numel(grid(1).LowerLimit);
particle.GridSubIndex = zeros(1, nbObjectifs);

%-----------------------------------------
%   Trouve pour chaque objectif, l'index de la particule dans la grille
%-----------------------------------------
for j = 1:nbObjectifs

    %On garde l'indice de la première occurrence ou le coût de la particule est
    %inférieur à une des valeurs de la limite supérieure de la grille
    particle.GridSubIndex(j)= find(particle.Cost(j) < grid(j).UpperLimit, 1);

end

%-----------------------------------------
%   Assignation de l'index de la particule
%-----------------------------------------
particle.GridIndex = particle.GridSubIndex(1);

for j = 2:nbObjectifs

    particle.GridIndex = particle.GridIndex - 1;
    particle.GridIndex = gridSize * particle.GridIndex;
    particle.GridIndex = particle.GridIndex + particle.GridSubIndex(j);
end
  