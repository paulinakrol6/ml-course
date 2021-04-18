function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C =1;
sigma =0.3;

C_all = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_all = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

pred_error = 100;

for i=1:length(C_all)
    local_C = C_all(i);
    for j=1:length(sigma_all)
        local_sigma = sigma_all(j);
        
        model = svmTrain(X,y,local_C, @(x1,x2) gaussianKernel(x1,x2,local_sigma));
        predictions = svmPredict(model,Xval);
        local_error = mean(double(predictions ~= yval));
        if local_error < pred_error
            pred_error = local_error;
            C = local_C;
            sigma = local_sigma;
        end
    end
end






% =========================================================================

end
