%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Algorithme g�n�tique MicroGA
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MicroGA(UserInput,ProblemParameters,GAParameters)

%-----------------------------------------
%   Init variables
%-----------------------------------------
individuVide.Val = [];
individuVide.ValObjective = [];
G = 1;
I = 1;
E = [];

%-----------------------------------------
%   Initialisation de la population m�moire
%       Mr : Replaceable part
%       Mn : Non replaceable part
%-----------------------------------------
[Mr, Mn] = InitPopMemoire(individuVide, ProblemParameters, GAParameters, UserInput);
M = [Mr; Mn];

%-----------------------------------------
%   Boucle des Gmax g�n�rations
%-----------------------------------------
while (G < GAParameters.Gmax) 
    
    %-----------------------------------------
    %  Population initiale
    %-----------------------------------------
    Pi = InitPopMicroGA(GAParameters, Mr, Mn);
    
    %-----------------------------------------
    %  Boucle jusqu'� convergence nominale
    %-----------------------------------------
    while (I < GAParameters.IterationsMicroGA+1)
        
        %-----------------------------------------
        %   S�lection du MP par tournoi binaire
        %-----------------------------------------
        MP = TournamentSelection(individuVide, Pi);
        
        %-----------------------------------------
        %   Croisement (simulated binary crossover)
        %-----------------------------------------
        Enfants = SimulatedBinaryCrossover(individuVide, GAParameters, MP);
        
        %-----------------------------------------
        %   Mutation (uniform mutation)
        %-----------------------------------------
        Mutants = UniformMutation(UserInput.Probleme, GAParameters, ProblemParameters, Enfants);

        %-----------------------------------------
        %   Elitisme (on garde un individu non-domin�)
        %-----------------------------------------
        individuNonDomine = Elitisme(individuVide, Mutants, 1);

        Pi = [Mutants ; individuNonDomine];
        I = I + 1;
    end

    %-----------------------------------------
    %   On prend 2 individus non-domin�s de P(i) (premier et dernier)
    %-----------------------------------------
    individusNonDomines = Elitisme(individuVide, Pi, 2); %r�f�rence
    individusNonDominesE = individusNonDomines; %pour mettre � jour E
    individusNonDominesMr = individusNonDomines; %pour mettre � jour Mr   

    %-----------------------------------------
    %   Mise � jour de l'archive (m�moire externe E)
    %-----------------------------------------    
    %Si E est vide, on ajoute les 2 individus non-domin�s
    if(isempty(E))
        E = [E; individusNonDominesE];
    %Sinon...
    else
        %On v�rifie si on peut ins�rer ces 2 individus non-domin�s dans E
        individusNonDominesE = NotDominated(individusNonDominesE, E);
        
        %Si au moins un peut �tre ajout�
        if(size(individusNonDominesE,1) > 0)
            %Si archive pas pleine, on ajoute
            if(size(E,1) < GAParameters.ExternalMemory-1) %-1 : pour avoir 101 si 2 ajouts
                E = [E; individusNonDominesE];
            %Si archive pleine, on remplace les k individus les plus "entour�s" par les k nouveaux
            else
                E = CrowdingDistance(E, individusNonDominesE);
            end
        end
    end

    %-----------------------------------------
    %   Mise � jour de le m�moire population remplacable (Mr)
    %-----------------------------------------
    %Selection alaetoire de 2 indices de la population remplaceable
    indiceRandIndividusMr = randperm(size(Mr,1),2);

    %Cr�ation d'un population contenant juste les 2 membres correspondants
    PopRandMr = [Mr(indiceRandIndividusMr(1)) Mr(indiceRandIndividusMr(2))];
    
    %On v�rifie si on peut remplacer les 2 individus non-domin�s dans PopRandMr
    individusNonDominesMr = NotDominated(individusNonDominesMr, PopRandMr);
    
    %Cas d'erreur : si le 1er indiv est supprim� (car domin�) et pas le 2eme, alors le 2eme se
    %retrouve � l'indice 1 dans la var individusNonDominesMr et cela pose
    %probleme car il pourrait remplacer le 1er indice de la pop remplacable
    if(size(individusNonDominesMr,1) == 1 && isequal(individusNonDominesMr(1),individusNonDomines(2)))
        indiceRandIndividusMr(1) = [];
    end
    
    %On remplace s'il reste des individus non-domin�s
    for i = 1:size(individusNonDominesMr,1)
        Mr(indiceRandIndividusMr(i)) = individusNonDominesMr(i);
    end
    M = [Mr; Mn];
   
    %-----------------------------------------
    %   3�me type d'�litisme de l'article (cycle de remplacement)
    %-----------------------------------------
    if(mod(G,GAParameters.ReplacementCycle) == 0)
        %V�rifie l'unique pr�sence d'individus non-domin�s dans E
        copieE = E;
        E = NotDominated(E, copieE);

        %Remplacement cycle
        Mr = ReplacementCycle(Mr, E);
    end

    %Plot R�sultat
    AffichageResultats(E, G, UserInput.Algorithme);
    
    P = [];    
    G = G + 1;
    I = 1;
end

%Plot R�sultat
AffichageResultats(E, G, UserInput.Algorithme);
