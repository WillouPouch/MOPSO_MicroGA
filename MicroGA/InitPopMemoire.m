%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   �tape d'initialisation de la Population
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
%   G�n�ration d'une population al�atoire
%   entre les bornes du probl�me
%-----------------------------------------
for i = 1:popMemorySize

    %Initialisation de la m�moire non remplacable (Mn = 30% de la m�moire population)
    if i <= popMemorySize*nonReplaceMemoryPercent

        Mn(i).Val = A+(B-A)*rand(n,1);
        Mn(i).ValObjective = Probleme(UserInput.Probleme,Mn(i).Val);

   %Initialisation de la m�moire remplacable (Mr)
    else

        Mr(i).Val = A+(B-A)*rand(n,1);
        Mr(i).ValObjective = Probleme(UserInput.Probleme,Mr(i).Val);
    end
end

Mr = Mr(~cellfun(@isempty,{Mr.Val}));
Mn = Mn(~cellfun(@isempty,{Mn.Val}));
