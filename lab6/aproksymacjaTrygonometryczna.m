function [x_approx] = aproksymacjaTrygonometryczna(n, x, N)

n = n*(pi/max(n));
S = zeros(N+1,N+1);

% generacja macierzy S
%...
for i = 1:N+1%N+1 zeby nie pominac ostatniego wiersza
    for j = 1:N+1%N+1 zeby nie pominac ostatniej kolumny
        S(i, j) = sum(cos((i - 1).*n).*cos((j - 1).*n));
    end
end
%...

t = zeros(N+1,1);
for k = 1:N+1
    t(k,1) = sum(x.*cos((k-1)*n));
end


% Rozwiazanie ukladu rownan Sc = t
%...
c = S \ t;
%...

c1 = cos((0:N)'*n);

x_approx = (c1' * c).';

end
