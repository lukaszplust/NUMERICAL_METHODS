clc
clear all
close all

warning('off','all')

load trajektoria1

N = 60;
xa = aproksymacjaWielomianowa(n, x, N);  % aproksymacja wspolrzednej x
ya = aproksymacjaWielomianowa(n, y, N);  % aproksymacja wspolrzednej y
za = aproksymacjaWielomianowa(n, z, N);  % aproksymacja wspolrzednej z

%ZADANIE 1 -> określenie lokazalizacji dronu
plot3(x,y,z,'o');
grid on;
axis equal;
xlabel("x [m]");
ylabel("y [m]");
zlabel("z [m]");

%ZADANIE 2

figure("Name","Aproksymacja wielomianowa polozenia drona");
plot3(x,y,z,'o');
hold on;
plot3(xa,ya,za,'g','lineWidth',4);
axis equal
grid on
title('Aproksymacja wielomianowa polozenia drona');
xlabel("x [m]");
ylabel("y [m]");
zlabel("z [m]");
saveas(gcf, "zadanie4.png");


%ZADANIE 5 -> N dla ktorego blad okreslenia lokalizacji drona jest najmniejszy 
clc
clear all
close all

warning('off','all')

load trajektoria2.mat
N = 60;


xa = aproksymacjaWielomianowa(n, x, N);  % aproksymacja wspolrzednej x
ya = aproksymacjaWielomianowa(n, y, N);  % aproksymacja wspolrzednej y
za = aproksymacjaWielomianowa(n, z, N);  % aproksymacja wspolrzednej z

figure("Name","Aproksymacja wielomianowa polozenia drona");
plot3(x,y,z,'o');
hold on;
plot3(xa,ya,za,'g','lineWidth',4);
axis equal
grid on
title('Aproksymacja wielomianowa polozenia drona');
xlabel("x [m]");
ylabel("y [m]");
zlabel("z [m]");
saveas(gcf, "zadanie5a.png");


%wykres błędu
err = [];
M = size(n,2);%liczba pomiarow drona

for N = 1:71

    counter = 0;
    xa = aproksymacjaWielomianowa(n, x, N);  % aproksymacja wspolrzednej x
    ya = aproksymacjaWielomianowa(n, y, N);  % aproksymacja wspolrzednej y
    za = aproksymacjaWielomianowa(n, z, N);  % aproksymacja wspolrzednej z
    
    err_x = sqrt(sum((x-xa).^2))/M;
    err_y = sqrt(sum((y-ya).^2))/M;
    err_z = sqrt(sum((z-za).^2))/M;
    counter = err_x + err_y + err_z;

    err(end+1) = counter;
end    

figure("Name", "Wykres bledu dla wielomianowej");
semilogy(err)
grid on
title("Blad aproksymacji wielomianowej");
xlabel("N");
ylabel("Wartosc bledu");
saveas(gcf,"zadanie5b.png");


%ZADANIE 6


clc
clear all
close all

warning('off','all')

load trajektoria2.mat
N = 60;


xa = aproksymacjaTrygonometryczna(n, x, N);  % aproksymacja wspolrzednej x
ya = aproksymacjaTrygonometryczna(n, y, N);  % aproksymacja wspolrzednej y
za = aproksymacjaTrygonometryczna(n, z, N);  % aproksymacja wspolrzednej z

figure("Name","Aproksymacja trygonometryczna polozenia drona");
plot3(x,y,z,'o');
hold on;
plot3(xa,ya,za,'g','lineWidth',4);
axis equal
grid on
title('Aproksymacja trygonometryczna polozenia drona dla N=60');
xlabel("x [m]");
ylabel("y [m]");
zlabel("z [m]");
saveas(gcf, "zadanie6a.png");


%wykres błędu
err = [];
M = size(n,2);%liczba pomiarow drona

for N = 1:71

    counter = 0;
    xa = aproksymacjaTrygonometryczna(n, x, N);  % aproksymacja wspolrzednej x
    ya = aproksymacjaTrygonometryczna(n, y, N);  % aproksymacja wspolrzednej y
    za = aproksymacjaTrygonometryczna(n, z, N);  % aproksymacja wspolrzednej z
    
    err_x = sqrt(sum((x-xa).^2))/M;
    err_y = sqrt(sum((y-ya).^2))/M;
    err_z = sqrt(sum((z-za).^2))/M;
    counter = err_x + err_y + err_z;

    err(end+1) = counter;
end    

figure("Name", "Wykres bledu dla trygonometrycznej");
semilogy(err)
grid on
title("Blad aproksymacji trygonometrycznej");
xlabel("N");
ylabel("Wartosc bledu");
saveas(gcf,"zadanie6b.png");

%ZADANIE 6 C
clc
clear all
close all

warning('off','all')

load trajektoria2.mat
N = 150;


xa = aproksymacjaTrygonometryczna(n, x, N);  % aproksymacja wspolrzednej x
ya = aproksymacjaTrygonometryczna(n, y, N);  % aproksymacja wspolrzednej y
za = aproksymacjaTrygonometryczna(n, z, N);  % aproksymacja wspolrzednej z

figure("Name","Aproksymacja trygonometryczna polozenia drona");
plot3(x,y,z,'o');
hold on;
plot3(xa,ya,za,'g','lineWidth',4);
axis equal
grid on
title('Aproksymacja trygonometryczna polozenia drona dla N=150');
xlabel("x [m]");
ylabel("y [m]");
zlabel("z [m]");
saveas(gcf, "zadanie6c.png");










