# Programming Exercise 4 #
Neural Networks Learning

## 1. 1 Neural Networks ##

### Visualizing the data ###

    % Load saved matrices from file 
    load('ex4weights.mat');
    % The matrices Theta1 and Theta2 will now be in your workspace 
    % Theta1 has size 25 x 401 
    % Theta2 has size 10 x 26


### Feedforward and cost function in `nnCostFunction.m` ###

Part 1 :- 

        % Foward propagation
        % a1 = X;
        X = [ones(m,1) X]; % 5000*401
        z2 = Theta1 * X'; % (25*401)*(401*5000)
        a2 = sigmoid(z2); % (25*5000)

        a2 = [ones(m,1) a2'];
        z3 = Theta2 * a2';
        h_theta = sigmoid(z3); % h_theta equals a3

        % y(k) - the great trick - we need to recode the labels as vectors containing only values 0 or 1 (page 5 of ex4.pdf)
        y_new = zeros(num_labels, m); % 10*5000
        for i=1:m,
          y_new(y(i),i)=1;
        end

        J = (1/m) * sum ( sum ( (-y_new) .* log(h_theta) - (1-y_new) .* log(1-h_theta) ));

        % Note we should not regularize the terms that correspond to the bias. 
        % For the matrices Theta1 and Theta2, this corresponds to the first column of each matrix.
        t1 = Theta1(:,2:size(Theta1,2));
        t2 = Theta2(:,2:size(Theta2,2));

        % Regularization
        Reg = lambda  * (sum( sum ( t1.^ 2 )) + sum( sum ( t2.^ 2 ))) / (2*m);

        % Regularized cost function
        J = J + Reg;


Part 2 :- 

        % Back propagation
        for t=1:m

            % Step 1
          a1 = X(t,:); % X already have a bias Line 44 (1*401)
            a1 = a1'; % (401*1)
          z2 = Theta1 * a1; % (25*401)*(401*1)
          a2 = sigmoid(z2); % (25*1)

            a2 = [1 ; a2]; % adding a bias (26*1)
          z3 = Theta2 * a2; % (10*26)*(26*1)
          a3 = sigmoid(z3); % final activation layer a3 == h(theta) (10*1)

            % Step 2
          delta_3 = a3 - y_new(:,t); % (10*1)

            z2=[1; z2]; % bias (26*1)
            % Step 3
            delta_2 = (Theta2' * delta_3) .* sigmoidGradient(z2); % ((26*10)*(10*1))=(26*1)

            % Step 4
          delta_2 = delta_2(2:end); % skipping sigma2(0) (25*1)

          Theta2_grad = Theta2_grad + delta_3 * a2'; % (10*1)*(1*26)
          Theta1_grad = Theta1_grad + delta_2 * a1'; % (25*1)*(1*401)

        end;

        % Step 5
        Theta2_grad = (1/m) * Theta2_grad; % (10*26)
        Theta1_grad = (1/m) * Theta1_grad; % (25*401)

Part 3 :- 

        % Theta1_grad(:, 1) = Theta1_grad(:, 1) ./ m; % for j = 0
        % 
        Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + ((lambda/m) * Theta1(:, 2:end)); % for j >= 1 
        % 
        % Theta2_grad(:, 1) = Theta2_grad(:, 1) ./ m; % for j = 0
        % 
        Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + ((lambda/m) * Theta2(:, 2:end)); % for j >= 1

        % -------------------------------------------------------------

        % =========================================================================

        % Unroll gradients
        grad = [Theta1_grad(:) ; Theta2_grad(:)];


### Sigmoid gradient in `sigmoidGradient.m` ###

        g = sigmoid(z) .* (1 - sigmoid(z));

### Random initialization in ` randInitializeWeights.m` ###

        % Randomly initialize the weights to small values 
        epsilon init = 0.12; 
        W = rand(L out, 1 + L in) * 2 * epsilon init − epsilon init; 
