function [alpha,fval,exitflag,bo] = train_SVM(train_data,train_label,type,p,C,MAX,MIN,N,thrd)
% This function is to trian data and determine the discriminant function.

% Normalize
for i = 1:size(train_data,2)
    Train_X (:,i) = 2*(train_data(:,i)-MIN)./(MAX-MIN)-1;
end

% Reset C
if ( (type==1) || (type==2) )
    C = 1e6;
end

% Get alpha using 'quadprog'
[alpha,fval,exitflag] = Get_alpha( C,train_label,Train_X,type,p);

% Find the support vector index and compute bo
[index_support,~]=find(alpha > thrd);                     
[bo] = Get_bo(alpha,train_label,Train_X,index_support,type,p);

end

