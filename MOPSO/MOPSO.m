%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Algorithme g�n�tique MOPSO
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MOPSO(UserInput,ProblemParameters,GAParameters)

%-----------------------------------------
%   Init variables
%-----------------------------------------
individuVide.Position = [];
individuVide.Velocity = [];
individuVide.Cost = [];
individuVide.Best.Position = [];
individuVide.Best.Cost = [];
individuVide.IsDominated = [];
individuVide.GridIndex = [];
individuVide.GridSubIndex = [];

%-----------------------------------------
%   Initialisation 
%-----------------------------------------
Po = InitialisationMOPSO(individuVide, ProblemParameters,GAParameters,UserInput);
G = 1;

%-----------------------------------------
%   Domination : on stocke les non-domin�s dans Rep
%-----------------------------------------
[Po, Rep] = DetermineDomination(Po);

%-----------------------------------------
%    G�n�ration hypercubes
%-----------------------------------------
grid = CreateGrid(Rep);
for i = 1:size(Rep,1)
    Rep(i) = FindGridIndex(Rep(i),grid);
end

%-----------------------------------------
%  Boucle principale 
%-----------------------------------------
while G < GAParameters.Gmax 
    
    %-----------------------------------------
    %  Vitesse de chaque particule et update des positions en fonction de
    %  la vitesse
    %-----------------------------------------
    Po = ParticleSpeed(Po, Rep, ProblemParameters);
   
    %-----------------------------------------
    %  Evaluation
    %-----------------------------------------
    for i = 1:GAParameters.PopSize
        
        %On s'assure que la valeur est entre les bornes du probl�me
        Po(i).Position = max(Po(i).Position, ProblemParameters.LowerLimit);
        Po(i).Position = min(Po(i).Position, ProblemParameters.UpperLimit);
        
        %Calcul de la valeur de fitness
        Po(i).Cost = Probleme(UserInput.Probleme,Po(i).Position);
    end
    
    %-----------------------------------------
    % On garde les meilleurs nouvelles positions
    %-----------------------------------------
    Po = KeepBest(Po);
    
    %-----------------------------------------
    %   Domination
    %-----------------------------------------
    %Ajout des particules nonDomin�es au Rep
    Rep = [Rep; Po(~[Po.IsDominated])];
    
    %On garde les particules de Rep non-domin�s
    Rep = DetermineDomination(Rep);
    Rep = Rep(~[Rep.IsDominated]); 
    
    %-----------------------------------------
    %  Mise � jour grille et indices
    %-----------------------------------------
    grid = CreateGrid(Rep);
    for i = 1:size(Rep,1)
        Rep(i) = FindGridIndex(Rep(i), grid);
    end
    
    %-----------------------------------------
    %  Suppression d'individus si Rep est plein
    %-----------------------------------------
    Rep = RepFull(Rep, GAParameters.ExternalMemory);
    
    %-----------------------------------------
    %   Plot R�sultat
    %-----------------------------------------
    AffichageResultats(Rep, G, UserInput.Algorithme);
    
    G = G + 1;
end

%-----------------------------------------
%   Plot R�sultat
%-----------------------------------------
AffichageResultats(Rep, G, UserInput.Algorithme);


