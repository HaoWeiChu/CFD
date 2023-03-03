% plot transient simulation results

%% Define the explicit data at time =40,80,120
% time _step =2, so time= '40' is 'X2(:,20)'
explicit_t40 =X2(:,20);
explicit_t80 =X2(:,40);
explicit_t120 =X2(:,60);

% define the rod length in 5 points
length1 =lengthpoint(2:6);

%% Define the analytical data at time =40,80,120
analytical_t40= X4(40,:);
analytical_t80= X4(80,:);
analytical_t120= X4(120,:);


%% plot results
figure
hold
plot(length1,explicit_t40,'--ro')
plot(lengthpoint,analytical_t40,'-rx')

plot(length1,explicit_t80,'--bo')
plot(lengthpoint,analytical_t80,'-bx')

plot(length1,explicit_t120,'--go')
plot(lengthpoint,analytical_t120,'-gx')
legend('explicit t= 40','analytical t= 40','explicit t= 80','analytical t= 80','explicit t= 120','analytical t= 120')
xlabel('length(m)')
ylabel('temperature(°C)')