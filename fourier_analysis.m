clear;

f = zeros(256,256);
f(:,108:148)=1;
imshow(f)

F=fft2(f);
F=abs(fftshift(F));
figure
subplot(1,2,1), imshow(f), title('Original Image')
subplot(1,2,2), imshow(F, []), title('Fourier Spectra of Original Image') 

f_rotated = imrotate(f, 45);
F_rotated=fft2(f_rotated);
F_rotated=abs(fftshift(F_rotated));
figure
subplot(1,2,1), imshow(f_rotated), title('Original Image Rotated by 45 deg')
subplot(1,2,2), imshow(F_rotated, []), title('Fourier Spectra of Rotated Image')

lena = imread('lena.tiff');
lena = rgb2gray(lena);
lena = double(lena) / 255;

F_lena=fft2(lena);
F_lena=(fftshift(F_lena));

amp = (abs(F_lena));
phase = F_lena./amp;

spatial_amp = ifft2(ifftshift(amp));
spatial_phase = ifft2(ifftshift(phase));

figure
imshow(lena), title('Original Image')
figure
imshow(spatial_amp), title('Reconstructed with Amplitude')
figure
imshow(spatial_phase, []), title('Reconstructed with Phase')

% figure
% subplot(1,3,1), imshow(lena), title('Original Image')
% subplot(1,3,2), imshow(log(amp), []), title('Amplitude')
% subplot(1,3,3), imshow(phase, []), title('Phase')

