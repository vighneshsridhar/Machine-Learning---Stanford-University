A = [2, 5, 7; 4, 6, 5; 6,4,3; 6,3,5; 4,6,6];
B = [1,5,3,5,6;7,4,3,6,5;5,3,5,7,4];
R = [1,0,1,1,0;1,1,1,0,0;1,0,1,1,0;0,0,1,1,1;0,0,1,1,0];
total = test(A, B, R);
disp("total: "), disp(total);
C = (A*B).*R;
totalcomp = sum(C(:));
disp("total comp: "), disp(totalcomp);