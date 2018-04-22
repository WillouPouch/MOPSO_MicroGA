%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   �tape d'initialisation de la Population
%   de Micro GA
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Pi = InitPopMicroGA(GAParameters, Mr, Mn)

%-----------------------------------------
%	Init variables
%-----------------------------------------
popMicroGASize = GAParameters.PopMicroGA;
nonReplaceMemoryPercent = GAParameters.PercentNoReplac;
MnSize = size(Mn,1);
MrSize = size(Mr,1);

%-----------------------------------------
%	Calcul de la pr�sence de chaque portion
%   de PopMemory dans PopMicroGA
%-----------------------------------------
% NonReplaceable (30%, arrondi � l'entier inf�rieur)
nbNonReplac = floor(nonReplaceMemoryPercent * popMicroGASize);

% Replaceable (le reste)
nbReplac = popMicroGASize - nbNonReplac;

%-----------------------------------------
%	Cr�ation de la population de MicroGA 
%-----------------------------------------
randNonReplac = randperm(MnSize, nbNonReplac);
randReplac = randperm(MrSize, nbReplac);

Pi = [Mn(randNonReplac) ; Mr(randReplac)];
