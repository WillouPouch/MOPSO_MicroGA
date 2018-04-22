%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Vitesse de chaque particule et update des positions 
%   en fonction de la vitesse
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Po = ParticleSpeed(Po, Rep, ProblemParameters)

%-----------------------------------------
%   Init variables
%-----------------------------------------
n = ProblemParameters.NbVariablesDecision;
popSize = size(Po,1);

W = 0.4; %inertia weight
R1 = rand(n,1);
R2 = rand(n,1);
beta = 2;

%-----------------------------------------
%   Recherche de RepH (une valeur particulière 
%   de Rep utilisée dans le calcul de la vélocité)
%-----------------------------------------
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
sommeCumulative = cumsum(P);
r = rand;
indexCelluleSelectionnee = find(r <= sommeCumulative, 1, 'first');

%Recherche de RepH
celluleSelectionnee = cellulesOccupees(indexCelluleSelectionnee);
membresCelluleSelectionnee = find(gridIndex == celluleSelectionnee);
IndexMembreSelectionne = randi([1 numel(membresCelluleSelectionnee)]);
membreSelectionne = membresCelluleSelectionnee(IndexMembreSelectionne);
RepH = Rep(membreSelectionne);

%-----------------------------------------
%	Update des particules
%-----------------------------------------
for i = 1:popSize
    
    %Calcul de la vitesse de la particule
    wV = W * Po(i).Velocity;
    A1 = R1 .* (Po(i).Best.Position - Po(i).Position);
    A2 = R2 .* (RepH.Position - Po(i).Position);
    
    Po(i).Velocity = wV + A1 + A2;
    
    %Mise à jour de la position de la particule en fonction de la vitesse
    Po(i).Position = Po(i).Position + Po(i).Velocity;
end