%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sélection par tournoi binaire basé 
%   sur la non-domination
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MP = TournamentSelection(individuVide, P)

%-----------------------------------------
%   Init variables
%-----------------------------------------
k = 2; %Nb d'individus en compétition dans le tournoi (binaire)

N = size(P,1);
MP = repmat(individuVide, N, 1);

%-----------------------------------------
%   Génération de k permutations aléatoires (ici binaire)
%-----------------------------------------
kj = [];
for j = 1:k
    kj = [kj; randperm(N)];
end

%-----------------------------------------
%   Parcours du nombre d'individus à sélectionner (N dans le cas général)
%-----------------------------------------
for i = 1:N
    if all(P(kj(1,i)).ValObjective <= P(kj(2,i)).ValObjective) && any(P(kj(1,i)).ValObjective < P(kj(2,i)).ValObjective)
        MP(i) = P(kj(1,i));
    else
        MP(i) = P(kj(2,i));
    end
end
