clc
clear all


%------------------------------------------
load dane_jezioro   % dane XX, YY, FF sa potrzebne jedynie do wizualizacji problemu. 
surf(XX,YY,FF)
shading interp
axis equal
%------------------------------------------


%------------------------------------------
% Implementacja Monte Carlo dla f(x,y) w celu obliczenia objetosci wody w zbiorniku wodnym. 
% Calka = ?
% Nalezy skorzystac z nastepujacej funkcji:
% z = glebokosc(x,y); % wyznaczanie glebokosci jeziora w punkcie (x,y),
% gdzie x i y sa losowane
%------------------------------------------
N = 10^5;

x_min = 0;
x_max = 100;

y_min = 0;
y_max = 100;

z_min = -50;
z_max = 0;


points = 0; % points = punkty nad krzywa

for i = 1:N
    x = (x_max - x_min).*rand(N,1) + xmin;
    y = (y_max - y_min).*rand(N,1) + ymin;
    z = (z_max - z_min).*rand(N,1) + zmin;
     
    func = glebokosc(x,y);%wartosci funkcji w danym punkcie

    if z >= func
        points = points +1;
    end
end
value = (points/N) * ((x_max - x_min) * (y_max - y_min) * (z_max - z_min))




