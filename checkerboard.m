function res = checkerboard(rows, cols)
  
  if nargin < 2
          cols = rows;
  endif
  
  res = logical(zeros(rows, cols));
  for i = 1:rows
      for j = 1:cols
          if mod(i+j,2) == 0
              res(i,j) = 1;
          endif
      endfor
  endfor
endfunction
