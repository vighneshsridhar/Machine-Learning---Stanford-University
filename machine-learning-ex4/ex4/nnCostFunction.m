function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
                 

% Setup some useful variables
m = size(X, 1);
X = [ones(m, 1) X];
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
a1 = X';
z2 = Theta1 * a1;
a2 = sigmoid(z2);
a2 = [ones(1, columns(a2)); a2];
z3 = Theta2 * a2;
a3 = sigmoid(z3)';
%disp("size of a: "), disp(size(a));
%disp("Theta1: "), disp(size(Theta1));
%disp("Theta2: "), disp(size(Theta2)); 
yequals1 = arrayfun(@(x) log(x), a3);
yequals0 = arrayfun(@(x) log(1 - x), a3);
%disp("size of h"), disp(size(h));
%disp("y = 1 " ), disp(size(yequals1));
%disp("y = 0 " ), disp(size(yequals0));

mappedy = (y == 1:max(y));
mappedoneminusy = arrayfun(@(x) 1 - x, mappedy);
%disp("mapped one minus y = "), disp(size(mappedoneminusy));
J = (1/m) * sum(sum(-mappedy .* yequals1 - (mappedoneminusy .* yequals0)));

theta1squared = arrayfun(@(x) x^2, Theta1(:, 2:columns(Theta1)));
theta2squared = arrayfun(@(x) x^2, Theta2(:, 2:columns(Theta2)));
reg = (lambda/(2 * m)) * (sum(sum(theta1squared)) + sum(sum(theta2squared)));
%disp("reg: "), disp(reg);
J = J + reg;

delta3 = a3 - mappedy;
%disp("a3: "), disp(size(a3));
%disp("mappedy: "), disp(size(mappedy(t, :)'));
%z2 = [ones(1, columns(z2)); z2];
%disp("delta3: "), disp(size(delta3));
td = Theta2' * delta3';
td = td(2:end, :);
delta2 = td .* sigmoidGradient(z2);
%disp("z2: "), disp(size(z2));
%disp("a2': "), disp(size(a2'));
Delta_2 = zeros(size(delta3' * a2'));
Delta_2 = Delta_2 + delta3' * a2';
%disp("delta2: "), disp(size(delta2));
%disp("Delta_2: "), disp(size(Delta_2)); 
Delta_1 = zeros(size(delta2 * a1'));
Delta_1 = Delta_1 + delta2 * a1';
%disp("Delta_1: "), disp(size(Delta_1)); 

reg1 = [zeros(rows(Theta1), 1) (lambda/m) * Theta1(:, 2:end)];
reg2 = [zeros(rows(Theta2), 1) (lambda/m) * Theta2(:, 2:end)];

Theta1_grad = (1/m) * Delta_1 + reg1;
Theta2_grad = (1/m) * Delta_2 + reg2;








% -------------------------------------------------------------

% =========================================================================

% Unroll gradients

grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
