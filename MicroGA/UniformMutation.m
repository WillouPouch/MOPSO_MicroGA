%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Uniform Mutation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mutants = UniformMutation(idProbleme, GAParameters, ProblemParameters, Enfants)

%-----------------------------------------
%	Init variables
%-----------------------------------------
L = ProblemParameters.LowerLimit;
U = ProblemParameters.UpperLimit;
pm = GAParameters.Pm;
NbDecVar = ProblemParameters.NbVariablesDecision;
Mutants = Enfants;

%-----------------------------------------
%	Parcours des enfants
%-----------------------------------------
for i = 1:size(Enfants,1)
   
   %Parcours des variables de décision
   for j = 1:NbDecVar

        if(rand < pm) 
            Mutants(i).Val(j) = (U-L)*rand + L;
        end
   end
end

%-----------------------------------------
%   Opération de faisabilité
%-----------------------------------------
for i = 1:size(Mutants)
    for j = 1:NbDecVar
        if  Mutants(i).Val(j) < L
            Mutants(i).Val(j) = L;
        elseif Mutants(i).Val(j) > U
            Mutants(i).Val(j) = U;                    
        end
    end
end

%-----------------------------------------
%   Recalcul des valeurs objectives des mutants
%-----------------------------------------
for i = 1:size(Mutants)
    Mutants(i).ValObjective = Probleme(idProbleme,Mutants(i).Val);
end
