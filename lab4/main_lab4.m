clc
clear all
close all

%na macu fn+shift+f7
%normalnie f9

% compute impedance
a = 0;   
b = 50;

[xvect, xdif, fx, it_cnt] = bisection(@compute_impedance,a,b,1e-12);

plot(1:it_cnt, xvect);
title("Impedancja, wartość przybliżonego rozwiązania - bisekcja");
ylabel("ω [rad/s]");
xlabel("Numer iteracji i");
saveas(gcf, 'impedancja_wartosci_przyblizen_bisekcja.png');%ok

semilogy(1:it_cnt, xdif);
title("Impedancja, zmiana wartości przybliżonego rozwiązania - bisekcja");
ylabel("ω w [rad/s]");
xlabel("Numer iteracji i");
saveas(gcf, "impedancja_zmiany_wartosci_bisekcja.png");%ok

[xvect, xdif, fx, it_cnt] = secant(@compute_impedance,a, b, 1e-12);

plot(1:it_cnt, xvect);
title("Impedancja, wartość przybliżonego rozwiązania - sieczne");
ylabel("Częstotoliwosc kątowa");
xlabel("Numer iteracji i");
saveas(gcf, 'impedancja_wartosci_przyblizen_sieczne.png');

semilogy(1:it_cnt, xdif);
title("Impedancja, zmiana wartości przybliżonego rozwiązania - sieczne");
ylabel("Różnca");
xlabel("Numer iteracji i");
saveas(gcf, "impedancja_zmiany_wartosci_sieczne.png");

% compute time
clc
clear all
close all
%
a = 1;
b = 60000;
eps = 10 ^ -3;

%compute time -> bisekcja
[xvect, xdif, fx, it_cnt] = bisection(@compute_time,a,b,eps);

plot(1:it_cnt, xvect);
title("Czas algorytmu, wartość przybliżonego rozwiązania - bisekcja");
ylabel("Liczba parametorw");
xlabel("Numer iteracji i");
saveas(gcf, 'czas_wartosc_przyblizenia_bisekcja.png');%ok

semilogy(1:it_cnt, xdif);
title("Czas algorytmu, zmiana wartości przybliżonego rozwiązania - bisekcja");
ylabel("Liczba parametrow");
xlabel("Numer iteracji i");
saveas(gcf, "czas_zmiany_wartosci_bisekcja.png");%ok

%compute time -> sieczne

[xvect, xdif, fx, it_cnt] = secant(@compute_time,a, b, eps);

plot(1:it_cnt, xvect);
title("Czas algorytmu, wartość przybliżonego rozwiązania - sieczne");
ylabel("Liczba parametorw");
xlabel("Numer iteracji i");
saveas(gcf, 'czas_przyblizenia_sieczne.png');%ok

semilogy(1:it_cnt, xdif);
title("Czas algorytmu, zmiana wartości przybliżonego rozwiązania - sieczne");
ylabel("Różnca");
xlabel("Numer iteracji i");
saveas(gcf, "czas_roznice_sieczne.png");%ok

% compute velocity
clc
clear all
close all
%prog
a = 0;
b = 50;

eps = 10^-12;


%compute velocity -> bisekcja
[xvect, xdif, fx, it_cnt] = bisection(@compute_velocity,a,b,eps);

plot(1:it_cnt, xvect);
title("Predkosc, wartość przybliżonego rozwiązania - bisekcja");
ylabel("Przyblizony czas");
xlabel("Numer iteracji i");
saveas(gcf, 'predkosc_wartosci_przyblizen_bisekcja.png');%ok

semilogy(1:it_cnt, xdif);
title("Predkosc, zmiana wartości przybliżonego rozwiązania - bisekcja");
ylabel("Roznica");
xlabel("Numer iteracji i");
saveas(gcf, "predkosc_zmiany_wartosci_bisekcja.png");%ok


%compute velocity -> sieczne
[xvect, xdif, fx, it_cnt] = secant(@compute_velocity,a,b,eps);

plot(1:it_cnt, xvect);
title("Predkosc, wartość przybliżonego rozwiązania - sieczne");
ylabel("Przyblizony czas");
xlabel("Numer iteracji i");
saveas(gcf, 'predkosc_wartosci_przyblizen_sieczne.png');%ok

semilogy(1:it_cnt, xdif);
title("Predkosc, zmiana wartości przybliżonego rozwiązania - sieczne");
ylabel("Roznica");
xlabel("Numer iteracji i");
saveas(gcf, "predkosc_zmiany_wartosci_sieczne.png");%ok

%zad C
options = optimset('Display','iter');
fzero(@tan,6, options);
fzero(@tan,4.5, options);

