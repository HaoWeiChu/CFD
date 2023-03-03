
clc;clear;

x = -pi:0.05:pi;
f = @(x) cos(x)+sin(x);
plot(x,Ps(x),'r--',x,f(x),'b');
xlabel('Data number');
ylabel(' value');
title('Week1');
legend('Power Series','anlytical')


