%------Gauss-Seidel-----%


%%
clc;      % 清除Command Window
clear     % 清除workspace
close all % 關閉所有圖片

%輸入係數矩陣
A = [2,1,1;-1,3,-1;1,-1,2];
b =[7,2,5];

% 迭代收斂誤差
maxerr = 1e-5; 
x = zeros(1,size(A,1));
%初始化誤差值,迭代次數初始化
err1 = Inf;
itr = 0;

while all(err1 > maxerr)
    x_old = x;
    for i =1:size(A,1)
        sum=0;
        for j=1:i-1
            sum  =sum+ A(i,j)*x(j);
        end
        for j = i+1:size(A,1)
            sum=sum+A(i,j)*x_old(j);
        end
        x(i) = (1/A(i,i))*(b(i)-sum);
    end
    itr = itr+1;
    y(itr,:)=x;
    err1 = abs(x_old-x);
end

itr
x