function kappa_Phi = courbure(Phi)
% renvoie une image kappa_Phi (de même dimensions que Phi)
% kappa_Phi(i,j) est égale à la courbure de Phi au point (i,j)

Phi_est = [Phi(:,1) Phi(:,1:end-1)];
Phi_ouest = [Phi(:,2:end) Phi(:,end)];
Phi_nord = [Phi(2:end,:) ; Phi(end,:)];
Phi_sud = [Phi(1,:) ; Phi(1:end-1,:)];

Phi_nord_est = [Phi_nord(:,1) Phi_nord(:,1:end-1)];
Phi_nord_ouest = [Phi_nord(:,2:end) Phi_nord(:,end)];
Phi_sud_est = [Phi_sud(:,1) Phi_sud(:,1:end-1)];
Phi_sud_ouest = [Phi_sud(:,2:end) Phi_sud(:,end)];

Phi_x = (Phi_ouest - Phi_est)/2;
Phi_y = (Phi_nord  - Phi_sud)/2;
Phi_xx = Phi_ouest + Phi_est - 2*Phi;
Phi_yy = Phi_nord  + Phi_sud - 2*Phi;
Phi_xy = (Phi_nord_ouest + Phi_sud_est - Phi_nord_est - Phi_sud_ouest)/4;

%on initialise avec des zéros
kappa_Phi = zeros(size(Phi));

%numérateur
N = (Phi_xx.*Phi_y.^2 - 2*Phi_x.*Phi_y.*Phi_xy + Phi_yy.*Phi_x.^2);
%denominateur
D = (Phi_x.^2 + Phi_y.^2).^(3/2);

%si le denominateur est non nul on effectue la division (sinon on laisse 0)
kappa_Phi(D~=0) = N(D~=0) ./ D(D~=0);
% kappa_Phi = kappa_Phi * sqrt(Phi_x.^2 + Phi_y.^2);
