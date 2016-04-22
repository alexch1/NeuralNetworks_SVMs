function [bo] = Get_bo(alpha,train_label,Train_X,index_support,type,p)
% This function is used to find the Wo and bo in the discriminant
% function using alpha matrix,train_label,Train X, and support vector.

N = size(Train_X,2);
for i = 1:size(index_support,1)
    ds(1,i) = train_label(index_support(i,1),1);
    Xs(:,i) = Train_X(:,index_support(i,1));
end

switch type
    case 1
%         for i = 1:N
%             Wo = alpha(i,1)*train_label(i,1)*Train_X(:,i);
%         end
        Wo = Train_X*(alpha.*train_label);
        bo = 1/ds(1,1) - Wo'*Xs(:,1);
        
    case 2
%         for i = 1:N
%             Wo = alpha(i,1)*train_label(i,1)*Train_X(:,i);
%         end
%         Wo = Train_X*(alpha.*train_label);
%         boi = 0;
%         for i = 1:size(index_support,1)
%             boi = boi + 1/ds(1,i) - Wo'*Xs(:,i);
%         end
%         bo = boi/size(index_support,1);
        K = Kernel(Train_X, Xs(:,1),type,p);
        bo = ds(1,1) - K'*(alpha.*train_label);

    case 3
%         boi = 0;
%         boj = 0;
%         for j= 1:size(index_support,1)
%             for i = 1:N
%                 boi = boi + alpha(i,1)*train_label(i,1)*...
%                     Kernel(Xs(:,j),Train_X(:,i),type,p);
%             end
%             boj = boj + 1/ds(1,j) - boi;
%         end
%         bo = boj/size(index_support,1);
        for i = 1:size(index_support,1)
            K = Kernel(Train_X, Xs(:,i),type,p);
            b(i) = ds(1,i) - K'*(alpha.*train_label);
        end
        bo = sum(b)/length(b);
end     
end



























        
