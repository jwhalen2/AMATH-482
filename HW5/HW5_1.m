clear all; close all; clc;

load('fashion_mnist.mat')
%%
X_train = im2double(X_train);
X_test = im2double(X_test);

X_train = reshape(X_train,[60000 28 28 1]);
X_train = permute(X_train,[2 3 4 1]);

X_test = reshape(X_test,[10000 28 28 1]);
X_test = permute(X_test,[2 3 4 1]);

X_valid = X_train(:,:,:,1:5000);
X_train = X_train(:,:,:,5001:end);

y_valid = categorical(y_train(1:5000))';
y_train = categorical(y_train(5001:end))';
y_test = categorical(y_test)';

% Part 1
layers = [
    imageInputLayer([28 28 1],"Name","imageinput")
    fullyConnectedLayer(16)
    reluLayer 
    fullyConnectedLayer(32)
    reluLayer
    fullyConnectedLayer(64)
    reluLayer   
    fullyConnectedLayer(10)
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];

% Part 2
layers_LeNet5 = [
    imageInputLayer([28 28 1],"Name","imageinput")
    convolution2dLayer([5 5],6,"Name","conv_1","Padding","same")
    tanhLayer("Name","tanh_1")
    averagePooling2dLayer([2 2],"Name","avgpool2d_1","Padding","same","Stride",[2 2])
    convolution2dLayer([5 5],16,"Name","conv_2")
    tanhLayer("Name","tanh_3")
    averagePooling2dLayer([2 2],"Name","avgpool2d_2","Padding","same","Stride",[2 2])
    convolution2dLayer([5 5],120,"Name","conv_3")
    tanhLayer("Name","tanh_2")
    fullyConnectedLayer(84,"Name","fc_1")
    tanhLayer("Name","tanh_4")
    fullyConnectedLayer(10,"Name","fc_2")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];

layers_LeNet5mut = [
    imageInputLayer([28 28 1],"Name","imageinput")
    convolution2dLayer([3 3],16,"Name","conv_1","Padding","same")
    batchNormalizationLayer("Name","batchnorm_1")
    eluLayer(1,"Name","elu_1")
    maxPooling2dLayer([2 2],"Name","maxpool_2","Padding","same","Stride",[2 2])
    convolution2dLayer([3 3],32,"Name","conv_2","Padding","same")
    batchNormalizationLayer("Name","batchnorm_2")
    eluLayer(1,"Name","elu_2")
    maxPooling2dLayer([2 2],"Name","maxpool_1","Padding","same","Stride",[2 2])
    convolution2dLayer([3 3],64,"Name","conv_3","Padding","same")
    batchNormalizationLayer("Name","batchnorm_4")
    eluLayer(1,"Name","elu_3")
    fullyConnectedLayer(64,"Name","fc_2")
    batchNormalizationLayer("Name","batchnorm_3")
    eluLayer(1,"Name","elu_4")
    fullyConnectedLayer(10,"Name","fc_1")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];
%%
options = trainingOptions('adam', ...
    'MaxEpochs',10,...
    'InitialLearnRate',15e-3, ...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropPeriod',1,...
    'LearnRateDropFactor',0.1,...
    'L2Regularization',1e-4, ...
    'ValidationData',{X_valid,y_valid}, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(X_train,y_train,layers,options);
%%
figure(1)
y_pred = classify(net,X_train);
plotconfusion(y_train,y_pred)

%% Test classifier
figure(2)
y_pred = classify(net,X_test);
plotconfusion(y_test,y_pred)