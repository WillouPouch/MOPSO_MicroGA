%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Projet final - Métaheuristiques en optimisation
%
%   Esmé James - JAME15539504
%   Wilfried Pouchous - POUW04069501
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------
%	Clear
%-----------------------------------------
clc;
clear;
close all;

%-----------------------------------------
%   Ajout de chemins
%-----------------------------------------
addpath(genpath('Problemes'));
addpath(genpath('MicroGA'));
addpath(genpath('MOPSO'));
addpath(genpath('Operations'));

%-----------------------------------------
%   Choix utilisateurs
%-----------------------------------------
%[UserInput, GAParameters] = GetUserInput();

%###########################################################################################################
%--ATTENTION : PAS DE TEST SUR LES VALEURS ENTREES ICI

UserInput.Probleme = 6; %1 = FON, 2 = POL, 3 = KUR, 4 = ZDT1, 5 = ZDT2, 6 = ZDT3
UserInput.Algorithme = 1; %1 = MicroGA, 2 = MOPSO

% Micro - GA %
GAParameters.PopulationMemory = 50; %temp
GAParameters.PopMicroGA = 4; %temp
GAParameters.PercentNoReplac = 0.3; %temp
GAParameters.IterationsMicroGA = 2; %temp
GAParameters.ReplacementCycle = 50; %temp
GAParameters.Pc = 0.7; %temp
GAParameters.Pm = 0.1; %temp

% MOPSO %
GAParameters.PopSize = 200; %temp

% Les deux %
GAParameters.ExternalMemory = 100; %temp
GAParameters.Gmax = 1500; %temp

%###########################################################################################################

%-----------------------------------------
%   Set des paramètres du problème
%-----------------------------------------
ProblemParameters = SetProblemParameters(UserInput.Probleme);

%-----------------------------------------
%   Appel de l'algorithme génétique
%-----------------------------------------
switch (UserInput.Algorithme)
    % 1 = MicroGA
    case 1
        MicroGA(UserInput,ProblemParameters,GAParameters);
    %2 = MOPSO
    case 2
        MOPSO(UserInput,ProblemParameters,GAParameters);
end

%-----------------------------------------
%   Suppression des chemins
%-----------------------------------------
rmpath('Problemes');
rmpath('MicroGA');
rmpath('MOPSO');
rmpath('Operations');