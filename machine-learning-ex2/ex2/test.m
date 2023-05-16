function Delta = test(delta, a)

for i = 1:rows(delta)
  for j = 1:rows(a)
    %Delta(i, j) = delta(i) * a(j);
  endfor
endfor

Delta = a' * delta;
end