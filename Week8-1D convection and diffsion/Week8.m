clc;      % 清除Command Window
clear     % 清除workspace
close all % 關閉所有圖片
%%
u = 0.1;%速度
fi_0 = 1;%通量
fi_L = 0;%通量
gamma = 0.1;%kg/m^3
lol = 1;%密度
L = 1;%m
n = 7;%(總點數)
dx = L /(n-2);
%%
%-------AX=B，求X---------%
F = lol*u;
D = gamma/dx;
ch1 = [F 0];
ch2 = [-1*F 0];
M1 = max(ch1);
M2 = max(ch2);
% a_E, a_W 是中間矩陣的 東邊和西邊 
a_W = D+M1;
a_E = D+M2;
A=zeros(n-2,n-2);
%% 頭尾
%---------The parameters in Matrix equation--------%
% StrA 是 係數矩陣的參數
StrA = ["3D+F" "-D" 0 0 0; "-D-F" "2D+F" "-D" 0 0; 0 "-D-F" "2D+F" "-D" 0; 0 0 "-D-F" "2D+F" "-D"; 0 0 0 "-D-F" "3D+F"];
A(1,1) = 2*D+M1+a_E;
A(1,2) = -D;
A(n-2,n-3) = -(a_W);
A(n-2,n-2) = 2*D+M2+a_W;
%中間
for i=3:n-2
     A(i-1,i-2) = -a_W;
     A(i-1,i-1) = a_W+a_E;
     A(i-1,i) = -a_E;
end
%B BC
B = zeros(n-2,1);
B(1,1) = (2*D+M1)*fi_0;
B(n-2,1) = (2*D+M2)*fi_L;
%% 矩陣計算
X = A\B;
%%
%加入邊界條件[X的結果沒有邊界條件，將初始點放入]
X2 = zeros(n,1);
X2(1,1) = fi_0;
X2(n,1) = fi_L;
for i=2:n-1
    X2(i,1)=X(i-1,1);
end
F = transpose(X2);
disp(F);
%距離等分[]
lengthpoint = zeros(n,1);
lengthpoint(1,1) = 0;
lengthpoint(n,1) = L;
lengthpoint(2,1) = lengthpoint(1,1)+dx/2;
for i=3:n-1
    lengthpoint(i,1) = lengthpoint(i-1,1)+dx;
end
%% 解析解
C=zeros(n,1); %解析解答案儲存格
C(1) = fi_0;
C(n) = fi_L;
for i = 2:n-1
    C(i) = ((exp(lol*u*lengthpoint(i,1)/gamma)-1)/(exp(lol*u*L/gamma)-1))*(fi_L-fi_0)+fi_0 ;
end
%%
figure
hold
plot(lengthpoint,X2,'-o')
plot(lengthpoint,C,'-r')
legend({ 'upwind解' , '解析解' }, 'Location' , 'northeast' )
xlabel('length(m)')
ylabel('flux')