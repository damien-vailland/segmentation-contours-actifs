function Phi = distance_signee(Bin)
% Bin est une image binaire (0 et 1)
% les valeurs 1 -> le fond 
% les valeurs 0 -> l'objet
% Phi est la fonction distance signée à la courbe-frontière de l'objet
% (positive à l'extérieur et négative à l'intérieur de l'objet)

Dist_int = -(Bin==0).*(bwdist(Bin==1)-.5);
Dist_ext = (Bin>0).*(bwdist(Bin==0)-.5);
Phi = Dist_int + Dist_ext;
