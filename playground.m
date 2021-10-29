clear

im = imread('frequnoisy.tif');
figure()
imshow(im)
% im = double(im) / 255.0;
ff = fft2(im);
ff_abs = abs(ff);
ff_angle = angle(ff);

ff_abs = medfilt2(ff_abs);

filtered_ff = ff_abs .* exp(ff_angle.*1i);
filtered_ff(1, 1) = ff(1, 1);
filtered_im = ifft2(filtered_ff);

figure()
imshow(real(filtered_im))