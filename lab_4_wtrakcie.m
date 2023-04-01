%ZAD 1

%przedzial izolacji <1,6000>
x = 1;
y = 6000;
eps = 10^-3;

%bisection
% xvect -> wektor kolejnych wartosci przyblizonego rozwiazania
% xdif->wektor róznic pomiedzy kolejnymi wartosciami przyblizonego rozwiazania
%fx -> wektor wartości funkcji dla kolejnych elementów wektora xvect
% it_cnt - liczba iteracji wykonanych przy poszukiwaniu miejsca zerowego
[xvect, xdif, fx, int_cnt] = bisect(x,y,eps, @compute_parameters_number);

semilogy(1:it_cnt, xvect);
title("1.1");
ylabel("Przybliżona wartość prędkości kątowej w [rad/s]");
xlabel("Numer iteracji i");
saveas(gcf, 'zad1_1_186437_przyblizenia_bisekcja.png');
