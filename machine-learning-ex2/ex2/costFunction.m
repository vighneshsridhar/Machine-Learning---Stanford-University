function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
h = sigmoid(X * theta);
%disp("theta = " ), disp (theta);
%disp("x = " ), disp (X);
%disp("y = " ), disp(y);
%disp("h = " ), disp (h);
yequals1 = arrayfun(@(x) log(x), h);
yequals0 = arrayfun(@(x) log(1 - x), h);
oneminusy = arrayfun(@(x) 1 - x, y);
%disp("one minus y = "), disp(oneminusy);
%disp("y = 1 " ), disp(yequals1);
%disp("y = 0 " ), disp(yequals0);
J = (1/m) * sum((-y .* yequals1) - (oneminusy .* yequals0));
%disp("J = "), disp(J);
temp0 = (1/m) * sum((h - y) .* X(:, 1));
temp1 = (1/m) * sum((h - y) .* X(:, 2));
temp2 = (1/m) * sum((h - y) .* X(:, 3));
grad = [temp0; temp1; temp2];
%disp(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%








% =============================================================

end
