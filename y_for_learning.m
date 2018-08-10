function ymat = y_for_learning(i, y, num_labels);
  
% This function will return a vector of actual outputs as required by the cost function.
% i.e, if, say, x(i) is an image of the digit 5, then the corresponding y(i) (that should be used with the cost function) should be a 10-dimensional vector with 
% y(5) = 1, and the other elements equal to 0. This function returns that 10 dimensional vector.

ymat = zeros(num_labels, 1);
val = y(i);
ymat(val) = 1;
  
end
