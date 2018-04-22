%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Cr�er une grille permettant de
%   positionner les particules
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function grid = CreateGrid(P)

%-----------------------------------------
%   Init variables
%-----------------------------------------
gridSize = 7;
alpha = 0.1;
couts = [P.Cost];
nbObjectifs = 2;

%On garde les �l�ments min et max de chaque ligne des co�ts P
coutMin = min(couts,[],2);
coutMax = max(couts,[],2);

%On r�adapte les co�ts min et max selon alpha
diffCouts = coutMax - coutMin;
coutMin = coutMin - alpha*diffCouts;
coutMax = coutMax + alpha*diffCouts;

%Grille vide
grilleVide.LowerLimit = [];
grilleVide.UpperLimit = [];
grid = repmat(grilleVide, nbObjectifs, 1);

%-----------------------------------------
%   Cr�ation de la grille
%-----------------------------------------
for j = 1:nbObjectifs

    %Vecteur ligne de gridSize+1 = 8 points entre coutMin et coutMax
    coutJ = linspace(coutMin(j), coutMax(j), gridSize+1);

    %Grille
    grid(j).LowerLimit = [ -inf coutJ ];
    grid(j).UpperLimit = [ coutJ +inf ];

end