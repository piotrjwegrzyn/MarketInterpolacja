function [ y ] = wielomianLk( x, xk, k )
    y = 1;
    [~, N] = size(xk);
    for j = 1:N
        if j ~= k
            y = y*((x-xk(j))/(xk(k)-xk(j)));
        end
    end
end