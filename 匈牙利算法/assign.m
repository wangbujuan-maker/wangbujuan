function[f,D,G]=assign(B)
% �������㷨ʵ��
% u �� v �ǰ������� B ��ÿһ�к�ÿһ�е���Сֵ������
% �Ӿ��� B ����Ӧ�к����м�ȥ��Щ��Сֵ
n=length(B(:,1));
u=min(B,[],2);
f=sum(u);%���ڼ�¼����ֵ
B=B-repmat(u,1,n);
v=min(B,[],1);
f=f+sum(v);%���ڼ�¼����ֵ
B=B-repmat(v,n,1);
C=zeros(n);
while 1
    % �ڵ�ǰ���� B ���ҵ���Ԫ�أ����ڸ������� C �н��б��
    C(find(B==0))=1;
    % ���㸨������ C ��ÿ�к�ÿ�еĺͣ��洢�� u �� v �С�
    E=C;
    u=sum(C,2);
    v=sum(C);
    % ���� assignz �������ú���ͨ���޸� C��D��G��E��u �� v ���ҵ���Ԫ�ص�ƥ�䡣
    D=zeros(1,n);
    G=zeros(1,n);
    [C,D,G,E,u,v]=assignz(C,D,G,E,u,v);
    num=-1;
    while num<0
        add=find(D==0);
        if isempty(add)
            return;
        end
        % ���� assignln �������ú���Ѱ��δ�����ǵ��У��������ҵ�һ������·��
        [D,G,E,SP,TP]=assignln(D,G,E,add);
        num=numel(SP)-numel(TP);
    end
    % ���¾��� B��ͨ����ȥ·���е���Сֵ������·���ϼ�����Сֵ
    add=setdiff(1:n,TP);
    m=min(min(B(SP,add)));
    B(SP,add)=B(SP,add)-m;
    add=setdiff(1:n,SP);
    B(add,TP)=B(add,TP)+m;
    % �����ܳɱ� f��ͨ���ۼ�·���ϵ���Сֵ��·�����ȵĳ˻�
    f=f+m*num;
end
