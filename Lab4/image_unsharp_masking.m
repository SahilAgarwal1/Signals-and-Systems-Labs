function im_out = image_unsharp_masking(im_in)
wb = [1/9 1/9 1/9, 1/9 -8/9 1/9, 1/9 1/9 1/9];
im_temp = filter2(wb,im_in);
im_out = im_in - im_temp;
end

