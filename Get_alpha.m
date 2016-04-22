function [alpha,fval,exitflag] = Get_alpha( C,train_label,Train_X,type,p)
N = size(Train_X,2);

for i = 1:N
    for j = 1:N
        H(i,j) = train_label(i,1)*train_label(j,1) * ...
            Kernel(Train_X(:,i),Train_X(:,j),type,p);
    end
end

f = -1*ones(N,1);
Aeq= train_label';
Beq=0;
lb=zeros(N,1);
ub=C*ones(N,1);
alpha0 = [];
options=optimset('LargeScale','off','MaxIter',1000);

[alpha,fval,exitflag]=quadprog(H,f,[],[],Aeq,Beq,lb,ub,alpha0,options);

end

