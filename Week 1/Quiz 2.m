1.Question 1
Consider the problem of predicting how well a student does in her second year of college/university, given how well she did in her 
first year. 
Specifically, let x be equal to the number of "A" grades (including A-. A and A+ grades) that a student receives in their 
first year of college (freshmen year). We would like to predict the value of y, which we define as the number of "A" grades they get 
in their second year (sophomore year).
Refer to the following training set of a small sample of different students' performances (note that this training set may also be 
referenced in other questions in this quiz). Here each row is one training example. Recall that in linear regression, our hypothesis 
is 0(x) = θ_0 + θ_1x, and we use mm to denote the number of training examples.


For the training set given above, what is the value of mm? In the box below, please enter your answer (which should be a number 
between 0 and 10).

Ans :- 4

2.Question 2
 Many substances that can burn (such as gasoline and alcohol) have a chemical structure based on carbon atoms; for this reason they 
 are called hydrocarbons. A chemist wants to understand how the number of carbon atoms in a molecule affects how much energy is 
 released when that molecule combusts (meaning that it is burned). The chemist obtains the dataset below. In the column on the right, 
 “kJ/mol” is the unit measuring the amount of energy released.

                               ***Table***

You would like to use linear regression hθ(x) = θ0 + θ1x to estimate the amount of energy released (y) as a function of the number 
of carbon atoms (x). Which of the following do you think will be the values you obtain for θ0 and θ1? You should be able to select 
the right answer without actually implementing linear regression.

(a) θ0 = −569.6, θ1 = −530.9
(b) θ0 = −1780.0, θ1 = −530.9
(c) θ0 = −1780.0, θ1 = 530.9
(d) θ0 = 569.6, θ1 = −530.9

Ans :- θ0 = −569.6, θ1 = −530.9

3.Question 3
Suppose we set θ_0 = -2, θ_1 = 0.5θ in the linear regression hypothesis from Q1. What is h_θ(6)?

Ans :- hθ(x) = θ_0 + θ_1x
       hθ(x) = -2 + 0.50x
       hθ(6) = -2 + 0.50 * 6
       hθ_θ(6) = 1

4.Question 4
Let f be some function so that f(θ0,θ1) outputs a number. For this problem, f is some arbitrary/unknown smooth function 
(not necessarily the cost function of linear regression, so f may have local optima). Suppose we use gradient descent to try to 
minimize f(θ0,θ1) as a function of θ0 and θ1. Which of the following statements are true? (Check all that apply.)

(a) If the first few iterations of gradient descent cause f(θ_0, θ_1) to increase rather than decrease, then the most likely cause 
    is that we have set the learning rate (\alphaα) to too large a value.
(b) Setting the learning rate (\alphaα) to be very small is not harmful, and can only speed up the convergence of gradient descent.
(c) If θ_0 and θ_1 are initialized at the global minimum, then one iteration will not change their values.
(d) No matter how θ_0 θ_1 are initialized, so long as \alphaα is sufficiently small, we can safely expect gradient descent to 
    converge to the same solution.

Ans :- If the first few iterations of gradient descent cause f(θ_0, θ_1) to increase rather than decrease, then the most likely cause 
       is that we have set the learning rate (\alphaα) to too large a value.
    
5.Question 5
Suppose that for some linear regression problem (say, predicting housing prices as in the lecture), we have some training set, and for 
our training set we managed to find some 0_θ, 0_1 such that J(0_θ, 0_1)=0. Which of the statements below must then be true? 
(Check all that apply.)


(a) For this to be true, we must have θ_0 = 0 and θ_1 = 0 so that h_θ(x) = 0
(b) For this to be true, we must have yi = 0 for every value of i=1,2,…,m.
(c) Our training set can be fit perfectly by a straight line,
    i.e., all of our training examples lie perfectly on some straight line.
(d) Gradient descent is likely to get stuck at a local minimum and fail to find the global minimum.

Ans :- Our training set can be fit perfectly by a straight line,
       i.e., all of our training examples lie perfectly on some straight line.
