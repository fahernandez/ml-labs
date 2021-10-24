function model_parameters=learnRegressionModel(X, Y)

    %%  first order polynomial is a linear function: for three variables: y= a1X1+a2X2+a3X3+b
    %% for brute force approach, we need to check every combinations of a1, a2, a3 and using for loops
    %% Which almost impossible to compute. You can try. 
    
    %% Solving for linear combination
    % XT=X'; 
    % XTX=XT*X;
    % XTY=XT*Y;
    % invXTX=inv(XT*X); % The Inverse of the matrix doesn't exists so we cannot use it
    % B=invXTX*XTY;
    
    
    
    
    %% Optimisation using gradient descent Check lecture slides in "Gradient Descent" page 6
    %initialise the parameters a and b.
    a=zeros(size(X,2),1);  % slope of linear equations, the number should be same as the number of features
    b=0;      % a constant for the linear equation.
    lR=0.05; % learning rate
    thr=0.01; % stopping threshold
    % 
    for iter=1:1000 % run for maximum of 1000 iterations
        % calculate the derivatives for each parameter
        det_a=zeros(size(X,2),1);
        for i=1: size(X, 2)
            predict_y=zeros(size(Y,1),1);
            for j=1:length(a)  % calculate predicted y using the current parameters
                predict_y=predict_y+a(j)*X(:,i);
            end
            predict_y=predict_y+b;
            det_a(i)= mean(X(:,i).*(predict_y-Y));  % partial derivative for a(i), mean of x(y_pred-y)
        end
        det_b   = mean(predict_y-Y);   % partial derivative for b
        
        % update parameters a and b
        a=a-lR*det_a;
        b=b-lR*det_b;
        
        y_prediction=[min(X(:,1)):max(X(:,1))].*a+b;
        figure(1);plot(X(:,1),Y,'or');
        hold on;plot([min(X(:,1)):max(X(:,1))],y_prediction,'b');
        title("iteration=", iter);
        pause(0.01);
        
        if abs(det_a)<thr
            if abs(det_b)<thr  % if the updated parameter is small enough then stop the optimisation
                break;
            end
        end           
    end

    model_parameters=[b;a(1);a(2);a(3)];




