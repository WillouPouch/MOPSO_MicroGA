%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Set les paramètres du problème en fonction
%   du problème choisi
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ProblemParameters = SetProblemParameters(idProbleme)

%FON
if idProbleme == 1
        ProblemParameters.UpperLimit = 4;
        ProblemParameters.LowerLimit = -4;
        ProblemParameters.NbVariablesDecision = 3;
%POL
elseif idProbleme == 2
        ProblemParameters.UpperLimit = pi;
        ProblemParameters.LowerLimit = -pi;
        ProblemParameters.NbVariablesDecision = 2;
%KUR
elseif idProbleme == 3
        ProblemParameters.UpperLimit = 5;
        ProblemParameters.LowerLimit = -5;
        ProblemParameters.NbVariablesDecision = 3;
%ZDT1, ZDT2, ZDT3
elseif idProbleme == 4 || idProbleme == 5 || idProbleme == 6
        ProblemParameters.UpperLimit = 1;
        ProblemParameters.LowerLimit = 0;
        %ProblemParameters.NbVariablesDecision = 30;
        ProblemParameters.NbVariablesDecision = 5;
end