function [xvect,xdif,fx,it_cnt] = bisection(fun,a,b,eps)
% fun - funkcja, ktorej miejsce zerowe bedzie poszukiwane
% [a,b] - przedzial poszukiwania miejsca zerowego
% eps - prog dokladnosci obliczen
% 
% xvect - wektor kolejnych wartosci przyblizonego rozwiazania
% xdif - wektor roznic pomiedzy kolejnymi wartosciami przyblizonego rozwiazania
% fx - wektor wartosci funkcji dla kolejnych elementow wektora xvect
% it_cnt - liczba iteracji wykonanych przy poszukiwaniu miejsca zerowego
it_cnt = 0;
xvect = [];
xdif = [];
fx = [];

for i = 1:1000
    c = (a + b)/2;
    fc = fun(c); % wartosci funkcji fun dla wartosci c
    
    xvect(i) = c;%dodanie c do xvect
    fx(i) = fc;%dodanie fc do fx
    
    
    xdif(i) = abs(it_cnt - c); %wektor roznic = |liczba iteracji - c(wartosc przedzialu)| 
    it_cnt = c;

    if abs(fc) < eps || abs(a-b) < eps 
        it_cnt = i;
        break;
    elseif fun(a) * fc < 0 %fun(a) -> fun(l) z pdf
        b = c; % r <- c
    else
        a = c; % l <- c
    end
end


end

