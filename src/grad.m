function G = grad(u)

G = zeros(size(u,1),size(u,2),2);
G(1:end-1,:,1) = u(2:end,:) - u(1:end-1,:);
G(:,1:end-1,2) = u(:,2:end) - u(:,1:end-1);