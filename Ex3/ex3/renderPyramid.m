function res = renderPyramid(pyr,levels)
% present pyramid levels in one matrix

% is laplacian pyramid
lap = false;
for  pyrIdx = 1: levels
    matrix = cell2mat(pyr(pyrIdx,1));
    if( min( min ( matrix ) ) < 0 )
       lap = true;
       break;
   end
end

for  pyrIdx = 1: levels
    matrix = pyr {pyrIdx,1};
    pyr_RowArr(pyrIdx) = size(matrix,1);
    pyr_ColArr(pyrIdx) = size(matrix,2);
end

numOfRows = pyr_RowArr(1);
numOfCols = sum(pyr_ColArr);

res = zeros(numOfRows, numOfCols);
startCol = 0;
for levelIdx = 1: levels
    endRow = pyr_RowArr(levelIdx);
    endCol = startCol+ pyr_ColArr(levelIdx);
    mat = pyr {levelIdx,1};
    % if pyr is laplacian it could have negative values
    if( lap )
         mat = (mat + 1)./2;
    end
    %linearStretching
    linearMat = LinearStretching(mat);
    
    res(1:endRow, startCol+1:endCol) = linearMat;
    startCol = endCol;
end

end

