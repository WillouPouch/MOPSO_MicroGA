%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Simulated Binary Crossover
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = SimulatedBinaryCrossover(individuVide, GAParameters, MP)

%-----------------------------------------
%	Init variables
%-----------------------------------------
n = 3;
pc = GAParameters.Pc;

N = size(MP,1);
Enfants = repmat(individuVide, N, 1);

%-----------------------------------------
%	Parcours des parents 2 par 2
%-----------------------------------------
for i = 1:2:N
    
    %Sélection des couples de parents 
    P1 = MP(i);
    if(i < N)
        P2 = MP(i+1);
    else
        P2 = P1;
    end
    
    %Beta i
    ui = rand;
    if(ui <= 0.5)
        Bi = power(2*ui,1/1+n);
    elseif(ui > 0.5)
        Bi = power(2*(1-ui),-(1+1/n));
    end
       
    %Crossover avec probabilité de croisement pc
    if(rand < pc)
        Enfants(i,1).Val = 0.5*(P1.Val+P2.Val) + 0.5*Bi*(P1.Val-P2.Val);
        Enfants(i+1,1).Val = 0.5*(P1.Val+P2.Val) + 0.5*Bi*(P2.Val-P1.Val);
    else
        Enfants(i,1).Val = P1.Val;
        Enfants(i+1,1).Val = P2.Val;
    end
end
