function[D,G,E,SP,TP]=assignln(D,G,E,un)%作最少的直线覆盖所有零
S=un;
SP=[];
TP=[];
F=zeros(numel(D));
while ~isempty(S)
    [null,T]=find(E(S,:));
    T=setdiff(T,TP);
    if isempty(T)
        SP=union(SP,S);
        return;
    end
    F(S,T)=E(S,T);
    SP=union(SP,S);
    TP=union(TP,T);
    Stemp=G(T);
    P=find(Stemp==0);
    if ~isempty(P)
        Tun=T(P);
        [r,c]=find(E(S,Tun),1);
        row=S(r);
        col1=Tun(c);
        while 1
            E(row,col1)=0;
            col2=D(row);
            D(row)=col1;
            G(col1)=row;
            if ismember(row,un)
                break;
            end
            E(row,col2)=1;
            row=find(F(:,col2),1);
            col1=col2;
        end
        SP=[];
        return;
    end
    S=Stemp;
end
SP=[];
