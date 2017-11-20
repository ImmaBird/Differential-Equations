function F = find_equation(A,X0)
    % Find the eigen values and vectors
    [vec, val] = eig(A)
    
    % Puts eigen values in a vector
    temp = zeros(1,4);
    for i = 1:4
        temp(i) = val(i,i);
    end
    val = temp;
    
    % Find alphas and betas
    alpha = real(val);
    beta = imag(val);
    
    % Finds a and b matrix
    a = real(vec);
    b = imag(vec);
    
    % Creates a matrix to solve for the constants
    U = [a(:,1),b(:,1),a(:,3),b(:,3)];

    % Finds contants
    C = linsolve(U,X0)
    
    % Makes t a variable
    syms t;
    
    % Finds the functions
    F = (C(1).*exp(alpha(1).*t).*(cos(beta(1).*t).*a(:,1)-sin(beta(1).*t).*b(:,1)))...
       +(C(2).*exp(alpha(1).*t).*(sin(beta(1).*t).*a(:,1)+cos(beta(1).*t).*b(:,1)))...
       +(C(3).*exp(alpha(3).*t).*(cos(beta(3).*t).*a(:,3)-sin(beta(3).*t).*b(:,3)))...
       +(C(4).*exp(alpha(3).*t).*(sin(beta(3).*t).*a(:,3)+cos(beta(3).*t).*b(:,3)));
end