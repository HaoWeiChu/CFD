%---------line 1----------------%
%　A矩陣 是  "北向" 以及 "南向"  係數矩陣 [公式 "As"Ts + "Ap"Tp + "An"Tn = Su]
% B矩陣 是 HEAT SOURCE [ "Su" ] 
A = [20,10,0,0;10,30,10,0;0,10,30,10;0,0,10,40];
B = [500;500;500;2500];
%因為 "line1" 左邊沒有溫度點(node)，因此 "C1" = 0 
%使用 TDMA 函式 進行係數矩陣運算
line1 = TDMA(A,B);

%--------line2------------%
% A2 矩陣 是  "北向" 以及 "南向"  係數矩陣 [公式 "As"Ts + "Ap"Tp + "An"Tn = Su]
% B2 矩陣 是 HEAT SOURCE [ "Su" ] 
% C2 矩陣 因為 node 5,6,7,8 旁邊有 node 1,2,3,4 
% C2 矩陣 是 "東向" 以及 "西向" 加上 Heat source 係數矩陣 [公式 "C" = AwTw + AeTe + Su] 
 
A2 = [30,10,0,0;10,40,10,0;0,10,40,10;0,0,10,50];
B2 = [0;0;0;2000];

n = length(line1);
for i = 1:n
    C2(i,1) = (line1(i)*10)+ B2(i);
end

line2 = TDMA(A2,C2);

%---------line3------------%
% C3 矩陣 算法 與 C2 相同
A3 = [20,10,0,0;10,30,10,0;0,10,30,10;0,0,10,40];
B3 = [0;0;0;2000];

for i = 1:n
    C3(i,1) = (line2(i)*10)+ B3(i);
end
line3 = TDMA(A3,C3);

%%
% 將 line 1,2,3 的溫度 依序寫入溫度的矩陣 
temp(1,1) = line1(4);
temp(2,1) = line1(3);
temp(3,1) = line1(2);
temp(4,1) = line1(1);

temp(1,2) = line2(4);
temp(2,2) = line2(3);
temp(3,2) = line2(2);
temp(4,2) = line2(1);

temp(1,3) = line3(4);
temp(2,3) = line3(3);
temp(3,3) = line3(2);
temp(4,3) = line3(1);

% plot contour [繪製 溫度分布圖]
templimits = [27 80];
temp_distribution = heatmap(temp);
temp_distribution.FontSize = 15;
temp_distribution.Title = '2D line by line TDMA';
colormap(jet(512))
x = [1 4];
y = [1 4];
%imagesc(x,y,temp,templimits);
colorbar;

%% 暴力法，條列式 列出節點與溫度
% for loop in text [將每個節點的 溫度顯示出來]
% text(1,4,['node 1: ' newline ' 52.13']);
% text(1,3,['node 2: ' newline ' 54.25']);
% text(1,2,['node 3: ' newline ' 60.64']);
% text(1,1,['node 4: ' newline ' 77.66']);
% text(2.5,4,['node 5: ' newline ' 27.38']);
% text(2.5,3,['node 6: ' newline ' 30.03']);
% text(2.5,2,['node 7: ' newline ' 38.47']);
% text(2.5,1,['node 8: ' newline ' 63.23']);
% text(4,4,['node 9: ' newline ' 32.8']);
% text(4,3,['node 10: ' newline ' 38.21']);
% text(4,2,['node 11: ' newline ' 51.81']);
% text(4,1,['node 12: ' newline ' 78.76']);

% 左手邊的條狀圖

