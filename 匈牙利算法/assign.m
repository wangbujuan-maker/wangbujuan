function[f,D,G]=assign(B)
% 匈牙利算法实现
% u 和 v 是包含矩阵 B 沿每一行和每一列的最小值的向量
% 从矩阵 B 的相应行和列中减去这些最小值
n=length(B(:,1));
u=min(B,[],2);
f=sum(u);%用于记录最优值
B=B-repmat(u,1,n);
v=min(B,[],1);
f=f+sum(v);%用于记录最优值
B=B-repmat(v,n,1);
C=zeros(n);
while 1
    % 在当前矩阵 B 中找到零元素，并在辅助矩阵 C 中进行标记
    C(find(B==0))=1;
    % 计算辅助矩阵 C 中每行和每列的和，存储在 u 和 v 中。
    E=C;
    u=sum(C,2);
    v=sum(C);
    % 调用 assignz 函数，该函数通过修改 C、D、G、E、u 和 v 来找到零元素的匹配。
    D=zeros(1,n);
    G=zeros(1,n);
    [C,D,G,E,u,v]=assignz(C,D,G,E,u,v);
    num=-1;
    while num<0
        add=find(D==0);
        if isempty(add)
            return;
        end
        % 调用 assignln 函数，该函数寻找未被覆盖的行，并从中找到一条增广路径
        [D,G,E,SP,TP]=assignln(D,G,E,add);
        num=numel(SP)-numel(TP);
    end
    % 更新矩阵 B，通过减去路径中的最小值，并在路径上加上最小值
    add=setdiff(1:n,TP);
    m=min(min(B(SP,add)));
    B(SP,add)=B(SP,add)-m;
    add=setdiff(1:n,SP);
    B(add,TP)=B(add,TP)+m;
    % 更新总成本 f，通过累加路径上的最小值与路径长度的乘积
    f=f+m*num;
end
