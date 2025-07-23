function [N] = norm_grad(grad_u)

N = sqrt(sum(grad_u.^2,3));