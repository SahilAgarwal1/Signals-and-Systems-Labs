%%Exercise 3.1
% USER DEFINED VARIABLES

w = 15; % Width
x = 1:160; % Horiztonal Axis
y = 1:80; % Vertical Axis

% == > Creates a Matrix with the parameters from the above <==
z = round (127* exp ( -1/ w .^2*(( y .'-40) .^2+( x -80) .^2) ) ); 

% == > changes the colormap matrix to the gray scale<==
colormap ( gray ) ;

% == > Image system 1 stretches the image, image system 2 moves the image 
% to the lower left, image system 3 makes the image split to the 4 corners
%of the figure<==
[ xs , ys , zs ] = image_system1 (z ,2 ,2) ;
za               = image_system2 ( zs , -10 ,35) ;
zb               = image_system3 ( za , -30 ,35) ;

% PLOT RESULT WITH SUBPLOT

figure (1) ;
subplot (2 ,2 ,1) ; % == > puts plot in 1st box of 4x4 figure matrix <==
imagesc (x , y , z ) ; % == > plots the image matrix z in a x by y plot <==
axis image ; % == > plot box fits around data <==
title ( 'Original ')
subplot (2 ,2 ,2) ; % == > puts plot in 2nd box of 4x4 figure matrix<==
imagesc ( xs , ys , zs ) ; % == > plots image Zs in xs and ys axis <==
axis image ; % == > plot box fits around image<==
title ( ' After System 1 ')
subplot (2 ,2 ,3) ; % == > Plots data in 3rd box of 4x4 figure matrix <==
imagesc ( xs , ys , za ) ; % == > plots za on xs and ys axis<==
axis image ; % == > fits plot box to island <==
title ( ' After System 2 ')
subplot (2 ,2 ,4) ; % == > Plots in the 4th box of the 4x4 figure matrix <==
imagesc ( xs , ys , zb ) ; % == > Plots zb in the xs and ys  <==
axis image ; % == > fits plot box to plot data <==
title ( ' After System 3 ')

%%Exercise 3.2
%b
colormap('gray')
lighthouse = load('lighthouse.mat');
x = 0:1:size(lighthouse.lighthouse,2);
y = 0:1:size(lighthouse.lighthouse,1);
[xs , ys, lighthouse_sampled] = image_sample(lighthouse.lighthouse, 2);

figure (2) ;
subplot (2 ,2 ,1) ; 
imagesc (x , y , lighthouse.lighthouse ) ; 
axis image ; 
title ( 'Original ')

subplot (2 ,2 ,2) ; 
imagesc (xs , ys , lighthouse_sampled ) ; 
axis image ; 
title ( 'sampled ')

%the sampling makes the image blurrier, and the image loses some of its
%details. This relates to how signals lose information when undersampled
lighthouse_aax6 = lighthouse.lighthouse;

%d

for k = 1:6
    lighthouse_aax6 = image_antialias(lighthouse_aax6);
end

subplot (2 ,2 ,3) ; 
imagesc (x , y , lighthouse_aax6) ; 
axis image ; 
title ( 'Anti-Aliased ')

[xs, ys ,lighthouse_aax6_sampled] = image_sample(lighthouse_aax6,2);

subplot (2 ,2 ,4) ; 
imagesc (xs , ys , lighthouse_aax6_sampled) ; 
axis image ; 
title ( 'Anti-Aliased Sampled')

%f

[xz,yz,lighthouse_zeros] = image_insertzeros(lighthouse_aax6_sampled,2);

for k = 1:6
    lighthouse_interpolated = image_antialias(lighthouse_zeros);
end  

% The dimensions of the interpolated image is the same as the original
figure(3);
colormap('gray')
subplot (2 ,2 ,1) ; 
imagesc (x , y , lighthouse.lighthouse ) ; 
axis image ; 
title ( 'Original ')

subplot (2 ,2 ,2) ; 
imagesc (xz , yz , lighthouse_zeros ) ; 
axis image ; 
title ( 'zeros ')

subplot (2 ,2 ,3) ; 
imagesc (xz , yz , lighthouse_interpolated ) ; 
axis image ; 
title ( 'interpolated')

% The interpolation filter smoothes the image out and creates the illusion
% of recovered information. This is useful in smoothing out signals for
% user reception

%%FUNCTIONS USED
type 'image_system2'
type 'image_system1'
type 'image_system3'
type 'image_insertzeros'
type 'image_sample'
type 'image_antialias'






