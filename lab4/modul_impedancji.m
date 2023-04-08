function [value] = modul_impedancji( omega )
    M = 75;
    R = 725;
    C = 8e-5;
    L = 2;
    Z = 1 / sqrt(1 / (R^2) + (omega*C - (1 / (omega*L)))^2);
    value = Z - M;
end