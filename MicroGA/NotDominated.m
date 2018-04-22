%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Test si individu(s) non dominé par rapport
%   à une population (mémoire E ou remplaceable memory)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function individusNonDomines = NotDominated(individusNonDomines, Pop)

%-----------------------------------------
%	Init variables
%-----------------------------------------
sizeIndiv = size(individusNonDomines,1);
sizePop = size(Pop,1);
indiceDom = [];

%-----------------------------------------
%	Boucle de dominance
%-----------------------------------------
for i = 1:sizeIndiv
    for j = 1:sizePop

        %Si un individu de E domine un des 2 individus venant de MicroGA
        %alors on conserve l'indice de ce dernier pour ensuite le supprimer
        if all(Pop(j).ValObjective <= individusNonDomines(i).ValObjective) && any(Pop(j).ValObjective < individusNonDomines(i).ValObjective)
            indiceDom = [indiceDom ; i];
            break;
        end
    end
end

%-----------------------------------------
%   Suppression des individus dominés par des membres de E
%-----------------------------------------
individusNonDomines(indiceDom) = [];
