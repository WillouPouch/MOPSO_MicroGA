%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Étape d'initialisation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Po = InitialisationMOPSO(individuVide, ProblemParameters,GAParameters,UserInput)

%-----------------------------------------
%	Init variables
%-----------------------------------------
A = ProblemParameters.LowerLimit;
B = ProblemParameters.UpperLimit;
n = ProblemParameters.NbVariablesDecision;
popSize = GAParameters.PopSize;

Po = repmat(individuVide, popSize, 1);

%-----------------------------------------
%   Génération d'une population aléatoire
%   entre les bornes du problème
%-----------------------------------------
for i = 1:popSize
    
        %Init de l'individu
        Po(i).Position = A+(B-A)*rand(n,1);
        
        %Init de la velocité de la particule (= l'individu)
        Po(i).Velocity = zeros(n,1); 
        
        %Evaluation
        Po(i).Cost = Probleme(UserInput.Probleme,Po(i).Position);
        
        %Init de la mémoire de la particule
        Po(i).Best.Position = Po(i).Position;
        Po(i).Best.Cost = Po(i).Cost;
end