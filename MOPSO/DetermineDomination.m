%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Stocke les particules non-dominées
%   dans Rep
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Po, Rep] = DetermineDomination(Po)

%-----------------------------------------
%  Init variables
%-----------------------------------------
popSize = size(Po,1);

%-----------------------------------------
%   On met tous les individus à non dominés
%-----------------------------------------
for i = 1:popSize
    Po(i).IsDominated = false;
end

%-----------------------------------------
%   On change la valeur de IsDominated si domination
%-----------------------------------------
for i = 1:popSize-1
   
    for j = i+1:popSize
        
            %Si Po(i) domine Po(j) => Po(j) est dominé
            if Dominates(Po(i),Po(j))
               Po(j).IsDominated = true;
            end
            
            %Si Po(j) domine Po(i) => Po(i) est dominé
            if Dominates(Po(j),Po(i))
               Po(i).IsDominated = true;
            end
    end
end

%On garde les non dominés et on les met dans Rep
Rep = Po(~[Po.IsDominated]);

