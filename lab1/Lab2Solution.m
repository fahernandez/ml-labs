clear all;
close all;
addpath '/home/fabian/Documents/Nottingham/ML/ml-labs/lab1';
%% KNN
load ("/home/fabian/Documents/Nottingham/ML/ml-labs/lab1/forest_covers.mat");
% load the first 1000 datapoint for training
x_train=full(training_vectors(1:1000,:));
y_train= training_labels(1:1000);

% use part of the data for testing
x_test=full(training_vectors(2001:3000,:));
y_test= training_labels(2001:3000);

% remove all zero columns
x_train( :, all( ~any( x_train ), 1 ) ) = [];
x_test( :, all( ~any( x_train ), 1 ) ) = [];

% Use KNN for prediction set k=5 but could try other numbers
k=5;   %  5 nearest neighbours
y_predicted=knn(x_train, y_train, x_test, k);

% Evaluation by comparing y_predicted to y_test
classficiationAccuracy= length(find(abs(y_predicted-y_test)==0))/ length(y_predicted);

% Look at the first material of lab introduction in week 1 and implement
% true positive, false positive, true negative, false negative and confusion table yourself.


%% K-means  Try to run multiple times and observe the results

load ("/home/fabian/Documents/Nottingham/ML/ml-labs/lab1/OldFaithful.mat");   
figure,plot(X(:,1),X(:,2),'or');  % visualise the original data first

k=3; %Makes sense to use 2 clusters by looking at the data, but you can try other values of k.
cluster_labels= k_means(X,k);


%% Linear regression only use one feature for easier visualisation but it is not restricted to 1 feature.
clear;
load ("/home/fabian/Documents/Nottingham/ML/ml-labs/lab1/texas_temp.mat");   
figure,plot(predictors(:,1),temp,'or');
figure,plot(predictors(:,2),temp,'or');
figure,plot(predictors(:,3),temp,'or');

% normalise the data for more stable optimisation
X1=(predictors(:,1)-min(predictors(:,1)))/(max(predictors(:,1))-min(predictors(:,1)));
X2=(predictors(:,2)-min(predictors(:,2)))/(max(predictors(:,2))-min(predictors(:,2)));
X3=(predictors(:,3)-min(predictors(:,3)))/(max(predictors(:,3))-min(predictors(:,3)));
min_Y=min(temp(:));
max_Y=max(temp(:));
Y=(temp-min_Y)/(max_Y-min_Y);

X=[X1, X2, X3];

% linear regression optimisation
model_parameters=learnRegressionModel(X, Y);

% test some input values 
X_prediction=[0:0.01:1];
Y_prediction=X_prediction*model_parameters(1)+model_parameters(2);

% Scale the input values back to the original data range
X_prediction=X_prediction*(max_X-min_X)+min_X;
Y_prediction=Y_prediction*(max_Y-min_Y)+min_Y;

% Visualise the fitted linear function
figure,plot(predictors(:,1),temp,'or');
hold on;plot(X_prediction,Y_prediction,'b');
title("linear regression on original data");










