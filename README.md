# Did_You_Mean

A small implementation of the "Did you mean: ...." feature of the Google search using a 3 layered (1 hidden layer) neural network.

To run this script, download this project, set Octave to point to the 'Core' folder from this repository,
in the Octave command window, type **Start** and press the enter key to run the scripts.

No Machine Learning or Neural Network libraries have been used for this project because I intended to gain a deeper understanding of Neural Networks with this project. I do plan to push another, **optimized** version which, hopefully, would come out as a complete product.

## Theory

In this small implementation of the **Did you mean: .....?** feature of the Google search, I have tried to train a Neural Network to understand the spellings of some of the inbuilt functions of GNU Octave. The Neural Network is essentially a classifier and after learning the correct spellings, it classifies a misspelled word into a particular class, the ‘class’ being the correct spelling of the word.

The file model_screenshot.png in this repository shows a depiction...

A particular function name is a sequence of characters. Each character has some ASCII value. Because an ASCII pattern ‘completely defines’ a word (or in this case, a function name of GNU Octave), I have decided to use the ASCII sequence of each word (or function name) as the input features of the neural network. The ASCII patterns of all the functions, are fed to neural network, one at a time, and thus, the network is trained to understand the correct spelling of the functions.

From now on, I'll be using the terms 'words' and 'functions' interchangebly to mean an ASCII sequence.

Different words have different lengths (eg: 'xor' is of length 3 and 'x2mdate' is of length 7) and so I’ll pad all the functions with a null character to match the length of the longest function. The input layer size should now be set to a few (say 2-3) characters more than that of the longest length function. In my current implementation the Neural network's input layer size is exactly equal to the length of the longest function. This will throw an error if the largest length function is misspelled with an extra character because in this case, the total number of ASCII values to be fed to the input layer will exceed the number of neurons in the input layer. This, therefore is a known bug that will be fixed.

After that, we train the network to learn the spellings of the words. For training we use,

a) Correct spellings of the word

b) slightly misspelled spelling of the word.

In this implementation (b) has not been used effectively. It is worth mentioning at this point that if a list of common spelling errors would be available then the training can be made more effective.

After the training, the network would have 'learned' the correct spellings of the words and it will also understand what common spelling errors look like (if type b data is used). If data is good and the implementation is well carried out, the network will be able to predict the correct spelling, everytime a word is wrongly spelled.

Also, as we know, one can never really find out ‘what exactly has been learned by a neural network'. This is why, a neural network may sometimes give a very different output than what would be expected. Therefore, another thing that should be done but remains unimplemented right now is a small checker which would essentially match a few characters of the misspelled word and the output of the network. If a few characters seem to match, the output would be reasonable and can be shown to the user.

## Files description

- **README.md:** This description file.

- **LICENSE:** Contains the terms of the GPUv3 license.

- **input.txt:** Contains the input training data in .txt format.

- **output.txt:** Contains the output training data (classes) in ,txt format.

- **testdata.txt:** Contains input test data in .txt format.

- **Expected outputs.txt:** Contains output test data in .txt format.

- **CreateData.m:** Generates two files, dataset2.mat and testdata2.mat.

*Files within the core folder...*

- **dataset2.mat:** The file contains all the data that will be required to train the neural network.

- **testdata2.mat:** The file contains all the data that will be required to test the neural network.

- **nnCostFunction.m:** Feeds forward and backpropogates the network to fit the weights.

- **predictRandomn.m:** Prompts the user to enter a randomn misspelling, then uses the Neural Network to suggest a correction.

- **predictTest.m:** Measures the accuracy of the Neural Network on test data.

- **predictTrain.m:** Measures the accuracy of the Neural Network on training data.

- **Start.m:** The primary file from where the program starts. It creates the Neural Network, then calls appropriate functions to train and test it.

*Files within the Core Folder that will not need changes if the Neural Network is played with...*

- **checkNNGradients.m:** creates a small neural network to check the backpropagation gradients, it will output the relative differece of the analytical gradients produced by the backprop code and the numerical gradients (computed using computeNumericalGradient).

- **computeNumericalGradient.m:** computes the numerical gradient of the function J around theta.

- **debugInitializeWeights.m:** Initializes the weights of a layer with fan_in incoming connections and fan_out outgoing connections using a fix set of values.

- **FeatureScale.m:** scales and normalizes the training data so that convergence takes place effectively.

- **fmincg.m:** Contains an algorithm to minimize a continuous differentialble multivariate function (Details can be found within its code).

- **randInitializeWeights.m:** Breaks the symmetry of weights by random initialization of weight metricies.

- **sigmoid.m:** An implementation of the sigmoid activation function.

- **sigmoidGradient:** Computes the derivative of the sigmoid function.

- **y_for_learning:** Returns the ouput vector, as required for the backpropogation.
# Spell-Corrector
# Spell-Corrector
# Spell-Corrector
