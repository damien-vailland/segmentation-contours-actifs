function evolution_segmentation(gI, Phi, C, alpha, n, nb_affiche, dt)

    for t = 0:n-1
        
        K = courbure(Phi);
        v = gI .* (alpha * K + norm_grad_seg(Phi,C));
        Phi = Phi + dt * v;
        
        
        if (mod(t,nb_affiche)==0)
            niveau0 = extraction_niveau0(Phi);
            subplot(1,3,3);
            imshow(niveau0,[]);title('Niveau zéro');
            subplot(1,3,2);
            imshow(Phi,[]);title('Phi');
            subplot(1,3,1);
            surf(double(Phi));title('Phi'); axis([0 100 0 100 -20 40]);
            drawnow;
        end
    end
end

