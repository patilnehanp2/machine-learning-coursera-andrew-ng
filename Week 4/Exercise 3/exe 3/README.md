# Programming Exercise 3 #
Multi-class Classification and Neural Networks

## 1. Multi-class Classification ##

### Dataset ###

	% Load saved matrices from file
	load('ex3data1.mat');
	% The matrices X and y will now be in your Octave environment

### Vectorizing Logistic Regression in `lrCostFunction.m` ###

The same as `costFunctionReg.m` in Programming Exercise 2.

		hx=X*theta;
		% pass to sigmoid
		ghx=sigmoid(hx);
		tosum= (y .* log(ghx)) + ((1 - y).* log(1-ghx));
		J=(-sum(tosum))/m;
		% exclude theta0 since we dont regularize it
		theta(1)=0;
		J=J + (lambda/(2*m))*(sum(theta.^2));
		% grad needs to be of same size as of theta
		grad=((X' * (ghx - y))./m) + ((lambda/m)*theta);

### One-vs-all Classification in `oneVsAll.m` ###

My solution calculate `theta` in each iteration for one class. `theta` is the `c`th row of `all_theta`, and `y == c` will give 1 if belongs to class c. Notice that theta should be a column vector.

	for c=1:num_labels
	  % initialize intial theta each time for each class
	  % 401 by 1 theta for each class
	  initial_theta=zeros(n+1,1);
	  options=optimset('Gradobj','on','MaxIter',50);
	  % y==c will train values of theta for the Cth class
	  % y==c will be of same size as y
	  % for each c or number fmincg will find theta by considering 5000/10=500 rows for each no
	  [theta]=fmincg(@(t)(lrCostFunction(t,X,(y==c),lambda)),initial_theta,options)
	  % theta dims will be 401 by 1, transpose it then store it
	  all_theta(c,:)=theta';
	endfor

### One-vs-all Prediction in `predictOneVsAll.m` ###

My solution calculates \\( z = \theta^{T}x \\) and \\( h\_{\theta}(x) = g(z) \\). Notice the use of `max`.

	% ghx dim 5000 by 10
	ghx=sigmoid(X* all_theta');
	% taking max along row will give us the y for which c is trained for that number
	% we need output y 1 to 10 so for 5000 by 10 we take max along 2nd dim and index
	% of max will be the predicted number 
	% p is the index we want
	%The help doc in Octave is not very well written. Here max(A, [], 2) means maximum of a row of the matrix A, with the second dimension (2), i.e., all the columns of for a given row. [] represents a matrix as opposed to a vector.
	[a,p]=max(ghx,[],2);

## 2. Neural Networks ##

### Model representation ###

### Feedforward Propagation and Prediction in `predict.m` ###

My solution uses `a1`, `a2` and `a3` to represent input layer, hidden layer and output layer, respectively. `a2` and `a3` are calculated by applying logistic regression function with parameter `Theta1` and `Theta2`, respectively.

	% Theta1 consists of each column of thetas for each record(25 thetas)
	% add intercept terms
	% Activation 1st layer or X
	a1=[ones(m,1) X];
	% calculate z1
	% z2 dim 5000 by 25
	z2=a1 * Theta1';

	a2=sigmoid(z2);
	% add intercept terms
	a2=[ones(m,1) a2];
	% z3 dim 5000 by 10
	z3=a2 * Theta2';
	% ghx 5000 by 10
	ghx=sigmoid(z3);
	[a,p]=max(ghx,[],2);
