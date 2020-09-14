

function x = build_song_wo_adsr ( keys , Xs , start_times , end_times , fs )
% build_song : This function takes in the input parameters used to describe
% a song, and outputs a sampled vector representing the signal of the song
%
% Input Args :
%   keys : A length - N vector of key / note numbers , where
%   N = number of notes in song
%   Xs : A length - N vector of phasors
%   start_times : A length - N vector of start times of notes
%                   ( in seconds )
%   end_times : A length - N vector of end times of notes
%               ( in seconds )
%   fs : A scalar indicating the sampling rate ( in Hz )
%
% Output :
%   x : A vector that holds the signal samples of the song built

len_in_samples = ceil(max(end_times)*fs) + 1; % the ceil function ensures a
% whole number is returned to define the size;
x = zeros(1,len_in_samples);

for i = 1: (length(keys))
    note = key_to_musical_note(keys(i), Xs, end_times(i) - start_times(i), fs);
    start_in_samples = round(start_times(i) * fs) +1;
    end_in_samples = start_in_samples + length(note) -1;
    x(start_in_samples:end_in_samples) = x(start_in_samples:end_in_samples) + note;
end
end


