function [value] = compute_impedance( omega )

R = 725;
C = 8*10^-5;
L = 2;

module = 1/sqrt(1/(R^2) + (omega *C - 1 /(omega * L))^2);

value = module - 75;

end

