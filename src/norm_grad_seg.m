function NG = norm_grad_seg(Phi,C)
%     Phi_ouest = [Phi(:,1), Phi(:, 1:end-1)]; 
%     Phi_est = [Phi(:,2:end), Phi(:, end)];   
%     Phi_nord = [Phi(2:end,:); Phi(end,:)];   
%     Phi_sud = [Phi(1,:); Phi(1:end-1, :)];   
% 
%     D_x = Phi_est - Phi_ouest;  
%     D_y = Phi_nord - Phi_sud;
% 
%     D = sqrt(D_x.^2 + D_y.^2);
% 
%     NG = C .* D;
%     
%     NG = norm_grad(Phi);
    
    Phi_ouest = [Phi(:,1) Phi(:,1:end-1)];
    Phi_est = [Phi(:,2:end) Phi(:,end)];
    Phi_nord = [Phi(2:end,:) ; Phi(end,:)];
    Phi_sud = [Phi(1,:) ; Phi(1:end-1,:)];

    D_moins_x = Phi - Phi_ouest;
    D_plus_x = Phi_est - Phi;
    D_moins_y = Phi - Phi_sud ;
    D_plus_y = Phi_nord - Phi;

    
    D_moins = sqrt( max(D_plus_x,0).^2  + min(D_moins_x,0).^2 + max(D_plus_y,0).^2  + min(D_moins_y,0).^2 );
    D_plus  = sqrt( max(D_moins_x,0).^2  + min(D_plus_x,0).^2 + max(D_moins_y,0).^2  + min(D_plus_y,0).^2 );
    NG = max(C,0).*D_moins + min(C,0).*D_plus;
end

