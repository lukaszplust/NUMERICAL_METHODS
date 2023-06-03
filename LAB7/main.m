
clc
clear all
close all

load P_ref.mat

%CZY TO NA PEWNO O TO CHODZILO Z TYM WYKRESEM XDD??

iterator = 1;
fmin = awaria(0);
fmax = awaria(0);

for value = 0:00.2:20 %wartosci od 0 do 20 z krokiem 001
    fun(iterator) = awaria(value);
    iterator = iterator + 1;
    if awaria(value) < fmin
        fmin = awaria(value);
    end
    if awaria(value) > fmax
        fmax = awaria(value);
    end
end
plot(0:00.2:20,fun)
saveas(gcf, 'gestosc.png')

%deklaracja
a = 0;
b = 5;
x = 5:50:10^4;


% METODA PROSTOKATOW
tic;
error = []; %przechowywana wartosc bledu

for N = 5:50:10^4% N przyjmuje wartosci od 5 do 10^10 z krokiem 50
    
    dx = b / N; % szerokosc przedziału
    sum = 0;

    for i = 1:N
        %mid = %srodek przedziału i służy do obliczenia wartosci funkcji
        %awaria w tym punkcie
        %(i-1) *dx -> lewa krawedz przedziału
        % i * dx -> prawa krawedz przedziału
        %suma krawedzi podzielona na 2 daje środek :)) ez
        mid = ((i - 1) * dx + i * dx) / 2;

        %dx szerokosc danego przedziału
        % dx * awaria w punkcie srodkowym = pole prostokata o szerokosci dx
        %sum przechowuje sume wartosci funkcji dla wszystkich przedzialow
        sum = sum + dx * awaria(mid);
    end
    error = [error, abs(sum - P_ref)];%odejmuje obliczona wartosc referencyjna od obliczonej sumy
    prostokat_time = toc;
end

figure();
loglog(x, error);
title('Bład - metoda prostokatow');
xlabel('Liczba przedziałow');
ylabel('Wartosc błedu');
saveas(gcf, 'metoda_prostokatow.png')



%METODA TRAPEZOW
tic;
error = [];

for N = 5:50:10^4

    dx = (b - a) / N; %szerokosc przedziału
    sum = 0;

    for i = 1:N
        % lewa krawedz przedzialu -> a + (i-1) * dx
        var = awaria(a + (i - 1) * dx); % obliczam wartosc funkcji dla lewej krawedzi przedzialu

        % prawa krawedz przedzialu -> a + i * dx
        var = var + awaria(a + i * dx); %obliczam wartosc funkcji dla prawej krawedzi przedzialu
        var = var * dx / 2; % obliczam pole trapezu przez przemnozenie razy dx/2(pole trapezu = przyblizona wartosc calki)
        sum = sum + var;%sumuje wartosci pol trapezow dla wszystkich przedzialow
    end
    error = [error, abs(sum - P_ref)];%odejmuje obliczona wartosc referencyjna od obliczonej sumy
    trapez_time = toc;
end

figure();
loglog(x, error);
title('Bład - metoda trapezow');
xlabel('Liczba przedziałow');
ylabel('Wartosc błedu');
saveas(gcf, 'metoda_trapezow.png')


% METODA SIMPSONA
tic;
error = [];

for N = 5:50:10^4

    
    dx = (b - a) / N; % szerokosc przedzialu
    sum = 0;

    for i = 1:N
        sum = sum + awaria(a + (i - 1) * dx); % wartosc funkcji dla lewej krawedzi
        % a + (i - 1) * dx + a + i*dx = suma lewej i prawej krawedzi
        % (a + (i - 1) * dx + a + i*dx) / 2) = podzielone przez 2 wyznacza
        % srodek przedzialu
        % wyznaczam wartosc funkcji dla srodka przedzialu i mnoze razy 4
        
        %W metodzie Simpsona, wartości funkcji w środkowych punktach przedziałów są podwajane, dlatego mnoże przez 4
        sum = sum + 4 * awaria((a + (i - 1) * dx + a + i*dx) / 2);

        sum = sum + awaria(a + i * dx);%do sumy dodaje wartosc prawej krawedzi przedzialu
    end
    sum = sum * dx / 6; % dx/6 -> wspolczynnik skalujacy charakterystyczny dla metody Simpsona
    error = [error, abs(sum - P_ref)];%odejmuje obliczona wartosc referencyjna od obliczonej sumy
    simpson_time = toc;
end
figure();
loglog(x, error);
title('Bład - metoda Simpsona');
xlabel('Liczba przedziałow');
ylabel('Wartosc błedu');
saveas(gcf, 'metoda_simpsona.png')

% MONTE CARLO
tic;
error = [];
fmin = 0;
fmax = awaria(5);%fmax jest to wartosc funkcji awaria dla argumentu = 5

% N -> liczba wylosowanych punktow
% b -> szerokosc przedzialu w ktorym probkowane sa punkty


for N = 5:50:10^4

    N_1 = 0; %liczba punktow ktore spelniaja warunek(punkty pod krzywa)
    
    for i = 1:N%generowanie losowych punktow i sprawdzanie czy spelnia warunek

        %probkowanie losowe
        x_monte = rand() * b;%zakres losowania -> [0,b]
        y = rand() * fmax; % zakres losowania -> [0,fmax]

        %sprawdzam czy losowa wartosc y znajduje się miedzy fmin a awaria(x)
        %jesli tak to oznacza, ze wylosowany punkt (x,y) spelnia warunek
        
        %poprzez takie probkowanie i sprawdzanie warunku obliczane jest
        %przyblizenie wartosci calki
        if y >= fmin && y <= awaria(x_monte)
            N_1 = N_1 + 1;
        end
    end
    
    % (N_1 / N) -> prawdopodobienstwo, ze losowo wybrany punkt spelnia
    % warunek

    %((N_1 / N)) * b -> średnia dlugosc przedziału, w ktorym punkty
    %spelniaja warunek

    % ((N_1 / N)) * b * fmax -> skalowanie sredniej dlugosci przedzialu
    % przez maksymalna wartosc funkcji, co jest przyblizona wartoscia całki
    % zakres [b. fmax]
    P = (N_1 / N) * b * fmax;%przyblizona wartosc całki
    error = [error, abs(P - P_ref)];
    monte_carlo_time = toc;
end

figure();
loglog(x, error);
title('Bład - metoda Monte-Carlo');
xlabel('Liczba przedziałow');
ylabel('Wartosc błedu');
saveas(gcf, 'metoda_monte_carlo.png')

%wykresy czasu

N = 10^7;
figure();

X = categorical({'Prostokątow','Trapezow','Simpsona','Monte Carlo'});
X = reordercats(X,{'Prostokątow','Trapezow','Simpsona','Monte Carlo'});%ustawienie w kolejnosci

bar(X,[prostokat_time,trapez_time,simpson_time,monte_carlo_time])

xlabel('Metoda')
ylabel('Czas [s]')
title('Czas trwania metod')
saveas(gcf, 'wykresy_czasow.png','png');


%funkcja awarii

function fun_awaria  = awaria(t)
    fun_awaria = (1/(3 * sqrt(2 * pi))) * exp(-(t - 10)^2 / (2 * 3^2));
end

