function env_note = adsr ( note )
% This function smoothes out the transitions between the notes by adding
% decays and attack to subsequent notes

% Below are the parameters that specify the ADSR envelope
Pattack = .2; % Length of attack ( proportion )
Pdecay = .1; % Length of decay ( proportion )
Prelease = .3; % Length of release ( proportion )
Vattack = 1; % Attack maximum value
Vsustain = 0.75; % Sustain value

L = length ( note ) ; % Length of note signal
Lattack = floor ( L * Pattack ) ;% Length of attack
Ldecay = floor ( L * Pdecay ) ; % Length of decay
Lrelease = floor ( L * Prelease ) ; % Legnth of release
Lsustain = L - Lattack - Ldecay - Lrelease ; % length of sustain


% Generate the ADSR portions of the time weights
attack = linspace (0 , Vattack , Lattack ) ;
decay = linspace ( Vattack , Vsustain , Ldecay ) ;
sustain = linspace ( Vsustain , Vsustain , Lsustain ) ;
release = linspace ( Vsustain , 0 , Lrelease ) ;
% Concatenate to get time weight vector
weight = [ attack , decay , sustain , release ];
env_note = weight .* note; % Apply ADSR envelop to note
end

