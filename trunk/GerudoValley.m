
%
% Gerudo Valley
%
% Compositor: Koji Kondo
% From: The Legend of Zelda: Ocarina of Time
%

%#ok<*BDSCA>
clc

NoteInit

[Fn, F] = deal( F, Fs );
[Cn, C] = deal( C, Cs );
[Gn, G] = deal( G, Gs );

MarkerIntro = Note( 'Marker', 'Intro' );
MarkerA = Note( 'Marker', 'A' );
MarkerB = Note( 'Marker', 'B' );
MarkerC = Note( 'Marker', 'C' );
MarkerD = Note( 'Marker', 'D' );
MarkerE = Note( 'Marker', 'E' );
MarkerF = Note( 'Marker', 'F' );

MarkerEND = Note( 'Marker', 'END' );

%% MAIN

P = [ R:N bar ];
MAIN = [ ...
	MarkerIntro P*3 ...
	MarkerA P*8 ...
	MarkerB P*8 MarkerEND P*8 ...
	MarkerC P*16 ...
	MarkerD P*16 ...
	MarkerE P*16 ...
	MarkerF P*8 ...
	];

%% GUITAR 1

GUITAR1 = [ ...
	MarkerIntro Note( '+0' ) ...
	C:N8 G:N8 B:N8 +D:N8 ~+D:N8 +F:N4 +A:N8 bar ...
	~+A:N8 +Fn:N8 +Fn++G:N8 +Fn++B:N8 +Fn+++C:N2 bar ...
	~+Fn+++C:N bar ...
	MarkerA ~MarkerB Note( '+' ) ...
	R:N8 C:N8 F:N8 G:N8 A:N4' C:N8 bar ...
	F:N8 G:N8 A:N4 ~A:N2 bar ...
	R:N8 D:N8 F:N8 G:N8 A:N4' D:N8 bar ...
	F:N8 G:N8 A:N4 ~A:N2 bar ...
	R:N8 -B:N8 E:N8 F:N8 G:N4' -B:N8 bar ...
	E:N8 F:N8 G:N4 ~G:N2 bar ...
	R:N8 F:N8 G:N8 F:N8 Es:N2 bar ...
	~Es:N bar ...
	MarkerEND R:N8 C:N8 F:N8 G:N8 A:N4' C:N8 bar ...
	F:N8 G:N8 A:N4 ~A:N2 bar ...
	R:N8 D:N8 F:N8 G:N8 A:N4' D:N8 bar ...
	F:N8 G:N8 A:N4 ~A:N2 bar ...
	R:N8 -B:N8 E:N8 F:N8 G:N4' -B:N8 bar ...
	E:N8 F:N8 G:N4 ~G:N2 bar ...
	R:N8 A:N8 B:N8 A:N8 G:N2 bar ...
	~G:N bar ...
	MarkerC Note( '+' ) ...
	R:N4 C:N4' A:N4' bar ...
	G:N4' F:N4' C:N4 bar ...
	E:N2 E:N8 F:N8 E:N8 D:N8 bar ...
	~D:N2' R:N4 bar ...
	R:N4 -B:N4' G:N4' bar ...
	F:N4' E:N4' D:N4 bar ...
	C:N2 D:N8 E:N8 D:N8 C:N8 bar ...
	~C:N2' R:N4 bar ...
	R:N4 C:N4' A:N4' bar ...
	G:N4' F:N4' C:N4 bar ...
	E:N2 E:N8 F:N8 E:N8 D:N8 bar ...
	~D:N2' -F+-A:N4 bar ...
	-B+-E:N2' -B+F:N4 bar ...
	-B+E:N2' -G+D:N4 bar ...
	-G+C:N bar ...
	~-G+C:N2' R:N4 bar ...
	MarkerD Note( '+' ) ...
	R:N4 A:N4' G:N4' bar ...
	A:N4' G:N4' C:N4 bar ...
	E:N2 ~E:N8 D:N8 C:N8 D:N8 bar ...
	~D:N2' R:N4 bar ...
	R:N4 G:N4' F:N4' bar ...
	G:N4' E:N4' D:N4 bar ...
	C:N2 D:N8 E:N8 D:N8 C:N8 bar ...
	~C:N2' R:N4 bar ...
	R:N4 -F:N8 -G:N8 -A:N8 C:N4 R:N8 bar ...
	-F:N8 -G:N8 -A:N8 C:N8 ~C:N4' R:N8 bar ...
	R:N4 -F:N8 -G:N8 -A:N8 D:N4 R:N8 bar ...
	-F:N8 -G:N8 -A:N8 D:N8 ~D:N4 -F+-A:N4 bar ...
	-E+-B:N2' E+G:N4 bar ...
	D+F:N2' -G+-B:N4 bar ...
	-G+C:N bar ...
	~-G+C:N2' R:N4 bar ...
	MarkerE ~MarkerF ...
	Note( '+' ) ...
	-C:N4 -A:N8 -G:N8 ~-G:N4 -A:N4 bar ...
	-C:N4 -A:N8 -G:N8 ~-G:N4 -A:N4 bar ...
	-D:N4 -A:N8 -G:N8 ~-G:N4 -A:N4 bar ...
	-D:N4 -A:N8 -G:N8 ~-G:N4 -A:N4 bar ...
	-E:N4 -B:N8 -As:N8 ~-As:N4 -B:N4 bar ...
	-E:N4 -B:N8 -As:N8 ~-As:N4 -B:N4 bar ...
	D:N8 E:N8 D:N8 C:N8 ~C:N2 bar ...
	~C:N2 R:N2 bar ...
	];

