# NeuralNetworks_SVMs
##### Holding my CA scripts

The task 1&2 part consists of 6 main scripts, namely, ‘mian.m’, ‘train_SVM.m’, ‘Get_alpha.m’, ‘Get_bo.m’, ‘Kernel.m’ and ‘Test_SVM.m’.<br /><br />
For train_SVM.m, the normalization process will be firstly executed, followed by two functions Get_alpha() and Get_bo(). For Get_alpha.m, this function is used to compute the alpha matrix using quadprog() function in MATLAB. And the Get_bo.m function is used to find the Wo and bo in the discriminant function using alpha matrix, labels of training data, training data, and support vectors. The function Kernel.m is used to compute the value of a chosen kernel.<br /><br />
The task12_ mian.m will call train and test function and compute and display some detailed information about the running process and results in the command window. Below is an example.<br /><br />
 ![Ex1 Ex1](https://github.com/alexch1/NeuralNetworks_SVMs.git/ex 1.png)
For task 3, you can directly run the main script called svm_main.m’for testing on the evaluation dataset. A typical output of this script is shown below.<br />
![Ex2 Ex2](https://github.com/alexch1/NeuralNetworks_SVMs.git/ex 2.png)
After running, you can use these code to compute the accuracy of my script.<br />

``` C
%% Use this part to compute the accuracy Delta=evallabel-real_evallabel; % say, real labels: real_evallabel 
acc = (numel(Delta)-sum(~~Delta(:)))/size(evallabel,1);
```
