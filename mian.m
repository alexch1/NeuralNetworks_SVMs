clc; clear;
load train.mat

%% Load train data
maxVector = max(data,[],2);
minVector = min(data,[],2);
train_data= data;
train_label = label;
N = size(train_data,2);

%% Indicates the type of the kernels
Types = cell(1,3);
Types{1,1} = 'x1T*x2';              % type = 1         
Types{1,2} = '(x1T*x2+1)^p';        % type = 2         
Types{1,3} = '(x1T*x2+1)^p';        % type = 3         

%% Set parameters here                 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
type = 1;                                                        % 1,2 or 3
p = 5;                                                       % 2, 3, 4 or 5
C = 2.1;                                             % 0.1, 0.6, 1.1 or 2.1
thrd = 1e-6;

%% Train_SVM
[alpha,fval,exitflag,bo] = train_SVM(data,label,type,...
    p,C,maxVector,minVector,N,thrd); 
clear data;
clear label;

%% Choose test data here               !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
load test.mat, String = 'TEST';
%load train.mat, String = 'TRAIN';

%% Classification and test
test_data = data;
test_label = label;
[D] = Test_SVM(alpha,bo,train_data,train_label,...
    type,p,test_data,maxVector,minVector,N);

%% Compute the accuracy
Delta=D-test_label; 
acc = (numel(Delta)-sum(~~Delta(:)))/size(D,1);

%% Display detailed info
fprintf('SVM learning & testing process is done!\n');
fprintf('The kernel function is: %s\n',Types{1,type});
fprintf('Threshold for searching support vectors is: %.e\n',thrd);
fprintf('C is set to be: %.1f\n',C);
fprintf('p is set to be: %d\n',p);
fprintf('The test accuracy for %s dataset is: %.2f \n',String,acc);