%% GUITAR 2

ACC1 = [ -A C F ];
ACC2 = [ -A D F ];
ACC3 = [ -G D E ];
ACC4 = [ -G -B Fn ];

RYT = [ V-0:N8 V-0:N8 V-0:N8 V-0:N8 R:N8 V-0:N4 V-0:N8 bar ];

RIFF = [ ...
	ACC1*RYT ACC1*RYT ...
	ACC2*RYT ACC2*RYT ...
	ACC3*RYT ACC3*RYT ...
	ACC4*RYT ACC4*RYT ...
	];

GUITAR2 = [ MarkerIntro Note( '+' ) ...
	-C:N bar ...
	~-C:N8 -G:N8 -Fn:N8 -D:N8 -C:N2 bar ...
	~-C:N bar ...
	Note( '+' ) ...
	MarkerA RIFF ...
	MarkerB RIFF MarkerEND RIFF ...
	MarkerC RIFF RIFF ...
	MarkerD RIFF RIFF ...
	MarkerE RIFF RIFF ...
	MarkerF RIFF ];

%% TRUMPET

PAUSE = [ R:N bar ];

TRUMPET = [ Note( '+0' ) ...
	~MarkerB ~MarkerEND ...
	R:N8 C:N8 F:N8 G:N8 A:N4' C:N8 bar ...
	F:N8 G:N8 A:N4 ~A:N2 bar ...
	R:N8 D:N8 F:N8 G:N8 A:N4' D:N8 bar ...
	F:N8 G:N8 A:N4 ~A:N2 bar ...
	R:N8 -B:N8 E:N8 F:N8 G:N4' -B:N8 bar ...
	E:N8 F:N8 G:N4 ~G:N2 bar ...
	R:N8 A:N8 B:N8 A:N8 G:N2 bar ...
	~G:N bar ...
	MarkerC ~MarkerE ...
	A:N8 G:N8 A:N2' bar ...
	R:N4 F:N8 G:N8 A:N8 B:N8 A:N8 G:N8 bar ...
	A:N8 G:N8 A:N2' bar ...
	~A:N2' R:N4 bar ...
	G:N8 A:N8 G:N2' bar ...
	R:N4 E:N8 F:N8 G:N8 A:N8 G:N8 F:N8 bar ...
	G:N8 F:N8 Es:N2' bar ...
	~Es:N2' R:N4 bar ...
	A:N8 G:N8 A:N2' bar ...
	R:N4 F:N8 G:N8 A:N8 B:N8 A:N8 G:N8 bar ...
	A:N8 G:N8 A:N2' bar ...
	~A:N2' R:N4 bar ...
	B:N8 A:N8 B:N2' bar ...
	R:N4 G:N8 A:N8 B:N8 +C:N8 +D:N8 +E:N8 bar ...
	+C:N8 +D:N8 +C:N2' bar ...
	~+C:N2' R:N4 bar ...
	MarkerF ];

