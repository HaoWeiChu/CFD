% t = 1 
% L = 10
function F= y(x)
syms n
        F = symsum((2/(n*pi)*(-cos(n*pi)+1)*exp(-4*n^2*pi^2/10^2*1)*sin(n*pi*x/10)),n,1,100);