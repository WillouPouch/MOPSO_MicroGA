%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Elitisme (on garde k individu(s) non-domin�(s))
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function P = Elitisme(individuVide, Pop, nbIndividus)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = size(Pop,1);
tempP = repmat(individuVide, N, 1);
P = repmat(individuVide, nbIndividus, 1);
NonDominated = true;
nbNoDom = 0;

%-----------------------------------------
%	Boucle de dominance
%-----------------------------------------
for i = 1:N 
    for j = 1:N
        %On ne le compare pas � lui-m�me
        if i == j
            continue;
        end
        
        %On cherche � savoir si Pop(i) est domin� par Pop(j)
        if all(Pop(j).ValObjective <= Pop(i).ValObjective) && any(Pop(j).ValObjective < Pop(i).ValObjective)
            NonDominated = false;
            break;
        end
    end
    
    %Si Pop(i) est non-domin� par tous les autres individus alors on l'ajoute
    if(NonDominated)
        nbNoDom = nbNoDom + 1;
        tempP(nbNoDom) = Pop(i);
    end

    %Reset du booleen concernant la domination
    NonDominated = true;
end

%-----------------------------------------
%   On enl�ve les lignes vides de tempP
%-----------------------------------------
tempP = tempP(~cellfun(@isempty,{tempP.Val}));

%-----------------------------------------
%   On garde nbIndividus non-domin�s
%-----------------------------------------
if(nbIndividus == 1)
    indice = randperm(nbNoDom, nbIndividus);
    P(1) = tempP(indice);
else
    P(1) = tempP(1);
    P(2) = tempP(end);
end
