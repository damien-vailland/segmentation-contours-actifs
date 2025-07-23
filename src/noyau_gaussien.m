function Ng = noyau_gaussien(sigma,taille_noyau)

    demi_cote = (taille_noyau-1)/2;
    x = -demi_cote : demi_cote ;
    y = -demi_cote : demi_cote ;
    [X,Y] = meshgrid (x,y) ;
    % on applique la formule de la gaussienne
    Ng = exp (-(X.^2+Y.^2)/(2*sigma^2));
    Ng = Ng / sum(Ng(:)) ; % on normalise pour avoir sum (Ng(:))= 1
    
end

