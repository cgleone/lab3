
f = zeros(256,256);
f(:,108:148)=1;
imshow(f)

F=fft2(f);
F=abs(fftshift(F));
figure
subplot(1,2,1), imshow(f), title('Original Image')
subplot(1,2,2), imshow(F, []), title('Fourier Spectra of Original Image')
% 
% 
% f_rotated = imrotate(f, 45);
% F_rotated=fft2(f_rotated);
% F_rotated=abs(fftshift(F_rotated));
% figure
% subplot(1,2,1), imshow(f_rotated), title('Original Image Rotated by 45 deg')
% subplot(1,2,2), imshow(F_rotated, []), title('Fourier Spectra of Rotated Image')
% 

lena = imread('lena.tiff');
lena = rgb2gray(lena);

F_lena=fft2(lena);
F_lena=(fftshift(F_lena));

%F_lena=log(1+fftshift(F_lena));
amp = abs(F_lena);
phase = F_lena./amp;


subplot(1,3,1), imshow(lena), title('Original Image')
subplot(1,3,2), imshow(amp), title('Amplitude')
subplot(1,3,3), imshow(phase), title('Phase')


spatial_amp = ifft2(amp);
spatial_phase = ifft2(phase);

figure
subplot(1,3,1), imshow(lena), title('Original Image')
subplot(1,3,2), imshow(spatial_amp), title('Reconstructed with Amplitude')
subplot(1,3,3), imshow(spatial_phase), title('Reconstructed with Phase')
