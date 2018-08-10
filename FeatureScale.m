function [X, mu, range] = FeatureScale(X)

% FeatureScale(X) scales and normalizes the training data so that
% convergence takes place effectively


mu = sum(sum(X))/(size(X,1)*size(X,2)); %Mean of data
range = max(max(X))-0; %Range of data

X = (X-mu)/(range); %Scaling and mean normalization

end;
