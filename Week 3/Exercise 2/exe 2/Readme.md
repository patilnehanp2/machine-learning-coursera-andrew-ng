# Programming Exercise 2 #
Logistic Regression

## 1. Logistic Regression ##

### Plotting data in `plotData.m` ###

	      % to find index of 0 and 1;
        pos=find(y==1);
        zero=find(y==0);
        % plotting features
        plot(X(pos,1),X(pos,2),"k+",'markersize',6)
        plot(X(zero,1),X(zero,2),"ko",'markersize',6,'markerfacecolor','y')


**Implementation**

### Sigmoid function in `sigmoid.m` ###

The sigmoid function is defined as \\( g(z) = \frac{1}{1 + e^{-z}} \\)

This solution is straightforward which uses `exp` to calculate the e to the power of -z:

	      g = 1.0 ./ (1.0 + exp(-z));

### Cost function and gradient in `costFunction.m` ###

Recall that the cost function in logistic regression is
\\[ J(\theta) = \frac{1}{m} \sum\_{i=1}^{m} \text{Cost}(h\_{\theta}(x^{(i)}), y^{(i)}) = - \frac{1}{m} \left[\sum\_{i=1}^{m}y^{(i)} \log{h\_{\theta}(x^{(i)})} + (1 - y^{(i)}) \log{(1-h\_{\theta}(x^{(i)}))} \right] \\]

My solution is to first calculate hypothesis using `sigmoid` and then apply matrix product to get \\( J(\theta) \\) and gradient vector:

        hx=X*theta;
        % pass to sigmoid
        ghx=sigmoid(hx);
        tosum= (y .* log(ghx)) + ((1 - y).* log(1-ghx));
        J=(-sum(tosum))/m;

### Learning parameters using `fminunc` ###

Octave’s `fminunc` is an optimization solver that finds the minimum of an unconstrained function. For logistic regression, you want to optimize the cost function \\( J(\theta) \\) with parameters \\( \theta \\).

In `ex2.m`, the code is written with the correct arguments:

	% Set options for fminunc
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	
	% Run fminunc to obtain the optimal theta
	% This function will return theta and the cost
	[theta, cost] = ...
		fminunc(@(t)(costFunction(t, X, y)), initial theta, options);

### Evaluating logistic regression in `predict.m` ###

My solution is simply using `round`:

          % calculate probability  of each X
          prob=sigmoid(X * theta);
          % round and return
          p=round(prob);

## 2. Regularized logistic regression ##

### Feature mapping in `mapFeature.m` ###

Provided function `mapFeature.m` maps the features into
all polynomial terms of \\( x\_{1} \\) and \\( x\_{2} \\) up to the sixth power:

          function out = mapFeature(X1, X2)
            degree = 6;
            out = ones(size(X1(:,1)));
            for i = 1:degree
                for j = 0:i
                    out(:, end+1) = (X1.^(i-j)).*(X2.^j);
                end
            end
          end

### Cost function and gradient in `costFunctionReg.m` ###

Recall that the regularized cost function in logistic regression is
\\[ J(\theta) = \frac{1}{2m} \left[ \sum\_{i=1}^{m}(h\_{\theta}(x^{(i)}) - y^{(i)})^{2} + \lambda \sum\_{j=1}^{n} \theta\_{j}^{2} \right] \\]

The gradient of
the cost function is a vector where the \\( j^{th} \\) element is defined as follows:
\\[ \frac{\partial J(\theta)}{\partial \theta\_{0}} = \frac{1}{m} \sum\_{i=1}^{m}(h\_{\theta}(x^{(i)})-y^{(i)})x\_{j}^{(i)} \qquad \text{for } j = 0 \\]
\\[ \frac{\partial J(\theta)}{\partial \theta\_{j}} = \left( \frac{1}{m} \sum\_{i=1}^{m}(h\_{\theta}(x^{(i)})-y^{(i)})x\_{j}^{(i)} \right) + \frac{\lambda}{m} \theta\_{j} \qquad \text{for } j \geq 1 \\]

My solution uses `[0; ones(size(theta, 1) - 1, 1)]` to filter the theta values except \\( \theta\_{0} \\):

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

### Plotting the decision boundary in `plotDecisionBoundary.m` ###

`plotDecisionBoundary.m` plots the non-linear decision boundary by computing the classifier’s predictions on an evenly spaced grid and then and drew a contour plot of where the predictions change from \\( y = 0 \\) to \\( y = 1 \\).

          function plotDecisionBoundary(theta, X, y)
            plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

              % Calculate the decision boundary line
              plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));

              % Plot, and adjust axes for better viewing
              plot(plot_x, plot_y)

              % Legend, specific for the exercise
              legend('Admitted', 'Not admitted', 'Decision Boundary')
              axis([30, 100, 30, 100])
          end
