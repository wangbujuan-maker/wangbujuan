function[C,D,G,E,u,v]=assignz(C,D,G,E,u,v)%标记独立零
while any(u)
    %  % 找到第一个u为1的行
    row=find(u==1,1);
    while row
        % 找到该行中第一个被标记为1的列
        col=find(C(row,:)==1);
        % 更新匹配关系
        D(row)=col;
        G(col)=row;
        E(row,col)=0;
        % 更新u和v
        u=u-C(:,col);
        % 清零相应的行和列
        v(col)=0;
        C(:,col)=0;
        row=find(u==1,1);
    end

    % 找到第一个v为1的列
    col=find(v==1,1);
    while col
        % 找到该列中第一个被标记为1的行
        row=find(C(:,col)==1,1);

        % 更新匹配关系
        D(row)=col;
        G(col)=row;
        E(row,col)=0;
        v=v-C(row,:);
        u(row)=0;
        C(row,:)=0;
        col=find(v==1,1);
    end
     % 如果u仍有非零元素，则找到u和v的非零元素的位置
    if any(u)
        row=find(u,1);
        col=find(C(row,:),1);
        D(row)=col;
        G(col)=row;
        E(row,col)=0;
        u=u-C(:,col);
        u(row)=0;
        v=v-C(row,:);
        v(col)=0;
        C(:,col)=0;
        C(row,:)=0;
    else return;
    end
end
