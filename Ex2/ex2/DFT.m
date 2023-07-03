function fourierSignal = DFT(signal)
% Converts a 1D discrete signal to its fourier representation
% IPUT:
% signal is a row vector of type double
% OUTPUT:
% fourierSignal is a row complex vector of type double

N = size(signal, 2);

% omega_vector = (e^-0/N, e^(-2*pi*i)/N, e^(-4pi*i)/N, .... , e^(-(N-1)*2*pi*i)/N)
omega_vector = exp( (-1i * (0 : 2 * pi : 2 * pi * ( N - 1 ) ) / N ) );

% When omega_vector = (w0, w1, ... w(N-1))
% repmat(omega_vector, N,1)' will duplicate this row vector
% to a matrix with N rows and then transpose omega_vector
omega_mat = repmat(omega_vector, N,1).' ;

% u- the wavelength. we need to power omega_mat by u bitwise
u = repmat( 0:N-1, N, 1);

% DFTmat will looks like that:
% [ e^0/N,     e^0/N,                      .....      e^0/N ;
%   e^0/N,     e^1*(-2*pi*i)/N,    .....      e^1*(N-1)*(-2*pi*i)/N ;
%   e^0/N,     e^2*(-2*pi*i)/N,    .....      e^2*(N-1)*(-2*pi*i)/N ;
%                                                     .....
%   e^0/N,     e^(N-1)*(-2*pi*i),  .....      e^(N-1)(N-)*(-2*pi*i)/N ]    
DFTmat=  omega_mat .^  u;

% multiply f(x), the signal with the matrix, to get the wavelengths vector F(x)
fourierSignal = (signal * DFTmat); 
end

