function[C,D,G,E,u,v]=assignz(C,D,G,E,u,v)%��Ƕ�����
while any(u)
    %  % �ҵ���һ��uΪ1����
    row=find(u==1,1);
    while row
        % �ҵ������е�һ�������Ϊ1����
        col=find(C(row,:)==1);
        % ����ƥ���ϵ
        D(row)=col;
        G(col)=row;
        E(row,col)=0;
        % ����u��v
        u=u-C(:,col);
        % ������Ӧ���к���
        v(col)=0;
        C(:,col)=0;
        row=find(u==1,1);
    end

    % �ҵ���һ��vΪ1����
    col=find(v==1,1);
    while col
        % �ҵ������е�һ�������Ϊ1����
        row=find(C(:,col)==1,1);

        % ����ƥ���ϵ
        D(row)=col;
        G(col)=row;
        E(row,col)=0;
        v=v-C(row,:);
        u(row)=0;
        C(row,:)=0;
        col=find(v==1,1);
    end
     % ���u���з���Ԫ�أ����ҵ�u��v�ķ���Ԫ�ص�λ��
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
