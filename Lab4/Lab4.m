%% Exercise 4.1
%a
% The reverb delay in seconds will be equal to the number of samples
%times the period of a sample, s*(1/fs)
%The impulse response is  h(n) = δ[n] + Aδ[n-s]
%apply to h(n) = δ[n] + 0.8δ[n-8000]
h = [1 zeros(1,7999) 0.8];

%b

[tyb_orig,fs] = audioread('TreatYouBetter.wav');
tyb_reverb = reverb_conv(tyb_orig, 8000, 0.8);
%soundsc(tyb_reverb,fs);
audiowrite('tyb_reverb.wav',tyb_reverb,fs);

%d

tyb_tremolo = tremolo(tyb_orig, 10/fs, 0.3);
%soundsc(tyb_tremolo,fs);
audiowrite('tyb_tremolo.wav',tyb_tremolo,fs);
% the tremolo makes the audio amplitude follow a cyclic pattern, as defined
% by the cos portion of the tremolo formula. This leads to the percieved
% volume of the audio going up and down.

%e
tyb_faded = tremolo(tyb_orig, 1/length(tyb_orig), 1);
%soundsc(tyb_faded,fs)

%The audio fades in and out becuase the the amplitude of tremelo effect is
%1. This means that as the cos goes into the negative portion, it reduces
%the signal progressivley towards zero

%f

tyb_faded_N = [zeros(1,123480) tyb_faded];
soundsc(tyb_faded_N,fs);
audiowrite('tyb_faded_N.wav',tyb_faded_N,fs);
tyb_orig_N = [zeros(1,123480) tyb_orig.'];
tyb_N_faded = tremolo(tyb_orig_N, 1/length(tyb_orig), 1);
soundsc(tyb_N_faded,fs);
audiowrite('tyb_N_faded.wav',tyb_N_faded,fs);

% The two do not sound the same. One fades in at the beggining while one
% fades out. This is because the cos function changes the already faded
% audio in a different manner than it changes the original audio.

%% Exercise 4.2

%a

wa = [1/9 1/9 1/9, 1/9 1/9 1/9, 1/9 1/9 1/9];
lighthouse = load('lighthouse.mat');
lighthouse_orig = lighthouse.lighthouse;
x = 0:1:size(lighthouse_orig,2);
y = 0:1:size(lighthouse_orig,1);

colormap('gray');

figure(1) ;
subplot (2 ,2 ,1) ; 
imagesc (x , y , lighthouse_orig) ; 
axis image ; 
title ( 'Original ')

lighthouse_wa = filter2(wa,lighthouse_orig);

subplot (2 ,2 ,2) ; 
imagesc (x , y , lighthouse_wa) ; 
axis image ; 
title ( 'Filtered wa')

% The filter blurs the image. This is known from the fact that the impulse
% response returned 1/9th for all values. Meaning that the original ones
% matrix was scaled by 1/9th. Coincidingly, the lighthouse image was scaled
% by 1/9th

%b

wb = [1/9 1/9 1/9, 1/9 -8/9 1/9, 1/9 1/9 1/9];

colormap('gray');

lighthouse_wb = filter2(wb,lighthouse_orig);

subplot (2 ,2 ,3) ; 
imagesc (x , y , lighthouse_wb) ; 
axis image ; 
title ( 'Filtered wb')

% This filter extracted the edges from the image. This can be seen through
% the filter as the middle value in the kernal remains close to it's
% original absolute value, but the edges are significantly reduced.

%c

% the impulse response can be given by [8/9 8/9 8/9; 8/9 17/9 8/9; 8/9 8/9
% 8/9

figure(2) ;
colormap('gray')
subplot (2 ,2 ,1) ; 
imagesc (x , y , lighthouse_orig) ; 
axis image ; 
title ( 'Original ')

lighthouse_unsharp = image_unsharp_masking(lighthouse_orig);

subplot (2 ,2 ,2) ; 
imagesc (x , y , lighthouse_unsharp) ; 
axis image ; 
title ( 'unsharp filter')

% This filter sharpens the image by making the edges of the image more
% pronounced. It is different from the other two images as one extracted
% edges and one blurred the image

%d

%da

figure(3) ;
colormap('gray');
subplot (2 ,2 ,1) ; 
imagesc (x , y , lighthouse_orig) ; 
axis image ; 
title ( 'Original ')

length(x); % 427
length(y); % 327

lighthouse_wa = conv2(wa,lighthouse_orig);
x = 0:1:size(lighthouse_wa,2);
y = 0:1:size(lighthouse_wa,1);

length(x); %435
length(y); % 327

subplot (2 ,2 ,2) ; 
imagesc (x , y , lighthouse_wa) ; 
axis image ; 
title ( 'conv wa')

% The size of the x axis was enlarged

%db

wb = [1/9 1/9 1/9, 1/9 -8/9 1/9, 1/9 1/9 1/9];

colormap('gray');

lighthouse_wb = conv2(wb,lighthouse_orig);
x = 0:1:size(lighthouse_wb,2);
y = 0:1:size(lighthouse_wb,1);

length(x); %435
length(y); % 327

subplot (2 ,2 ,3) ; 
imagesc (x , y , lighthouse_wb) ; 
axis image ; 
title ( 'conv wb')

% The size of the convoluded image is larger in the x axis, in comparison
% to the original

%dc
figure(4) ;
colormap('gray')
subplot (2 ,2 ,1) ; 
imagesc (x , y , lighthouse_orig) ; 
axis image ; 
title ( 'Original ')

lighthouse_unsharp = image_unsharp_masking_conv(lighthouse_orig);
x = 0:1:size(lighthouse_unsharp,2);
y = 0:1:size(lighthouse_unsharp,1);

length(x); %435
length(y); % 327

subplot (2 ,2 ,2) ; 
imagesc (x , y , lighthouse_unsharp) ; 
axis image ; 
title ( 'unsharp filter conv')

%% FUNCTIONS USED

type reverb_conv
type reverb_filter
type reverb_own
type tremolo
type image_unsharp_masking
type image_unsharp_masking_conv
















