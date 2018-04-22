%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Crowding Distance
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function E = CrowdingDistance(E, indivNonDom)

%-----------------------------------------
%	Init variables
%-----------------------------------------
m = 2; %nombre de valeurs objectives
sizeE = size(E,1);
sizeIndiv = size(indivNonDom,1);
valObj = [E.ValObjective];
dist = zeros(sizeE, m);
CrowDist = zeros(sizeE, 1);

%-----------------------------------------
%   Calcul de la crowding distance pour chaque objectif
%-----------------------------------------
for i = 1:m        
    [valTri, indTri] = sort(valObj(i,:));

    dist(indTri(1),i) = inf;
    for k = 2:sizeE-1
        dist(indTri(k),i) = abs(valTri(k+1)-valTri(k-1))/abs(valTri(1)-valTri(end));
    end
    dist(indTri(end),i) = inf;
end

%-----------------------------------------
%   Somme des crowding distance des 2 objectifs par individu
%-----------------------------------------
for j = 1:sizeE
    CrowDist(j) = sum(dist(j,:));
end

%-----------------------------------------
%   Tri des crowding distance par ordre décroissant
%-----------------------------------------
[~, CDSO] = sort(CrowDist,'descend');
E = E(CDSO);

%-----------------------------------------
%   Application de cet ordre à E et remplacement des derniers 
%   membres par indivNonDom
%-----------------------------------------
for i = 1:sizeIndiv
    E(sizeE) = indivNonDom(i);
    sizeE = sizeE - 1;
end
