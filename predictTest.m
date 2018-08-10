function predictTest(y, z, Theta1, Theta2, mu, range)

% predictTest(y, z, Theta1, Theta2, mu, range) calculates the
% accuracy on the test data.

su = 0;

load ('testdata1.mat');

padlen = size(Theta1,2) - size(td,2) - 1;
td = [td zeros(size(td,1), padlen)];
td = (td-mu)/range;

for(i=1:22)

x = td(i,:);
x = x';
x = [1; x];
h1 = sigmoid(Theta1*x);
h1 = [1; h1];
h2 = sigmoid(Theta2*h1);
[dummy, pred] = max(h2, [], 1);

  if(pred == y(2*i))
    su = su + 1;
  end;
  
disp(sprintf('Did you mean : %s',  z(pred,:)));
end;

fprintf('\nTestSet Accuracy: %f\n', (su/22) * 100);

end;

% =========================================================================
