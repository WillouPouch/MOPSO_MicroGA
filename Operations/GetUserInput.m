%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Récupérer les données utilisateur
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [UserInput, GAParameters] = GetUserInput()

disp('Algorithmes génétiques multi-objectifs');
disp('------------------------------------------------------------');

%-----------------------------------------
%   Choix problème
%-----------------------------------------
disp('I - Problème à traiter');
UserInput.Probleme = input('     1 = FON, 2 = POL, 3 = KUR, 4 = ZDT1, 5 = ZDT2, 6 = ZDT3\n     Votre choix : ');
%Test validité
if (UserInput.Probleme ~= 1 && UserInput.Probleme ~= 2 && UserInput.Probleme ~= 3 && UserInput.Probleme ~= 4 && UserInput.Probleme ~= 5 && UserInput.Probleme ~= 6)
    disp('     Choix non valide -> Problème 1 = FON choisi par défaut');
    UserInput.Probleme = 1;
end

%-----------------------------------------
%   Choix problème
%-----------------------------------------
disp('II - Algorithme à utiliser');
UserInput.Algorithme = input('     1 = MicroGA, 2 = MOPSO\n     Votre choix : ');
%Test validité
if (UserInput.Algorithme ~= 1 && UserInput.Algorithme ~= 2)
    disp('     Choix non valide -> Algorithme 1 = MOPSO choisi par défaut');
    UserInput.Algorithme = 1;
end

%-----------------------------------------
%   Paramètres généraux
%-----------------------------------------
disp('III - Paramètres généraux du problème');
% Micro - GA %
if UserInput.Algorithme == 1
    GAParameters.PopMicroGA = input('     Taille population (petite) : ');
    GAParameters.PopulationMemory = input('     Taille mémoire population : ');
    GAParameters.PercentNoReplac = input('     Pourcentage de partie non remplacable dans mémoire population (entre 0 et 1) : ');
    GAParameters.ReplacementCycle = input('     Nombre de cycles de remplacement : ');
    GAParameters.IterationsMicroGA = input('     Nombre itérations : ');
    GAParameters.Pc = input('     Probabilité de croisement Pc (entre 0 et 1) : ');
    GAParameters.Pm = input('     Probabilité de mutation Pm (entre 0 et 1) : ');
% MOPSO %
elseif UserInput.Algorithme == 2
    GAParameters.PopSize = input('     Taille de population (N) : ');
end
% Les deux %
GAParameters.ExternalMemory = input('     Taille mémoire externe : ');
GAParameters.Gmax = input('     Nombre de générations max (Gmax) : ');

%-----------------------------------------
%   Autres paramètres appliqués
%-----------------------------------------
disp('IV - Autres paramètres appliqués par défaut');
disp('     Sélection : Par tournoi binaire');
disp('     Croisement : Simulated Binary');
disp('     Mutation : Uniforme');



disp('V - Lancement');
disp('------------------------------------------------------------');