%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   R�cup�rer les donn�es utilisateur
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [UserInput, GAParameters] = GetUserInput()

disp('Algorithmes g�n�tiques multi-objectifs');
disp('------------------------------------------------------------');

%-----------------------------------------
%   Choix probl�me
%-----------------------------------------
disp('I - Probl�me � traiter');
UserInput.Probleme = input('     1 = FON, 2 = POL, 3 = KUR, 4 = ZDT1, 5 = ZDT2, 6 = ZDT3\n     Votre choix : ');
%Test validit�
if (UserInput.Probleme ~= 1 && UserInput.Probleme ~= 2 && UserInput.Probleme ~= 3 && UserInput.Probleme ~= 4 && UserInput.Probleme ~= 5 && UserInput.Probleme ~= 6)
    disp('     Choix non valide -> Probl�me 1 = FON choisi par d�faut');
    UserInput.Probleme = 1;
end

%-----------------------------------------
%   Choix probl�me
%-----------------------------------------
disp('II - Algorithme � utiliser');
UserInput.Algorithme = input('     1 = MicroGA, 2 = MOPSO\n     Votre choix : ');
%Test validit�
if (UserInput.Algorithme ~= 1 && UserInput.Algorithme ~= 2)
    disp('     Choix non valide -> Algorithme 1 = MOPSO choisi par d�faut');
    UserInput.Algorithme = 1;
end

%-----------------------------------------
%   Param�tres g�n�raux
%-----------------------------------------
disp('III - Param�tres g�n�raux du probl�me');
% Micro - GA %
if UserInput.Algorithme == 1
    GAParameters.PopMicroGA = input('     Taille population (petite) : ');
    GAParameters.PopulationMemory = input('     Taille m�moire population : ');
    GAParameters.PercentNoReplac = input('     Pourcentage de partie non remplacable dans m�moire population (entre 0 et 1) : ');
    GAParameters.ReplacementCycle = input('     Nombre de cycles de remplacement : ');
    GAParameters.IterationsMicroGA = input('     Nombre it�rations : ');
    GAParameters.Pc = input('     Probabilit� de croisement Pc (entre 0 et 1) : ');
    GAParameters.Pm = input('     Probabilit� de mutation Pm (entre 0 et 1) : ');
% MOPSO %
elseif UserInput.Algorithme == 2
    GAParameters.PopSize = input('     Taille de population (N) : ');
end
% Les deux %
GAParameters.ExternalMemory = input('     Taille m�moire externe : ');
GAParameters.Gmax = input('     Nombre de g�n�rations max (Gmax) : ');

%-----------------------------------------
%   Autres param�tres appliqu�s
%-----------------------------------------
disp('IV - Autres param�tres appliqu�s par d�faut');
disp('     S�lection : Par tournoi binaire');
disp('     Croisement : Simulated Binary');
disp('     Mutation : Uniforme');



disp('V - Lancement');
disp('------------------------------------------------------------');