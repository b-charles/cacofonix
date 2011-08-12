%#ok<*BDSCA>
clc

Note.setNbCharByQuater( 48 );

MARK1  = Note( 'Marker', '#1#' );
MARK1_ = Note( 'Marker', '#1_#' );
MARK2  = Note( 'Marker', '#2#' );

%% MAIN

NoteInit_fr

M98 = [ S:C*9 bar ];
M916 = [ S:D*9 bar ];

MAIN = [ ...
	Note( [9 8] ) Note('Tempo',55) M98*5 S:N' S:N' Note('Fermata', N', B) S:N' bar ...
	MARK1 M98*6 S:N' S:N' Note('Fermata', N', B) S:N' bar MARK1_ Note([9 16]) Note('Tempo',84) M916*3 ...
	MARK2 M916 Note([9 8]) M98 ...
	];

%% PETITE FLUTE

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

PETITE_FLUTE = [ ...
S:C*9 bar ...
DynPP +doB:D +doB:D +doB:'.':C S:C laB:D laB:D laB:'.':C S:C fa:D fa:D fa:'.':C S:C bar ...
reN:B' ~reN:N' bar ...
~reN:B' ~reN:N' bar ...
~reN:B' ~reN:N' bar ...
~reN:B' ~reN:N' bar ...
MARK1 S:B' S:N' bar ...
DynPP +miN:D +miN:D +miN:'.':C S:C +do:D +do:D +do:'.':C S:C la:D la:D la:'.':C S:C bar ...
faN:B' ~faN:N' bar ...
~faN:B' ~faN:N' bar ...
~faN:B' ~faN:N' bar ...
~faN:B' ~faN:N' bar ...
S:B' S:N' bar ...
MARK1_ DynF Note('+') fa:Q ~sol:Q ~la:'.':T S:D sol:'.':D la:T ~sol:'.':T faD:'.':D sol:'.':D la:'.':D S:D sol:'.':D bar ...
la:T ~sol:'.':T S:D solB:'.':D sol:T ~solB:'.':T S:D fa:'.':T ~solB:T fa:'.':D S:D miN:'.':D bar ...
miN:'.':D miB:'.':D reN:'.':D reB:'.':D do:'.':D -siN:'.':D -siN:'.':D -siB:'.':D -laN:'.':D bar ...
MARK2 -laB:'.':D -solN:'.':D -laB:'.':D S:C' S:C' bar ...
];

%% GRANDES FLUTES

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

GRANDES_FLUTES = [ ...
S:C*9 bar ...
DynPP solD++miN:D solD++miN:D solD++miN:'.':C S:C laD++reN:D laD++reN:D laD++reN:'.':C S:C siN++doD:D siN++doD:D siN++doD:'.':C S:C bar ...
solD++do:D solD++do:D solD++do:'.':C S:C S:B' bar ...
S:C*9 bar ...
Note('+') DynP ~[ fa:N' +do:N' +do:C +reN:C +miN:C bar ...
+fa:B' +fa:N' ] bar ...
MARK1 S:B' S:N' bar ...
DynPP do+la:D do+la:D do+la:'.':C S:C reN+solB:D reN+solB:D reN+solB:'.':C S:C reB+faB:D reB+faB:D reB+faB:'.':C S:C bar ...
doB+mi:D doB+mi:D doB+mi:'.':C S:C S:B' bar ...
S:B' S:N' bar ...
DynP ~[ la:N' Note('++') mi:N' mi:C fa:C sol:C bar ...
DynPP Note('cresc*',[B' N],'mp') la:B' la:N ] Note('dynamics*','mf') S:C bar ...
S:B' S:N' bar ...
MARK1_ DynF Note('+') siN++reN:'.':D S:D S:D S:C' S:C' bar ...
[ +reN:'.':D S:C +reB:'.':D S:C +do:'.':D S:C ] / [ +la:T ~+sol:'.':T S:D +solB:D +sol:T ~+solB:'.':T S:D +fa:D +solB:T +fa:T S:D +miN:D ] bar ...
siN++miN:'.':D siB++miB:'.':D laN++reN:'.':D laB++reB:'.':D sol++do:'.':D solB+siN:'.':D solB+siN:'.':D faN+siB:'.':D miN+laN:'.':D bar ...
MARK2 miB+laB:'.':D reN+solN:'.':D miB+laB:'.':D S:C' S:C' bar ...
];

%% HAUTBOIS

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

HAUTBOIS = [ ...
S:N' S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
DynP ~[ fa:N' +do:N' +do:C +reN:C +miN:C bar ...
+fa:N' +fa:C ] S:N S:N' bar ...
S:N' S:N' S:N' bar ...
MARK1 S:B' S:N' bar ...
S:B' S:N' bar ...
S:B' S:N' bar ...
Note('+') ~[ -la:N' mi:N' mi:C fa:C sol:C bar ...
la:N' la:C ] S:C S:C S:N' bar ...
S:B' S:N' bar ...
S:B' S:N' bar ...
MARK1_ DynF Note('+') [ -siN:'.':D S:[D D N' N'] ] / [ fa:Q ~sol:Q ~la:'.':T S:D sol:'.':D la:T ~sol:'.':T faD:'.':D sol:'.':D la:'.':D S:D sol:'.':D ] bar ...
[ -siN:'.':D S:C -siB:'.':D S:C -laN:D S:C ] / [ la:T ~sol:'.':T S:D solB:'.':D sol:T ~solB:'.':T S:D fa:'.':T ~solB:T fa:'.':D S:D miN:'.':D ] bar ...
-laB+miN:'.':D -sol+miB:'.':D -solB+reN:'.':D -faN+reB:'.':D -miN+do:'.':D -miB+-siN:'.':D -miB+-siN:'.':D -reN+-siB:'.':D -reB+-laN:'.':D bar ...
MARK2 -doN+-laB:'.':D --siN+-solN:'.':D -doN+-laB:'.':D S:C' S:C' bar ...
];

%% CLARINETTES

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );

CLARINETTES = [ ...
S:N' S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
DynP ~[ sol:N' +re:N' re:C miN:C faD:C bar ...
sol:N' sol:C ] S:N S:N' bar ...
S:N' S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
MARK1 S:B' S:N' bar ...
S:B' S:N' bar ...
DynP ~[ si:N' +fa:N' fa:C sol:C la:C bar ...
si:N' si:C ] S:C S:C S:N' bar ...
S:B' S:N' bar ...
S:B' S:N' bar ...
S:B' S:N' bar ...
MARK1_ DynF Note('+') [ miN:'.':D S:[D D N' N'] ] / [ sol:Q ~la:Q ~si:'.':T S:D la:'.':D si:T ~la:'.':T solD:'.':D la:'.':D si:'.':D S:D la:'.':D ] bar ...
[ miN:'.':D S:C miB:'.':D S:C re:D S:C ] / [ si:T ~la:'.':T S:D laB:'.':D la:T ~laB:'.':T S:D sol:'.':T ~laB:T sol:'.':D S:D faD:'.':D ] bar ...
doD+faD:'.':D doN+faN:'.':D -siN+miN:'.':D -siB+miB:'.':D -laN+re:'.':D -laB+reB:'.':D -laB+reB:'.':D -solN+doN:'.':D -faD+-siN:'.':D bar ...
MARK2 -faN+-siB:'.':D -miN+-la:'.':D -faN+-siB:'.':D S:C' S:C' bar ...
];

%% CLARINETTE BASS

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );

CLARINETTE_BASSE = [ ...
~MARK2 S:C' S:C' S:C' bar ...
];

%% BASSONS (1 et 2)

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

BASSONS12 = [ ...
~MARK1 ...
];

%% BASSON (3)

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

BASSON3 = [ ...
~MARK1 ...
];

%% CONTREBASSON

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

CONTREBASSON = [ ...
~MARK1 ...
];

%% CORS (1 et 2)

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );

CORS12 = [ ...
~MARK1_ Note('+0') re++do:'.':D S:D S:D S:C' S:C' bar ...
S:C' S:C' S:C' bar ...
S:C' S:C' S:C' bar ...
MARK2 ...
];

%% CORS (3 et 4)

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );

CORS34 = [ ...
~MARK1_ Note('+0') la++faD:'.':D S:D S:D S:C' S:C' bar ...
S:C' S:C' S:C' bar ...
S:C' S:C' S:C' bar ...
MARK2 ...
];

%% TROMPETTES

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );

TROMPETTES = [ ...
~MARK2 Note('+0') DynpF laB:'.':D S:D S:D +miB:'.':D S:D S:D miB:'.':D fa:'.':D sol:'.':D bar ...
Note('cresc*',B,'p') laB:N' ~laB:C S:C S:C S:N' bar ...
];

%% CORNETS

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );

CORNETS = [ ...
~MARK1 ...
];

%% TROMBONES

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

TROMBONES = [ ...
~MARK1 ...
];

%% TIMBALES

TIMBALES = [ ...
~MARK1 ...
];

%% HARPE

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

HARPE_MD = [ ...
S:N' S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
S:N' S:N' DynP la:C S:N bar ...
fa:C S:C S:C Note('++') DynPP do:C S:C S:C la:C S:C S:C bar ...
fa:C S:C S:C +do:C S:C S:C S:N' bar ...
MARK1 S:B' S:N' bar ...
S:B' S:N' bar ...
S:N' DynP Note('+0') mi:C S:C S:C S:N' bar ...
S:N' mi:C S:C S:C +doB:C S:C S:C bar ...
la:C S:C S:C DynPP Note('+++') -mi:C S:C S:C doB:C S:C S:C bar ...
-la:C S:C S:C mi:C S:C S:C S:N' bar ...
S:B' S:N' bar ...
MARK1_ S:D*9 bar ...
S:D*9 bar ...
S:C' DynFF Note('+0') ~[ doB:T re:T mi:T faB:T solB:T la:T si:T +doB:T +re:T +mi:T +faB:T +solB:T ] bar ...
MARK2 +la:'.':D S:D S:D S:C' S:C' bar ...
];

HARPE_MG = [ ...
S:N' S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
DynP -fa:C S:C S:C do:C S:C S:C -do:C S:C S:C bar ...
-fa:C S:C S:C do:C S:C S:C S:N' bar ...
S:N' S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
MARK1 S:B' S:N' bar ...
S:B' S:N' bar ...
Note('-') la:C S:[ C C ] S:N' mi:C S:[ C C ] bar ...
la:C S:[ C C ] S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
S:N' S:N' S:N' bar ...
MARK1_ S:C' S:C' S:C' bar ...
S:C' S:C' S:C' bar ...
S:C' S:C' S:C' bar ...
MARK2 S:C' S:C' S:C' bar ...
];

%% GLOCKENSPIEL

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

GLOCKENSPEIL = [ ...
~MARK1 ...
];

%% GROSSE CAISSE

GROSSE_CAISSE = [ ...
~MARK1 ...
];

%% CYMBALES

CYMBALES = [ ...
~MARK1 ...
];

%% TRIANGLE

TRIANGLE = [ ...
~MARK1 ...
];

%% VIOLONS (1)

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

VIOLONS1 = [ ...
DynPP Note('+') la:C S:C S:C S:B' bar ...
DynP ~[ +do:N +do:D si:T +do:T ] ~[ la:N la:D sol:T la:T ] ~[ fa:N fa:D miN:T fa:T ] bar ...
reN:N ~reN:D S:D S:B' bar ...
S:N' S:N' S:N' bar ...
DynPP [ S:B' +la:N' bar ~+la:[B' N'] ] / [ S:N' +do:B' bar ~+do:[B' N'] ] / [ fa:[B' N'] bar ~fa:[B' N'] ] bar ...
MARK1 Note('++') DynPP -la:'.':C S:C S:C S:B' bar ...
DynP ~[ miN:N miN:D reN:T miN:T ] ~[ do:N do:D -siN:T do:T ] Note('+') ~[ la:N la:D solN:T la:T ] bar ...
faN:[ N D ] S:D S:B' bar ...
S:N' S:N' S:N' bar ...
DynPP Note('++') [ -la:B' ~-la:N' ] / [ S:N' mi:B' ] / [ S:B' +doB:N' ] bar ...
-la+mi++doB:[B' N'] bar ...
S:B' S:N' bar ...
MARK1_ Note('+') DynP -reN+-siN+la:D S:D S:D S:C' S:C' bar ...
DynP siN++reN:D S:D S:D siB++reB:D S:D S:D laN++do:D S:D S:D bar ...
laB+siN:D S:D S:D fa+laB:D S:D S:D siN++reN:D S:D S:D bar ...
MARK2 DynF +do++mi:D S:D S:D S:C' S:C' bar ...
];

%% VIOLONS (2)

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

VIOLONS2 = [ ...
DynPP la:C S:C S:C S:B' bar ...
DynP ~[ solD++miN:N solD++miN:D siN++faD:T solD++miN:T ] ~[ laD++reN:N laD++reN:D +doN++mi:T laD++reN:T ] ~[ siN++doD:N siN++doD:D la++reN:T siN++doD:T ] bar ...
solD++do:[ N D ] S:D S:B' bar ...
DynPP [ S:B' +la:N' bar ~+la:[B' N'] bar ~+la:[B' N'] ] / [ S:N' +do:B' bar ~+do:[B' N'] bar ~+do:[B' N'] ] / [ [fa:[B' N'] bar]*3 ] ...
MARK1 DynPP la:C S:C S:C S:B' bar ...
DynP Note('+') ~[ doN+solD:N doN+solD:D miN+laD:T doN+solD:T ] ~[ reN+faD:N reN+faD:D miN+solD:T reN+faD:T ] ~[ doD+miN:N doD+miN:D reN+faD:T faD+miN:T ] bar ...
-siN+reD:N ~-siN+reD:D S:D S:B' bar ...
DynPP [ -la:B' -la:N' ] / [ S:N' mi:B' ] / [ S:B' +doB:N' ] bar ...
~-la+mi++doB:[ B' N' ] bar ...
~-la+mi++doB:[ B' N' ] bar ...
S:B' S:N' bar ...
MARK1_ DynF Note('+0') -sol+reN+siN++fa:D S:D S:D S:C' S:C' bar ...
siN++reN:D S:[ D D ] siB++reB:D S:[ D D ] laN++do:D S:[ D D ] bar ...
laB+siN:D S:[ D D ] fa+laB:D S:[ D D ] siN++reN:D S:[ D D ] bar ...
MARK2 DynF +do++mi:D S:[ D D ] S:C' S:C' bar ...
];

%% ALTOS

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

ALTOS = [ ...
DynPP -la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
MARK1 DynP -la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
MARK1_ ...
];

%% VIOLONCELLES

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

VIOLONCELLES = [ ...
Note('-') DynPP -la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
MARK1 DynP -la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
~-la+re:B' ~-la+re:N' bar ...
MARK1_ ...
];

%% CONTREBASSES

NoteInit_fr
T = Note( 1/8 );
Q = Note( 1/16 );
[ si, siN ] = deal( siB, si );
[ mi, miN ] = deal( miB, mi );
[ la, laN ] = deal( laB, la );
[ re, reN ] = deal( reB, re );

CONTREBASSES = [ ...
~MARK1 ...
];

%% CACOFONIX

cacofonix( 'ApprentiSorcier', MAIN, ...
	'Piccolo', PETITE_FLUTE, ...
	'Flute', GRANDES_FLUTES, ...
	'Oboe', HAUTBOIS, ...
	'Clarinet', ( CLARINETTES / CLARINETTE_BASSE )^[-1 -1] , ...
	'Bassoon', BASSONS12 / BASSON3 / CONTREBASSON, ...
	'French Horn', ( CORS12 / CORS34 )^[3 0], ...
	'Trumpet', TROMPETTES, ...
	'English Horn', CORNETS^[-1 -1], ...
	'Trombone', TROMBONES, ...
	'Timpani', TIMBALES, ...
	'Orchestral Harp', HARPE_MD / HARPE_MG, ...
	'Glockenspiel', GLOCKENSPEIL, ...
	'Acoustic Bass Drum', GROSSE_CAISSE, ...
	'Crash Cymbal 1', CYMBALES, ...
	'Open Triangle', TRIANGLE, ...
	'Violin', VIOLONS1 / VIOLONS2 / ALTOS, ...
	'Cello', VIOLONCELLES, ...
	'Contrabass', CONTREBASSES );
