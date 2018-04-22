%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Probleme
%
%       Sélectionne le problème à traiter
%       en fonction du choix utilisateur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f = Probleme(idProbleme,x)

switch idProbleme
    %FON
    case 1
        f = FON(x);
    %POL
    case 2 
        f = POL(x);
    %KUR
    case 3
        f = KUR(x);
    %ZDT1
    case 4
        f = ZDT1(x);
    %ZDT2
    case 5
        f = ZDT2(x);
    %ZDT3
    case 6
        f = ZDT3(x);
end