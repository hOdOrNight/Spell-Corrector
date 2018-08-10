function predictRandomn(y, z, Theta1, Theta2, mu, range)

% predictRandomn(y, z, Theta1, Theta2, mu, range) asks the user to...
% enter the incorrect spelling of a word and then predicts...
% the correct spelling.

while(true)

x = input ("\nenter a word (within quotes) or ctr+C to exit: ");
x = x+0;

padlen = size(Theta1,2) - size(x,2) - 1;
x = [x zeros(size(x,1), padlen)];
x = (x-mu)/range;


x = x';
x = [1; x];
h1 = sigmoid(Theta1*x);
h1 = [1; h1];
h2 = sigmoid(Theta2*h1);
[dummy, pred] = max(h2, [], 1);
disp(sprintf('Did you mean : %s',  z(pred,:)));

end;
end;
