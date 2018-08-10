
% This Neural Network be able to predict the correct spellings of the words on which it has been trained i.e. if training data
% contains the word "animal", then the Neural network will 'learn' the spelling of animal and when minor deviations
% like "animel" are typed in, it will output something like... "Did you mean: animal"

% This also implies that if you would like to try out a new word, not present in the dataset, make sure to include it
% in the training data by editing the script, 'createData.m' and then also make sure you make other changes in the code as required.


%% Initialization
clear ; close all; clc

%% Setup the parameters to use for this program.
input_layer_size  = 15;
hidden_layer_size = 23;
num_labels = 22;

% Load Training Data
fprintf('Loading Data ...\n')
load('dataset2.mat');
m = size(X, 1);

% Scaling and mean Normalization of input features
[X, mu, range] = FeatureScale(X);

% Initializing the weights of the neural network
fprintf('\nInitializing Neural Network Parameters ...\n')
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

% ====== Correctness of Backpropogation=======

% Feel free to skip this part of the code if you would like to...it involves the technicalities
% of neural networks and is being used to test its correctness.

% Check gradients for a smaller Network by running checkNNGradients
% Once with, and Once without regularization
% This justifies the correctness of nnCostFunction.m

fprintf("\nWith lambda = 0, i.e., no regularization...\n")
checkNNGradients;
fprintf("\nWith lambda = 3, i.e, after regularization...\n")
lambda = 3;
checkNNGradients(lambda);

fprintf("\npause press enter to continue...\n");
pause();

%% =========== Training NN ============

fprintf('\nTraining Neural Network... \n')
options = optimset('MaxIter', 500);

lambda = 0;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
                 
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

predictTrain(X, y, z, Theta1, Theta2);
predictTest(y, z, Theta1, Theta2, mu, range);
predictRandomn(y, z, Theta1, Theta2, mu, range);