TROMBONE = [ ~MarkerB ~MarkerEND ~MarkerE PAUSE*8 ...
	Note('+0') C:N8 -B:N8 C:N2' bar ...
	R:N4 -A:N8 -B:N8 C:N8 D:N8 C:N8 -B:N8 bar ...
	C:N8 -B:N8 C:N2' bar ...
	~C:N2' R:N4 bar ...
	D:N8 C:N8 D:N2' bar ...
	R:N4 -B:N8 C:N8 D:N8 E:N8 F:N8 G:N8 bar ...
	Es:N8 F:N8 Es:N2' bar ...
	~Es:N2' R:N4 bar ...
	MarkerF ];

%% BASS

RIFF = [ ...
	F:N2 F:N4 R:N4 bar ...
	F:N2 F:N4 R:N4 bar ...
	+D:N2 +D:N4 R:N4 bar ...
	+D:N2 +D:N4 R:N4 bar ...
	E:N2 E:N4 R:N4 bar ...
	E:N2 E:N4 R:N4 bar ...
	+C:N2 +C:N4 R:N4 bar ...
	+C:N2 +C:N4 R:N4 bar ...
	];

BASS = [ MarkerIntro Note( '-' ) ...
	R:N bar R:N bar R:N bar ...
	MarkerA RIFF ...
	MarkerB RIFF MarkerEND RIFF ...
	MarkerC RIFF RIFF ...
	MarkerD RIFF RIFF ...
	MarkerE RIFF RIFF ...
	MarkerF RIFF ];

%% CLAP

c1 = V:N8; c2 = V:'>':N8;
CLAP = [ [ c2 c1 c1 c2 c1 c1 c2 c1 ] / [ c2 c1 c1 c1 c2 c1 c1 c1 ] bar ];

RIFF = CLAP*8;

CLAPS = [ ...
	MarkerIntro R:N bar R:N bar CLAP ...
	MarkerA RIFF ...
	MarkerB RIFF MarkerEND RIFF ...
	MarkerC RIFF RIFF ...
	MarkerD RIFF RIFF ...
	MarkerE RIFF RIFF ...
	MarkerF RIFF ];

%% Cacofonix

CODA = Note( 'Decresc', N*8, '0' );

cacofonix( 'GerudoValley.mid', 'Tempo', 240, [ MAIN MarkerB|MAIN|MarkerEND ], ...
	'Nylon String Guitar', [ DynMF GUITAR2 CODA MarkerB|GUITAR2|MarkerEND ], ...
	'Nylon String Guitar', [ DynF GUITAR1 CODA MarkerB|GUITAR1|MarkerEND ], ...
	'Acoustic Bass', [ DynMF BASS CODA MarkerB|BASS|MarkerEND ], ...
	'Trumpet', [ DynF TRUMPET CODA MarkerB|TRUMPET|MarkerEND ], ...
	'Trombone', [ DynMF TROMBONE CODA MarkerB|TROMBONE|MarkerEND ], ...
	'Castanets', [ DynMP CLAPS CODA MarkerB|CLAPS|MarkerEND ] );
