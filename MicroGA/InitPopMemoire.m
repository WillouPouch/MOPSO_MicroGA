%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Étape d'initialisation de la Population
%   Memoire
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Mr, Mn] = InitPopMemoire(individuVide, ProblemParameters, GAParameters, UserInput)

%-----------------------------------------
%	Init variables
%-----------------------------------------
A = ProblemParameters.LowerLimit;
B = ProblemParameters.UpperLimit;
n = ProblemParameters.NbVariablesDecision;

popMemorySize = GAParameters.PopulationMemory;
nonReplaceMemoryPercent = GAParameters.PercentNoReplac;

Mr = repmat(individuVide, popMemorySize, 1);
Mn = repmat(individuVide, popMemorySize, 1);

%-----------------------------------------
%   Génération d'une population aléatoire
%   entre les bornes du problème
%-----------------------------------------
for i = 1:popMemorySize

    %Initialisation de la mémoire non remplacable (Mn = 30% de la mémoire population)
    if i <= popMemorySize*nonReplaceMemoryPercent

        Mn(i).Val = A+(B-A)*rand(n,1);
        Mn(i).ValObjective = Probleme(UserInput.Probleme,Mn(i).Val);

   %Initialisation de la mémoire remplacable (Mr)
    else

        Mr(i).Val = A+(B-A)*rand(n,1);
        Mr(i).ValObjective = Probleme(UserInput.Probleme,Mr(i).Val);
    end
end

Mr = Mr(~cellfun(@isempty,{Mr.Val}));
Mn = Mn(~cellfun(@isempty,{Mn.Val}));
