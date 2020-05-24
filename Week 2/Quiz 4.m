1.Question 1
  Suppose m=4 students have taken some class, and the class had a midterm exam and a final exam. You have collected a dataset of their 
scores on the two exams, which is as follows:

| midterm exam | (midterm exam)^2 | final exam |
| :---         |     :---:        |       ---: |
| 89           | 7921             | 96         |
| 72           | 5184             | 74         |
| 94           | 8836             | 87         |
| 69           | 4761             | 78         |

  You'd like to use polynomial regression to predict a student's final exam score from their midterm exam score. Concretely, suppose you 
want to fit a model of the form hθ(x)=θ0+θ1x1+θ2x2, where x1 is the midterm score and x2 is (midterm score)2. Further, you plan to use 
both feature scaling (dividing by the "max-min", or range, of a feature) and mean normalization. 
  What is the normalized feature x1(3)? (Hint: midterm = 94, final = 87 is training example 3.) Please enter your answer in the text box 
below. If applicable, please provide at least two digits after the decimal place.

Ans :- 
         hθ(x) = θ0 + θ1x1 + θ2x2

         hθ(x) = θ0 + θ1(94 - (89 + 72 + 94 + 69)/4)/(94 - 69) + θ2(8836 - (7921 + 5184 + 8836 + 4761)/4)/(8836 - 4761)

         hθ(x) = θ0 + 0.52θ1 + 0.532θ2

         normalized feature x1(3) = 0.52

2.Question 2
  You run gradient descent for 15 iterations with \alpha = 0.3 and compute after each iteration. You find that the value of J(\theta) 
decreases slowly and is still decreasing after 15 iterations. Based on this, which of the following conclusions seems most plausible?

(a) Rather than use the current value of α, it’d be more promising to try a larger value of α (say \alpha = 1.0).
(b) Rather than use the current value of α, it’d be more promising to try a smaller value of α (say \alpha = 0.1).
(c) \alpha = 0.3 is an effective choice of learning rate.

Ans :- \alpha = 0.3 is an effective choice of learning rate.

3.Question 3
  Suppose you have m=14 training examples with n=3 features (excluding the additional all-ones feature for the intercept term, which you 
should add). The normal equation is θ=(XTX)−1 XTy. For the given values of m and n, what are the dimensions of θ, X, and y in this 
equation?

(a) X is 14×4, y is 14×1, θ is 4×1
(b) X is 14×4, y is 14×4, θ is 4×4
(c) X is 14×3, y is 14×1, θ is 3×3
(d) X is 14×3, y is 14×1, θ is 3×1

Ans :-   X is 14×4, y is 14×1, θ is 4×1
         Add feature to X => 14x4 matrix y = 1 col, m rows => 14X1 ( 1 result per example) θ = 4 cols, 1 row => 1x4 
         ( 1 value per feature) 
         (m x n) * (n * m)
         
4.Question 4
  Suppose you have a dataset with m=1000000 examples and n=200000 features for each example. You want to use multivariate linear 
regression to fit the parameters θ to our data. Should you prefer gradient descent or the normal equation?

(a) The normal equation, since it provides an efficient way to directly find the solution.
(b) Gradient descent, since it will always converge to the optimal θ.
(c) Gradient descent, since (XTX)^−1 will be very slow to compute in the normal equation.
(d) The normal equation, since gradient descent might be unable to find the optimal θ.

Ans :- Gradient descent, since (XTX)^−1 will be very slow to compute in the normal equation.
            With n=200000 features, you will have to invert a 200001×200001 matrix to compute the normal equation. Inverting such a 
            large matrix is computationally expensive, so gradient descent is a good choice.
            
5.Question 5
  Which of the following are reasons for using feature scaling?
  
(a) It speeds up gradient descent by making it require fewer iterations to get to a good solution.
(b) It is necessary to prevent gradient descent from getting stuck in local optima.
(c) It speeds up gradient descent by making each iteration of gradient descent less expensive to compute.
(d) It is necessary to prevent the normal equation from getting stuck in local optima.

Ans :-  It speeds up gradient descent by making it require fewer iterations to get to a good solution.
            Feature scaling speeds up gradient descent by avoiding many extra iterations that are required when one or more features 
            take on much larger values than the rest.
