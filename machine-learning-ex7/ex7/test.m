function total = test(A, B, R)

C = A * B;
total = 0;
for i = 1:5
  for j = 1:5
    if (R(i,j) == 1)
      total = total + C(i,j);
    endif
  endfor
endfor
