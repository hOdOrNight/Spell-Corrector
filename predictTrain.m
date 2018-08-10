function predictTrain(X, y, z, Theta1, Theta2)

% predictTrain(X, y, z, Theta1, Theta2) calculates the accuracy
% on the training data

su = 0;

for(i=1:44)

x = X(i,:);
x = x';
x = [1; x];
h1 = sigmoid(Theta1*x);
h1 = [1; h1];
h2 = sigmoid(Theta2*h1);
[dummy, pred] = max(h2, [], 1);

su = su + double(pred == y(i));

end;

fprintf('\nTrainingSet Accuracy: %f \n\n', (su/44) * 100);
end;

% =========================================================================
