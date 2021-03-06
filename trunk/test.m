
% DYNAMICS
%
% NoteInit
% sheet = [ Note([4 4]) Note('+') DynFF ...
% 	Fs:'>':N2 ...
% 	DynMP Note('cresc', N2, 'FF' ) ...
% 	-B:N8 Cs:N8 D:N8 E:N8 bar ...
% 	Fs:'>':N4' D:N8 Fs:'>':N4' D:N8 bar ...
% 	Fs:'>':N4' DynMF ...
% 	Note('dynamics*', 'FF' ) ...
% 	-B:N8 D:N8 -B:N8 -G:N8 D:N8 bar ...
% 	Note('decresc*', N, '0' ) -B:N bar ];
% 
% cacofonix( 'SwanLake', 'Tempo', 80, 'Clarinet', sheet );

% % TEMPO
% 
% NoteInit
% 
% sheet = [ Note('-') DynF Note('Tempo', 80) Note([2 4]) ...
% 	~[ +G:N16 B:N16 D:N16 B:N16 ] ...
% 	~[ +G:N16 B:N16 +G:N16 B:N16 ] bar ...
% 	~[ +G:N16 B:N16 D:N16 B:N16 ] ...
% 	~[ +G:N16 B:N16 +G:N16 B:N16 ] bar ...
% 	~[ +G:N16 A:N16 D:N16 A:N16 ] ...
% 	~[ +G:N16 A:N16 +G:N16 A:N16 ] bar ...
% 	~[ +G:N16 A:N16 D:N16 A:N16 ] ...
% 	~[ +G:N16 A:N16 +G:N16 A:N16 ] bar ...
% 	~[ +Fs:N16 +C:N16 D:N16 +C:N16 ] ...
% 	Note( 'rall', N2', 60 ) Note( 'cresc', N2', 'FF' ) ...
% 	~[ +Fs:N16 +C:N16 +Fs:N16 +C:N16 ] bar ...
% 	~[ +Fs:N16 +C:N16 D:N16 +C:N16 ] ...
% 	~[ +Fs:N16 +C:N16 +Fs:N16 +C:N16 ] bar ...
% 	Note( 'fermata', N2, N2') -G+B++G:N2 ];
% 
% cacofonix( 'CelloSuite', 'Cello', sheet );


% V1 = V-1; V2 = V-2; V3 = V-3;
% RIFF = [ [ ~[ +V1 V2 -V3 V2 ] ~[ +V1 V2 +V1 V2 ] ~[ +V1 V2 -V3 V2 ] ~[ +V1 V2 +V1 V2 ] ].*N16 bar ];
% 
% sheet = [ Note('-') DynF Note('Tempo', 96) ...
% 	G*CM*RIFF ...
% 	G*CM*sus2*RIFF ...
% 	[ Fs +C +D ]*RIFF ...
% 	-G+B++G:N ];
% 
% cacofonix( 'CelloSuite', 'Cello', sheet );

% NoteInit
% 
% sheet = [ Note('-') Note('Tempo', 80) ...
% 	[ +G B D B +G B +G B +G B D B +G B +G B bar ...
% 	+G A D A +G A +G A +G A D A +G A +G A bar ...
% 	+Fs +C D +C ...
% 	Note( 'rall', N2', 60 ) ...
% 	+Fs +C +Fs +C +Fs +C D +C +Fs +C +Fs +C ].*N16 bar ...
% 	Note( 'fermata', N, N') -G+B++G:N bar ];
% 
% cacofonix( 'CelloSuite', 'Cello', sheet );


% NoteInit
% 
% SusOn = Note( 'Sustain', 'on' );
% SusOff = Note( 'Sustain', 'off' );
% 
% [ F, Fs ] = deal( Fs, F );
% [ C, Cs ] = deal( Cs, C );
% [ G, Gs ] = deal( Gs, G );
% 
% sheet = [ Note([2 4]) ...
% 	SusOn C:N4' ~F:N8 bar ...
% 	SusOn A:N4' ~F:N8 bar ...
% 	SusOn Es:N4' ~F:N16 G:N16 bar ...
% 	SusOn F:N2 SusOff bar ...
% 	] / [ Note('--') ...
% 	F:N8 ~A++C++A:'$.':N8 C:'.':N8 +C++A:'.':N8 bar ...
% 	F:N8 ~A++C++A:'$.':N8 C:'.':N8 +C++A:'.':N8 bar ...
% 	F:N8 ~B++D++G:'$.':N8 -B:'.':N8 +D++G:'.':N8 bar ...
% 	F:N8 ~A++C++A:'$.':N8 C:'.':N8 +C++A:'.':N8 bar ];
% 
% cacofonix( 'HungarianDanceN5', 'Tempo', 100, sheet );

% NoteInit
% N32 = Note(1/8);
% 
% delay = N8; val = { 'b', '#' };
% tremolo = Note( 'pitch', val{1}, delay);
% for t = 1:20
% 	delay = delay+N32;
% 	tremolo = [ tremolo ...
% 		Note( 'pitch', 'quad', val{1+mod(t,2)}, delay) ];
% end
% 
% pitch = @(varargin) Note('pitch',varargin{:});
% 
% sheet = [ ...
% 	Note('fermata', N2, N2') tremolo -F:N2' pitch('0') ...
% 		-F:N4 pitch('quad',repmat('#',1,29)) pitch('0') bar ...
% 	+Bf:'>':N2 ~[ +Af:Note(1/12) +Bf:Note(1/12) +Af:'.':Note(1/6) ] ...
% 		+Gf:'.':N12 +Af:'.':N12 +Gf:'.':N12 +Af:'.':N12 +Gf:'.':N12 bar ...
% 	+F:'-':N8 +Ef:'-':N8 +D:'-':N8 +Df:'-':N4 ...
% 		+Ef:'-':N8 +E:'-':N8 +F:'-':N8 bar ...
% 	Note('cresc',B,'f') ~+F:N8 +D:N8 ~[Bf:N32 +C:N32 Bf:N32 A:N32] ...
% 		Note('cresc',B,'mf') Af:'>':[N8 N8] Gf:N8 F:N8 F:'>':N8 bar ...
% 	~F:N bar ];
% 
% cacofonix( 'RhapsodyInBlue', 'Tempo', 80, 'Clarinet', sheet );


% NoteInit
% 
% TROMBONE = [ [ R:N bar ].*2 ...
% 	-Bf:N2' ~-Bf:N8 -G:'>':N8 bar ...
% 	R:N bar ...
% 	-Bf:N bar ...
% 	-G+G:'>':N8 Ds:N8 R:N4 R:N2 bar ];
% 
% BASS = [ Note('--') 6.*[ C C D ~C Ds ~C F ~E bar ].*N8 ];
% 
% cacofonix( 'PeterGunn', 'Tempo', 120, ...
% 	'Trombone', TROMBONE, ...
% 	'Acoustic Bass', BASS );

% NoteInit
% 
% N6 = Note(2/3);
% 
% MELODY = [ ...
% 	A:N2 ~G:N2 bar ...
% 	A:N2 ~G:N4 ~[ C:N8 E:N8 bar ...
% 	F:N4' A:N8 +C:N2 ] bar ...
% 	R:N8 ~[ (+D:N8)*3 +C:N2 ] bar ...
% 	R:N8 ~[ (Bf:N8)*3 A:N2 ] bar ...
% 	R:N8 ~[ (G:N8)*3 F.*[N4 ~N12 N12 N12] bar ...
% 	[ -Af+Df:N2 -Af+Df:N2 ] / ( F.*[ N4 ~N12 N12 N12 N2 ] ) ] bar ...
% 	[ -Bf+C:N ] / ~[ R:N4 F:N8 F:N8 E:N6 F:N6 G:N6 ] bar ...
% 	A:N bar ];
% 	
% % RIFF = [ F-1 F-2 F-3 +F-1 F-3 F-2 ].*N12;
% % RIFF2 = [ -F-4 F-2 F-3 +F-1 F-3 F-2 ].*N12;
% % BASS = [ ...
% % 	F*CM*RIFF F*CM*RIFF bar ...
% % 	F*CM*RIFF F*CM*RIFF bar ...
% % 	F*CM*RIFF A*Cm*RIFF bar ...
% % 	Bf*CM*RIFF A*Cm*RIFF bar ...
% % 	G*Cm7 
% cacofonix( 'test', MELODY );

% NoteInit
% 
% M44 = Note([4 4]);
% M24 = Note([2 4]);
% 
% MELODY = [ Note('-') M44 ...
% 	R:N4 +E:N4 +D:N8 +C:N8 B:N4 bar ...
% 	B:N4 +C:N8 B:N4 A:N8 G:N8 A:N8 bar ...
% 	B:N4 +C:N8 B:N4 A:N8 G:N8 A:N8 bar ...
% 	M24 B:N4 +C:N4 bar ...
% 	M44 B:N bar ];
% 
% V0 = V-0; RIFF = [ V0:N4 V0:N8 V0:N4 (V0:N8)*3 bar ];
% GUITAR = [ DynMP ...
% 	G*CM*RIFF ...
% 	C*CM*RIFF ...
% 	C*CM*RIFF ...
% 	D*CM*[ V0:N4 V0:N8 V0:N8 bar ] ...
% 	E*CM*RIFF ];
% 
% cacofonix( 'HeyYa', 'Tempo', 160, ...
% 	'Oboe', MELODY, ...
% 	'Acoustic Bass', -GUITAR );

% NoteInit
% 
% T = Note(1/6).*3;
% sheet = [ Note([3 4]) V.*[ ...
% 	R:'>':N8 T R:'>':N8 T R:'>':N8 N8 bar ...
% 	R:'>':N8 T R:'>':N8 T T T bar ] ];
% 
% cacofonix( 'Bolero', 'Tempo', 72, ...
% 	'Acoustic Snare', 179.*sheet );

% NoteInit
% 
% SYNTH = [ Note([4 4]) ...
% 	[ -A+Cs+Fs R R -B+Ds+Gs ].*N8 R:N2 bar ...
% 	[ Cs+E+A R R -B+Ds+Gs ].*N8 R:N2 bar ];
% 
% BASS = [ Note('--') ...
% 	[ Fs:'>':R Cs E Fs:'>':R E Cs -B Cs ].*N8 bar ].*2;
% 
% cacofonix( 'BillieJean', 'Tempo', 115, ...
% 	'Electric Grand Piano', SYNTH*2, ...
% 	'Acoustic Bass', BASS*2 );

% NoteInit
% 
% VOICE = [ Note('-') C:N8 E:N8 bar ...
% 	F:N4' A:N8 +C:N2 bar ...
% 	R:N8 (+D:N8)*3 +C:N2 bar ...
% 	R:N8 (Bf:N8)*3 A:N2 bar ...
% 	R:N8 (G:N8)*3 F:N2 bar ];
% 
% RIFF = [ V-1 V-2 V-3 +V-1 +V-4 V-6 V-5 V-4 bar ].*N8;
% GUITAR = [ Note('-') R:N4 bar ...
% 	[ F*CM  A*Cm ]*RIFF ...
% 	[ Bf*CM A*Cm ]*RIFF ...
% 	[ G*Cm  F*CM ]*RIFF ...
% 	[ A*CM  D*Cm ]*RIFF ];
% 
% VIOLIN = [ DynPP R:N4 bar ...
% 	F*CM:N2 A*Cm:N2 bar ...
% 	Bf*CM:N2 A*Cm:N2 bar ...
% 	G*Cm:N2 F*CM:N2 bar ...
% 	A*CM:N2 D*Cm:N2 bar ];
% 
% cacofonix( 'WhatAWonderfulWorld', 'Tempo', 80, ...
% 	'Bassoon', VOICE, ...
% 	'Nylon-String Guitar', GUITAR, ...
% 	'Slow String Ensemble', VIOLIN );

NoteInit

NoteInit

MVerse = Note( 'Marker', 'Verse' );
MChorus = Note( 'Marker', 'Chorus' );

P = [ R:N bar ];
MAIN = [ Note([4 4]) Note( 'Tempo', 80 ) ...
	P*2 MVerse P*4 MChorus P*2 ];

VOICE = [ Note('+') ~MVerse ...
	D:N16 E:N16 E:N16 D:N16 E:N8 E:N16 D:N16 ...
		E:N8 E:N8 D:N16 E:N16 E:N16 D:N16 bar ...
	E:N8 E:N16 D:N16 E:N16 D:N16 E:N8 ...
		A:N8 G:N8 G:N16 D:N16 E:N8 bar ...
	E:N8 E:N16 D:N16 E:N8 R:N16 -A:N16 ...
		E:N8 E:N8 E:N8 R:N8 bar ...
	D:N16 D:N16 D:N8 D:N8 -A:N16 ~-B:N16 ...
		-A:N16 -G:N16 -E:N16 -E:N8' -B:N16 D:N16 bar ...
	MChorus G:N4 Fs:N4 E:N4 D:N4 bar ...
	E:N8 E:N8 R:N2' bar ];

BASS = [ V:N8 V:N8 R:N4 V:N8 V:N8 R:N4 bar ]*8;
CLAP = [ R:N8 R:N8 V:'>':N4 R:N8 R:N8 V:'>':N4 bar ]*8;

cacofonix( 'WeWillRockYou', MAIN, ...
	'Soprano Sax', VOICE, ...
	'Acoustic Bass Drum', BASS, ...
	'Hand Clap', CLAP );
