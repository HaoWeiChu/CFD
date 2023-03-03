%-----------*1-D Heat Conduction in rod*--------------%
clc;      % 清除Command Window
clear     % 清除workspace
close all % 關閉所有圖片
%----初始條件----%
Ta = 100;%度C
Tb = 500;%度C
A = 0.01;%m^2
K = 1000;%W/mk
L = 0.5;%m
n = 7;%(總點數)
dx = L /(n-2);
%%

%-------aptp-awtw-aete = Su，求t---------%
%---假設成係數是A, 溫度t是x, Ax=Su, 求x ----%
Z = K*A/dx;
A=zeros(n-2,n-2);
%頭尾
A(1,1) = 3*Z;
A(1,2) = -Z;
A(n-2,n-3) = -Z;
A(n-2,n-2) = 3*Z;
%中間
for i=3:n-2
     A(i-1,i-2) = -Z;
     A(i-1,i-1) = 2*Z;
     A(i-1,i) = -Z;
end
%Su
Su = zeros(n-2,1);
Su(1,1) = 2*Z*Ta;
Su(n-2,1) = 2*Z*Tb;

%%
% TDMA[錯誤方法，TDMA內不可以有斜除法]
% determines n
%n = length(Su);
    
% preallocates x
% x = zeros(n,1);
%     
% % forward elimination
% for i = 2:n
%         w = A(i,i-1)/A(i-1,i-1);
%         A(i,i) = A(i,i)-w*A(i-1,i);
%         Su(i) = Su(i)-w*Su(i-1);
% end
%     
%     % backward substitution
%     x(n) = Su(n)/A(n,n);
% for i = (n-1):(-1):1
%         x(i) = (d(i)-A(i,i+1)*x(i+1))/A(i,i);
% end
%%
%矩陣計算
%----利用"\"進行矩陣, A\Su 表示矩陣元素 Su(i,j)/A(i,j) 的矩阵-----%
X = A\Su;
F = transpose(X);
disp(F);
x = [Ta,F];
x1= [x,Tb];

lengthpoint = zeros(n,1);
lengthpoint(1,1) = 0;
lengthpoint(n,1) = L;
lengthpoint(2,1) = lengthpoint(1,1)+dx/2;
for i=3:n-1
    lengthpoint(i,1) = lengthpoint(i-1,1)+dx;
end
%%
figure
hold on;
plot(lengthpoint,x1,'r x')
% n=7(5 nodes +Ta+Tb)

xlabel('lenth(m)')
ylabel('temperature(°C)')

%%
% the exact solution (T = 800x +100)
y = 800*lengthpoint+100;
plot(lengthpoint,y,'g-o')
legend('Numerical',"exact solution")
hold off