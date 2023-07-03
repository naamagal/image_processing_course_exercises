function image = IDFT2(fourierImage)
%Preform 2 dimention Furier.
%   using 1D Fourier, we will calculate Fourier for the columns,  and then
%   preform Fourier on the rows, and in the end we will transpose the
%   matrix for correlation with \ the input form

image = IDFT(IDFT(fourierImage).').'; 
end

