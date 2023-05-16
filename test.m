truth = [0, 0; 0,1;1,0;1,1];
z1 = truth * [1;1] - 1.5;
z2 = truth * [-1;-1] + 1.5;
disp("z1 = "), disp(z1);
disp("z2 = "), disp(z2);
y = truth * [1;1] - 1.5;
disp("y = "), disp(y);