% t = 9999 
% L = 10
function F= y_t9999(x)
syms n
        F = symsum((2/(n*pi)*(-cos(n*pi)+1)*exp(-9999)*sin(n*pi*x/10)),n,1,100);