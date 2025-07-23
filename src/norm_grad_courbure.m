function NG = norm_grad_courbure(Phi,C)

    Phi_ouest = [Phi(:,1), Phi(:, 1:end-1)]; 
    Phi_est = [Phi(:,2:end), Phi(:, end)];   
    Phi_nord = [Phi(2:end,:); Phi(end,:)];   
    Phi_sud = [Phi(1,:); Phi(1:end-1, :)];   

    D_x = Phi_est - Phi_ouest;  
    D_y = Phi_nord - Phi_sud;

    D = sqrt(D_x.^2 + D_y.^2);

    NG = C .* D;
end