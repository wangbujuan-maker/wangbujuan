function [Distance] = getDistance(Agent,Goal)
    n=length(Agent(:,1));
    m=length(Goal(:,1));
    for i=1:n
        for j=1:m
            Distance(i,j)=(Agent(i,1)-Goal(j,1))^2+(Agent(i,2)-Goal(j,2))^2;
            Distance(i,j)=sqrt(Distance(i,j));%加权值和约束可以加在这里
        end
    end
end
