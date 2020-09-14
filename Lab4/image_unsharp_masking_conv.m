function im_out = image_unsharp_masking_conv(im_in)
%wb = [1/9 1/9 1/9, 1/9 -8/9 1/9, 1/9 1/9 1/9];
%im_temp = conv2(wb,im_in);
%spatial = [0 0 0; 0 1 0; 0 0 0];
spatial = [8/9 8/9 8/9; 8/9 -17/9 8/9; 8/9 8/9 8/9];
im_out = conv2(spatial,im_in);
%im_out = im_in - im_temp;
end