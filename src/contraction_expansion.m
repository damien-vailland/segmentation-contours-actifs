function contraction_expansion(Phi, C, dt, nb_affiche,n)
% implémente l'évolution de l'équation (1) du TP3
% Phi : courbe initiale (representée par sa fonction distance signée)
% C : champ de vitesse (image de même taille que Phi)
% dt : pas de discrétisation temporelle
% nb_affiche : on affiche la courbe toutes les nb_affiche itérations
% n : nombre d'itérations à effectuer (si non-indiqué, n=1000 par défaut)

if (nargin<5)
    n=1000;
end
for t=0:n-1
    
    Phi =  Phi +  dt * normgrad_contraction_expansion(Phi,C);
    
    % on affiche tous les nb_affiche
    if (mod(t,nb_affiche)==0)
        niveau0 = extraction_niveau0(Phi);
        subplot(1,3,3);
        imshow(niveau0,[]);title('Niveau z�ro');
        subplot(1,3,2);
        imshow(Phi,[]);title('Phi');
        subplot(1,3,1);
        surf(double(Phi));title('Phi'); axis([0 100 0 100 -20 40]);
        drawnow;
    end
end
