function res = fence(rows, cols)
  
    if nargin < 2
        cols = rows;
    endif
    
    res = logical(zeros(rows, cols));
    res(:, 1:2:end) = 1;
end
