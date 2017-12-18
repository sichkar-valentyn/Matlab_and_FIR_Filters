close all;
clear all;

%Low pass filter
original_1 = imread('m83.tif');
B = im2bw(original_1, 0.4);
figure(1);
subplot(1,2,1), imshow(original_1), title('Original image');
subplot(1,2,2), imshow(B), title('Binary image');

Filter = fspecial('average', [3 3]);
New_image = imfilter(B,Filter,'symmetric');
figure(2);
subplot(1,2,1), imshow(B), title('Binary image');
subplot(1,2,2), imshow(New_image), title('Average, symmetric, 3x3 image');

%Height pass filter
original_2 = imread('liftingbody.png');
E1 = edge(original_2,'prewitt');
E2 = edge(original_2,'roberts');
E3 = edge(original_2,'log');
figure(3);
subplot(2,2,1), imshow(original_2), title('Original image');
subplot(2,2,2), imshow(E2), title('Prewitt edge detection');
subplot(2,2,3), imshow(E1), title('Roberts edge detection');
subplot(2,2,4), imshow(E2), title('Log edge detection');

%Image sharpness
unsharp_image = imread('westconcordorthophoto.png');
sharp_image = imsharpen(unsharp_image, 'Radius', 2, 'Amount', 1);
figure(4);
subplot(1,2,1), imshow(unsharp_image), title('Unsharp image');
subplot(1,2,2), imshow(sharp_image), title('Sharp image');

%Fourier transform
[original_3, colormap] = imread('saturn.png');
Gray_scale = rgb2gray(original_3);
figure(5);
subplot(1,2,1), imshow(original_3), title('Original image');
subplot(1,2,2), imshow(Gray_scale), title('Gray scale image');

Image_fft2 = fft2(Gray_scale);
Image_fftshift = fftshift(Image_fft2);

figure(6);
subplot(1,2,1), imshow(log(abs(Image_fftshift)),[]), title('fft2 filter');
Image_fftshift(abs(Image_fftshift) < 1000) = 0;
subplot(1,2,2), imshow(log(abs(Image_fftshift)) + eps,[]), title('Removing the noise');

