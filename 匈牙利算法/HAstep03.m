Agent=[1,7;2,6;3,6;50,0;50,0;50,0;50,0;%2
    50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;
    50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;
    50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;
    50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;%5
    50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;
    50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;
    50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0;
    50,0;50,0;50,0;50,0;50,0;50,0;50,0;50,0];%15
Goal=[2,7;2,8;2,10;%5
    3,7;3,8;3,9;3,10;3,11;%6
    4,8;4,9;4,10;4,11;%4
    5,4;5,5;5,6;5,7;5,8;5,9;5,10;5,11;5,12;%9
    6,6;6,7;6,8;6,9;6,10;6,11;6,12;6,13;%9
    7,5;7,6;7,7;7,8;7,9;7,10;%6
    8,2;8,3;8,4;8,5;8,6;8,7;8,8;8,9;8,10;8,11;8,12;%11
    9,4;9,5;9,6;9,7;9,8;9,9;9,10;9,11;9,12;%9
    10,5;10,6;10,7;10,8;10,9;10,10;10,11;%7
    11,5;11,6;11,7;11,8;11,9;11,10;11,11;11,12;%8
    12,8;12,9;12,10;12,11;12,12;12,13;%6
    13,10;13,11;13,12;13,13;%4
    14,10;14,12;14,13;%3
    15,12;15,13];%2

% 添加虚拟节点
num_agents = size(Agent, 1);
num_goals = size(Goal, 1);
num_virtual_nodes = abs(num_agents - num_goals);
if num_agents > num_goals
    Goal = [Goal; ones(num_virtual_nodes, 2) * inf];
else
    Agent = [Agent; ones(num_virtual_nodes, 2) * inf];
end

matrix=getDistance(Agent,Goal);

% 执行匈牙利算法，返回分配结果
[f,D,G]=assign(matrix);


% 使用 plot 函数绘制了连接线，同时在图中用蓝色和红色分别标记位置
num=length(D);
for i=1:num
plot([Agent(i,1),Goal(D(i),1)],[Agent(i,2),Goal(D(i),2)])
hold on
plot(Agent(i,1),Agent(i,2),'.','Color','b','MarkerSize',50); 
hold on
plot(Goal(D(i),1),Goal(D(i),2),'.','Color','r','MarkerSize',50); 
hold on
end

set(gca,'XminorGrid','on');
set(gca,'YminorGrid','on');axis equal
hold off

%disp('Assignment:');
%disp(assignment);
%disp('Total Cost:');
%disp(cost);

function [Distance] = getDistance(Agent, Goal)
    n = length(Agent(:,1));
    m = length(Goal(:,1));
    Distance = zeros(n, m);
    for i = 1:n
        for j = 1:m
            Distance(i,j) = sqrt((Agent(i,1)-Goal(j,1))^2 + (Agent(i,2)-Goal(j,2))^2);
        end
    end
end

