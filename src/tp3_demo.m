clear;
clc ;
close all ; 

% PARTIE 1 : REPRESENTATION IMPLICITE D'UNE COURBE

% Test extraction sur image
u=double(imread('images/images_binaires_pour_initialisation/image_binaire.bmp'));
imshow(u,[]);
title('Image originale');

figure;
Phi = distance_signee(u);
result = extraction_niveau0(Phi);
imshow(result,[])
title('Extraction');

% Comparaison fonction contour
figure;
contour(Phi,[0 0]);
axis ij;
axis equal;
axis off

% Test extraction sur un cercle
n = 100 ;
[X,Y] = ndgrid(1:n,1:n);
r = n/3 ;
c = [n/2 n/2] ;
Phi = sqrt ((X-c(1)).^2+(Y-c(2)).^2)-r ;
imshow(Phi,[])
title('Cercle originale');

figure;
result = extraction_niveau0(Phi);
imshow(result,[])
title('Extraction');

% Comparaison fonction contour
figure;
contour(Phi,[0 0]);
axis ij;
axis equal;
axis off


% PARTIE 2 : EVOLUTION D'UNE COURBE

clear;
clc ;
close all ; 

u=double(imread('images/images_binaires_pour_initialisation/image_binaire.bmp'));
imshow(u,[]);
title('Image originale');
Phi = distance_signee(u);
result = extraction_niveau0(Phi);

dt=0.01;
nb_affiche = 30;
n=2500;

% Contraction
C = ones(size(Phi)) ;
contraction_expansion(Phi, C, dt, nb_affiche,n)

% Expansion
C = ones(size(Phi)) .* -1 ;
contraction_expansion(Phi, C, dt, nb_affiche,n)

% C aleatoire
C = ones(size(Phi)) .* randi([0, 2], size(Phi)) - 1;
contraction_expansion(Phi, C, dt, nb_affiche,n)

% C selon le systeme
C = zeros(size(Phi)) ;
C(1:floor(size(Phi,1)/3), :) = 1;  
C(floor(size(Phi,1)/3):floor(2*size(Phi,1)/3), :) = 0;  
C(floor(2*size(Phi,1)/3):end, :) = -1;

contraction_expansion(Phi, C, dt, nb_affiche,n)


% Courbure
clear;
clc ;
close all ; 

u=double(imread('images/images_binaires_pour_initialisation/serpent.bmp'));
imshow(u,[]);
title('Image originale');
Phi = distance_signee(u);
result = extraction_niveau0(Phi);
dt=0.05;
nb_affiche = 100;
n=10000;
C = ones(size(Phi)) ;
mouvement_par_courbure(Phi, C,dt, nb_affiche,n)


% PARTIE 3 : SEGMENTATION D'OBJETS

clear;
clc ;
close all ; 

sigma = 1.5;  
taille_noyau = 11; 
Ng = noyau_gaussien(sigma, taille_noyau);

I=double(imread('images/pour_tester_segmentation/test_seg1.png'));
subplot(1,3,1);
imshow(I, []);
title('Image originale');
I_blurred = conv2(I, Ng, 'same');  

dt=0.05;
nb_affiche = 100;
n=10000; 
alpha = 0.01;
C=-1;

gI = 1 ./ (1 + norm_grad(grad(I_blurred)));
K = courbure(distance_signee(I));
subplot(1,3,2);
imshow(gI, []);
title('Image gi');

% Definition de phi rectangle
subplot(1,3,3);
[rows, cols] = size(I);
Phi = zeros(rows,cols);
Phi(2:rows-1, 2:cols-1) = 1;
imshow(Phi, []);
title('Image Phi initiale');

Phi = distance_signee(Phi);

figure;
evolution_segmentation(gI, Phi, C, alpha, n, nb_affiche, dt);
