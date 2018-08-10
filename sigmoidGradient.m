function g = sigmoidGradient(z)

% g = sigmoidGradient(z) computes the gradient of the sigmoid function
% evaluated at z.

g = zeros(size(z));
g = sigmoid(z).*(1-sigmoid(z)); 

end
