K_tab = [5,15,25,30];

[XX, YY] = meshgrid(linspace(0,1,101), linspace(0,1,101));

for K = K_tab

    [x, y, f, xp, yp] = lazik(K);
    
    sgtitle('K = ' + string(K));

    %wykres toru ruchu lazika
    subplot(2,2,1);
    plot(xp,yp,"-o", 'linewidth', 2);

    title("Tor ruchu lazika");
    xlabel('x[m]');
    ylabel('y[m]');
    grid on;
    
    %wykres wartosci probek
    subplot(2,2,2);
    surf(reshape(x,K,K),reshape(y,K,K),reshape(f,K,K));
    shading flat % bez tego wyglada to lepiej XD
    title("Wartosci probek");
    xlabel("x[m]");
    ylabel("y[m]");
    zlabel("f(x,y)");
    grid on;

    %wykres interpolacji wielomianowej

    [p] = polyfit2d(x,y,f);
    [FP] = polyval2d(XX,YY,p);


    subplot(2,2,3);
    surf(XX, YY, FP);
    shading flat;
    title("Interpolacja wielomianowa");
    xlabel("x[m]");
    ylabel("y[m]");
    zlabel("f(x,y)");
    grid on;

    %interpolacja trygonometryczna

    [t] = trygfit2d(x,y,f);
    [FT] = trygval2d(XX,YY,t);
    
    subplot(2,2,4);
    surf(XX, YY, FT);
    shading flat;
    title("Interpolacja trygonometryczna");
    xlabel("x[m]");
    ylabel("y[m]");
    zlabel("f(x,y)");
    grid on;

    saveas(gcf, "ZAD_1_K = " + K+ ".png");
end
