clear;

image = imread('frequnoisy.tif');
image = double(image) / 255;

F=fft2(image);
center = F(1, 1);
F_amp=(abs(F));

figure
subplot(1,2,1), imshow(image), title('Original Image')
subplot(1,2,2), imshow(fftshift(log(F_amp)), []), title('Fourier Spectra - Amplitude')

F_phase = F./F_amp;
filtered_amp = medfilt2(F_amp);

filtered_fourier = filtered_amp.*F_phase;
filtered_fourier(1, 1) = center;
filtered_img = (ifft2(filtered_fourier));

figure
subplot(1,2,1), imshow(filtered_img), title('Filtered Image')
subplot(1,2,2), imshow(fftshift(log(abs(filtered_fourier))), []), title('Filtered Fourier')