%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Remplacement de la population remplacable
%   par des membres de la memoire externe E
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mr = ReplacementCycle(Mr, E)

%-----------------------------------------
%	Init variables
%-----------------------------------------
sizeMr = size(Mr,1);
sizeE = size(E,1);

%-----------------------------------------
%	Boucle de remplacement
%-----------------------------------------
%Si E n'est pas assez grand (au début), on resélectionne des indices jusqu'à
%la taille de Mr
if(sizeE < sizeMr)
    indexRemplacement = randperm(sizeE);
%Sinon on prend la size de Mr
else
    indexRemplacement = randperm(sizeE,sizeMr);
end

%-----------------------------------------
%   On remplace les éléments de Mr un par un
%-----------------------------------------
for i = 1:size(indexRemplacement,1)
    Mr(i) = E(indexRemplacement(i));
end
