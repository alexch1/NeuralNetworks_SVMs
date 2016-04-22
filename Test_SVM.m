function [D] = Test_SVM(alpha,bo,train_data,train_label,type,p,test_data,MAX,MIN,N)
% This function is to classify the new data.
for i = 1:size(train_data,2)
    Train_X (:,i) = 2*(train_data(:,i)-MIN)./(MAX-MIN)-1;
end
for i = 1:size(test_data,2)
    Test_X (:,i) = 2*(test_data(:,i)-MIN)./(MAX-MIN)-1;
end

D = zeros(size(test_data,1),1);

for j = 1: size (Test_X,2)
    gx = 0;
    gxi = 0;
    for i = 1:N
        gxi = gxi + alpha(i,1)*train_label(i,1)*...
            Kernel(Train_X(:,i),Test_X(:,j),type,p);
    end
    gx = gxi + bo; 
    if (gx > 0)
        D(j,1) = 1;
    else
        D(j,1) = -1;
    end
end
end

