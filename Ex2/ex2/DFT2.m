function fourierImage = DFT2(image)
%Preform 2 dimention Furier.
%   using 1D Fourier, we will calculate Fourier for the rows,  and then
%   preform Fourier on the columns
fourierImage = DFT(DFT(image.').');

%[M,N] = size(image);
%fourierImageColumns = zeros(M,N);

% Fourier for columns- first
%for idx = 1:N
%    fourierImageColumns(:,idx) = DFT(image(:,idx)')';
%end

% omega_vector = (e^0/N, e^(-2*pi*i)/N, e^(-4pi*i)/N, .... , e^(-(N-1)*2*pi*i)/N)
% omega_vec = exp( (-2i * pi * (0 : ( N - 1 ) ) / N ) );
% omega_mat = repmat(omega_vec, N, 1);

% Fourier for rows- second
%for idx = 1:M
%    fourierImage(idx,:) = DFT(fourierImageColumns(idx,:));
% end

end

