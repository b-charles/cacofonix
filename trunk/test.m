
clc

clear classes

NoteInit_fr

chord = [ V V^[2 0] V^[4 0] +V ];
sheet = [ ...
	do*chord:R ...
	-do*chord:R ...
	++do*chord:R ];

cacofonix( 'Test', sheet );