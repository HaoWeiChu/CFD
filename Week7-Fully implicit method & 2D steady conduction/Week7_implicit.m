clc;      % 清除Command Window
clear     % 清除workspace
close all % 關閉所有圖片
%%
%Ta = 100;%度C
Tb = 0;%度C
%A = 0.01;%m^2
K = 10;%W/mk
L = 2*10^-2;%m
n = 7;%(總點數)
lolc=10*10^6;
dx = L /(n-2);
time_end=40; %總模擬時間 (s)
dt=2; %(s) 注意Von Neumann stability analysis問題 2*D*dt/(dx^2)<1
time=0:dt:time_end;
time_step=time_end/dt;
time_step_int=round(time_step);
Z = K/dx;
ap=lolc*dx/dt;
A(1,1) = -ap;
A(1,2) = Z;
A(n-2,n-3) = Z;
A(n-2,n-2) = -ap;
%
temp_int=zeros(n-2,1);
temp_int(:,1)=200;
%save
X2=zeros(n-2,time_step_int);
B = zeros(n-2,1);
%%
for i=3:n-2
     A(i-1,i-2) = Z;
     A(i-1,i-1) = -ap;
     A(i-1,i) = Z;
end
%%
temp_int2 = zeros(n-2,1);
temp_int2(1,1) = temp_int(1,1)*(-ap+Z);
for i=2:n-3
    temp_int2(i,1)=temp_int(i,1)*(-ap+2*Z);
end
temp_int2(n-2,1)=temp_int(n-2,1)*(-ap+3*Z);
%%
ans1=A\temp_int2;
X2(:,1)=ans1(:,1);
%%
for j=1:time_step_int-1
%頭
    B(1,1) = (-ap+Z)*X2(1,j);
      for m=2:n-3
          B(m,1)=(-ap+2*Z)*X2(m,j);
      end
    B(end,1) = -(-ap+3*Z)*(Tb-X2(end,j));
    %B(end,1) = 0;
    XX=A\B;
    X2(:,j+1) = XX(:);
end
%矩陣計算
%X = A\B;
%加入邊界條件
X3=[X2(1,time_step_int);X2(:,end);Tb];
%距離等分
lengthpoint = zeros(n,1);
lengthpoint(1,1) = 0;
lengthpoint(n,1) = L;
lengthpoint(2,1) = lengthpoint(1,1)+dx/2;
for i=3:n-1
    lengthpoint(i,1) = lengthpoint(i-1,1)+dx;
end
%%解析解
alpha = K/lolc;
X4=zeros();%解析解之溫度項
LL=L/dx;
syms x
for j=1:time_end
    for m=1:n
        %lamda = ((2*x-1)*pi/(2*L));
        F = symsum((-1)^(x+1)/(2*x-1)*exp(-alpha*((2*x-1)*pi/(2*L))^2*j)*cos(((2*x-1)*pi/(2*L))*lengthpoint(m,1)),x,1,100);
        X4(j,m) = abs(4/pi*F*200) ;
    end
end
%%
figure
hold
plot(lengthpoint,X3,'-o')
plot(lengthpoint,X4(end,:))

xlabel('length(m)')
ylabel('temperature(°C)')