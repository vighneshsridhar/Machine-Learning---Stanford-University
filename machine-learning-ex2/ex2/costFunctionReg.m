function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly


% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
h = sigmoid(X * theta); 
yequals1 = arrayfun(@(x) log(x), h);
yequals0 = arrayfun(@(x) log(1 - x), h);
oneminusy = arrayfun(@(x) 1 - x, y);
thetasize = size(X, 2);
thetasquared = arrayfun(@(x) x^2, theta);
reg = (lambda/(2 * m)) * sum(thetasquared(2:thetasize, :));
%disp("size of theta = "), disp(size(theta));
J = (1/m) * sum((-y .* yequals1) - (oneminusy .* yequals0)) + reg;

temp0 = (1/m) * sum((h - y) .* X(:, 1));
grad = zeros(size(theta));
grad(1) = temp0;
for j = 2:thetasize
  grad(j) = (1/m) * sum((h - y) .* X(:, j)) + (lambda/m) * theta(j);
endfor



% =============================================================

end
