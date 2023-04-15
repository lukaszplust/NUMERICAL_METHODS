function [xvect,xdif,fx,it_cnt] = secant(fun,a,b,eps)
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

%[x_k_back, x_k]
x_k_back = a;%prog dolny x_back
x_k = b; %prog gorny x_k


for i = 1:1000

    y_back = fun(x_k_back);%y_back to fun z progu dolnego, potrzebna do wzoru
    y = fun(x_k);% y to fun z progu gornego, potrzebna do wzoru

    pochodna = (y - y_back) / (x_k - x_k_back); % wzor 5 z pdf

    x_next = x_k - (y/pochodna); %wzor 4 z pdf
   
    y_next =  fun(x_next);
    
    xvect(i) = x_next;
    fx(i) = y_next;

    xdif(i) = abs(x_k - x_next); % to skąd sie wzieło

    if abs(fx(i)) < eps % tak samo jak to
        it_cnt = i;
        break;
    end

    x_k_back = x_k;
    x_k = x_next;
    
end
end

