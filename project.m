graph = true;

% Coefficents
m = 5000;
b = 3000;
k = 10000;

% Initial values
X0 = [0;.2;0;0];

% Make t a varibale
syms t;

% Without damping
no_damping = [0,1,0,0;(-2*k)/m,0,k/m,0;0,0,0,1;k/m,0,-k/m,0];

FA = find_equation(damping, X0);
X1A = matlabFunction(FA(1));
V1A = matlabFunction(FA(2));
X2A = matlabFunction(FA(3));
V2A = matlabFunction(FA(4));

if graph
    figure;
    title('1st Floor Position (No Damping)');
    hold on;     
    time = 0:0.01:30;
    plot(time,X1A(time));

    figure;
    title('1st Floor Velocity (No Damping)');
    hold on;     
    time = 0:0.01:30;
    plot(time,V1A(time));

    figure;
    title('2st Floor Position (No Damping)');
    hold on;     
    time = 0:0.01:30;
    plot(time,X2A(time));

    figure;
    title('2st Floor Velocity (No Damping)');
    hold on;     
    time = 0:0.01:30;
    plot(time,V2A(time));
end

% With damping
damping = [0,1,0,0;(-2*k)/m,(-2*b)/m,k/m,b/m;0,0,0,1;k/m,-b/m,-k/m,b/m];

FB = find_equation(damping, X0);
X1B = matlabFunction(FB(1));
V1B = matlabFunction(FB(2));
X2B = matlabFunction(FB(3));
V2B = matlabFunction(FB(4));

% First and second floor below .01
test1_01 = vpasolve(X1B(t),.01);
test2_01 = vpasolve(X2B(t),.01);

% First and second floor below .001
test1_001 = vpasolve(X1B(t),.001);
test2_001 = vpasolve(X2B(t),.001);

if graph
    figure;
    title('1st Floor Position (Damping)');
    hold on;    
    time = 0:0.01:30;
    plot(time,X1B(time));
    plot(test1_01,.01,'r*');
    plot(test1_001,.001,'r*');

    figure;
    title('1st Floor Velocity (Damping)');
    hold on;  
    time = 0:0.01:30;
    plot(time,V1B(time));

    figure;
    title('2st Floor Position (Damping)');
    hold on;    
    time = 0:0.01:30;
    plot(time,X2B(time));
    plot(test2_01,.01,'r*');
    plot(test2_001,.001,'r*');

    figure;
    title('2st Floor Velocity (Damping)');
    hold on;   
    time = 0:0.01:30;
    plot(time,V2B(time));
end
