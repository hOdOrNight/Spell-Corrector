function [J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

%   [J grad] = nnCostFunction(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad is an "unrolled" vector of the
%   partial derivatives of the neural network as required bu fmincg()



% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 3 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

Theta1acc = 0;
Theta2acc = 0;

for i=1:m
  a1 = X(i,:);
  a1 = a1';
  a1 = [1; a1];
  z2 = Theta1*a1;
  a2 = sigmoid(z2);
  a2 = [1; a2];
  z3 = Theta2*a2;
  a3 = sigmoid(z3);
  h = a3;
  % Forward Propogation for one training example done.
  
  ymat = y_for_learning(i, y, num_labels); % Getting the y vector required by the cost function.
  
  J += (-ymat')*(log(h))-((1-ymat)')*(log(1-h));
  % Storing the total cost computed with the entire training set.
  % Now performing Backpropogation...
  
  delta3 = a3 - ymat;
  delta2 = ((Theta2')*delta3).*(sigmoidGradient([1; z2]));
  delta2 = delta2(2:end);
  
  Theta2acc = Theta2acc + delta3*(a2');
  Theta1acc = Theta1acc + delta2*(a1');
  
end;

J = J/m; % This is the non regularized cost
regterm = (lambda/(2*m))* (sum(nn_params.^2) - sum(Theta1(:,1).^2) - sum(Theta2(:,1).^2)); % The regularization term
J = J + regterm; % The regularized cost


Theta1_grad = Theta1acc/m; % Unregularized derivative term for Theta1
Theta2_grad = Theta2acc/m; % Unregularized derivative term for Theta2


reg1 = Theta1 - [Theta1(:,1) zeros(size(Theta1,1), size(Theta1,2)-1)];
reg2 = Theta2 - [Theta2(:,1) zeros(size(Theta2,1), size(Theta2,2)-1)];

Theta1_grad = Theta1_grad + (lambda/m)*reg1; % Regularized derivative term for Theta1
Theta2_grad = Theta2_grad + (lambda/m)*reg2; % Regularized derivative term for Theta2

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end;
