clear all;
close all;

% Load data example
rawData=readtable('./DataExample.csv','HeaderLines',0,'ReadVariableNames',true);

% Extract feature names

Age=table2array(rawData(2:end,2));
Weight=table2array(rawData(2:end,3));
Gender=cell2mat(table2array(rawData(2:end,4)));
Income=cell2mat(table2array(rawData(2:end,5)));
Alcohol=table2array(rawData(2:end,6));
Diabetes=table2array(rawData(2:end,7)); % this is the outcome event

% Visualise the features and observe if any outliers

figure, boxplot(Age); xlabel('Age'); ylabel('Years'); % use boxplot for continues variable
figure, boxplot(Weight); xlabel('Weight'); ylabel('Kg'); 

numMale=length(find(Gender=='M'));  % count the number of male and female cases
numFemale=length(find(Gender=='F'));
Gender=categorical(cellstr(Gender));
figure,histogram(Gender);

Income=categorical(cellstr(Income)); % plot hitogram for categorical features
figure, histogram(Income);

figure,plot(Age, Weight,'or');xlabel('Age'); ylabel('Height'); % use scatter plot to explore the correlations of two features.

% Feature Normalisation 
% ## think about which method is better?##

Age_norm1=(Age-mean(Age))/(std(Age)+eps);   % Z-normalisation, eps is make sure not divided by zero
figure, boxplot(Age_norm1); xlabel('Age_{norm1}'); ylabel('Years'); % use boxplot to visualise the normalised feature values

Age_norm2=(Age-min(Age))/(max(Age)-min(Age));   % min-max normalisation
figure, boxplot(Age_norm2); xlabel('Age_{norm2}'); ylabel('Years'); % use boxplot to visualise the normalised feature values

minAge5 = prctile(Age,5);           % use 5% and 95% percentile as the min and max values.
maxAge95= prctile(Age,95);
Age_norm3=(Age-minAge5)/(maxAge95-minAge5);   % min-max normalisation
Age_norm3=min(Age_norm3,1);         % clip the values higher than 1 and lower than 0. 
Age_norm3=max(Age_norm3,0);
figure, boxplot(Age_norm3); xlabel('Age_{norm3}'); ylabel('Years'); % use boxplot to visualise the normalised feature values

Age_norm4=Age/norm(Age);    % norm is the same as sqrt(sum((Age.*Age)))
figure, boxplot(Age_norm4); xlabel('Age_{norm4}'); ylabel('Years'); % use boxplot to visualise the normalised feature values

%## think about do you need to normalise the categorical features and how would you do it?##



