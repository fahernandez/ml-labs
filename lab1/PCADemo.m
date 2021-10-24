clear all
close all

% Create a 100 data samples, each contains 2 features, the features follows
% 2D Gaussian distribution

F1=normrnd(5,10,[1, 100]); % the first feature F1 follows a Gaussian distribution
F2=3*F1+(rand(1,100)-0.5)*50; % the second feature F2 has a linear relationship with F1.

figure,plot(F1, F2,'or');  % plot the data samples using feature F1 and F2.
xlabel('Feautre 1'); ylabel('Feature 2');


% Reduce the dimensionality from 2 to 1 using PCA

X=[F1', F2']; % Feature matrix X is 100 (instances) by 2 (features).

% Calculate PCA: you can also directly use built-in function "pca"

meanX=mean(X);                 % Calulate mean of feature X, 2 values-> one mean for each feature
difX=X-repmat(meanX, 100,1);   % Subtract the mean from the original feature values
covX=difX'*difX;               % Calculate the corvaiance matrix of X
[eigenVectors,eigenValues]=eig(covX);  % Eigen value decomposition, These eigen vectors are arranged from the least to the most significant
eigenVectors=eigenVectors(:,end:-1:1)

%Visualise the PCA component of eigenVectors 2

projectedF1=eigenVectors(:,1)'* X';   % Calculate new projected feature 1: 1x2 eigenVector multiply by 2x100 data samples
projectedF2=eigenVectors(:,2)'* X';   % Calculate new projected feature 2. 

figure,plot(projectedF1, projectedF2,'ob');  % plot the data samples using feature F1 and F2.
xlabel('PCA Feautre 1'); ylabel('PCA Feature 2');



