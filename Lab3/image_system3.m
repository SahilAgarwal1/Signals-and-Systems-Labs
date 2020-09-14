function [ zb ] = image_system3 ( za , Sx , Sy )
% IMAGE_SYSTEM3 === > This function overlaps the image across axis
%boundries<===
% ==== > Create new axis<====
x = 0:1: size ( za ,2) -1;
y = 0:1: size ( za ,1) -1;
% ==== > Rescale with mod operator <====
xs = mod (x - Sx , size ( za ,2) ) ;
ys = mod (y - Sy , size ( za ,1) ) ;
% ==== > Instantiate the image matrix with the new info <====
zb = za ( ys +1 , xs +1) ;
end