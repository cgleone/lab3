clear
clf

lena = imread("lena.tiff");
lena = im2gray(lena);
lena = double(lena) / 255;

lena_fourrier_spectra = fft2(lena);
figure()
imagesc(log(abs(fftshift(lena_fourrier_spectra))));
title("Log Fourier Spectra for Original Lena")

noisy_lena = imnoise(lena, 'gaussian', 0, 0.005);
noisy_lena_fourier_spectra = fft2(noisy_lena);
figure()
imagesc(log(abs(fftshift(noisy_lena_fourier_spectra))))
title("Log Fourier Spectra for Noisy Lena")
r=60;
h = fspecial('disk', r);
h(h > 0) = 1;
h_freq = zeros(512,512);
h_freq(512/2-r:512/2+r, 512/2-r:512/2+r) = h;
figure()
imagesc(h_freq);
title("filter in frequency domain")

filtered_noisy_lena_fourier_spectra = h_freq .* fftshift(noisy_lena_fourier_spectra);
figure()
imagesc(log(abs(filtered_noisy_lena_fourier_spectra)));
title("filtered lena in frequency domain")

regenerated_lena = ifft2(filtered_noisy_lena_fourier_spectra);
figure()
imshow(abs(regenerated_lena), [])
title("Filtered lena in spacial domain")


