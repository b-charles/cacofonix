
%
% Mystery Train
%
% Compositor: Nobuo Uematsu
% From: Final Fantasy VI: Grand Finale
%

%#ok<*BDSCA>
clc

NoteInit_fr

MARK_INTRO = Note( 'Marker', 'INTRO' ); % 1
MARK_A = Note( 'Marker', 'A' ); % 14
MARK_B = Note( 'Marker', 'B' ); % 30
MARK_C = Note( 'Marker', 'C' ); % 46
MARK_D = Note( 'Marker', 'D' ); % 54
MARK_E = Note( 'Marker', 'E' ); % 72
MARK_F = Note( 'Marker', 'F' ); % 80
MARK_G = Note( 'Marker', 'G' ); % 84
MARK_H = Note( 'Marker', 'H' ); % 88
MARK_I = Note( 'Marker', 'I' ); % 92
MARK_J = Note( 'Marker', 'J' ); % 108
MARK_K = Note( 'Marker', 'K' ); % 117
MARK_L = Note( 'Marker', 'L' ); % 118
MARK_M = Note( 'Marker', 'M' ); % 127
MARK_N = Note( 'Marker', 'N' ); % 133
MARK_O = Note( 'Marker', 'O' ); % 149

%% MAIN

P = [ B' bar ]; P2 = [ R' bar ];

MAIN = [ ...
	MARK_INTRO Note([3 4]) Note( 'Tempo', 140 ) ...
	P*6 Note( 'rall.', B'*2, 70 ) P*2 Note( 'fermata', B', B'*2 ) P ...
	Note( 'Tempo', 225 ) P*4 ...
	MARK_A P*16 ...
	MARK_B P*16 ...
	MARK_C P*8 ...
	MARK_D P*16 Note([3 2]) P2*2 ...
	MARK_E P2*8 ...
	MARK_F Note([3 4]) P*4 ...
	MARK_G P*3 Note( 'fermata', B', B'*2 ) P ...
	MARK_H Note('Tempo', 156 ) P*4 ...
	MARK_I P*16 ...
	MARK_J P*9 ...
	MARK_K Note('rall.', B', 78 ) P Note('Tempo',156) ...
	MARK_L Note('rall.', B', 78 ) P Note('Tempo',156) P*8 ...
	MARK_M P*6 ...
	MARK_N P*16 ...
	MARK_O P*4 Note('rall.', B'*3, 78 ) P*3 Note( 'fermata', B', B'*2 ) P ...
	];

%% VIOLIN

NoteInit_fr

siBB = Note( 'siBB' );
T = Note( 1/8 );
TN = Note( 2/3 );

[faBe, fa] = deal( fa, faD );

VIOLIN = [ ...
	MARK_INTRO DynMF ~[ -sol+mi:C si:[C B] bar ...
	+re:B +do:N bar ...
	[ mi:N S:N S:N ] / (si:B') ] bar ...
	S:N (siB:B) / ~[ +la:N +sol:N ] bar ...
	~[ mi+la:D' la++mi:[T C] reD+la:D' la++mi:[T C] mi+la:D' la++mi:[T C] bar ...
	mi+la:C la++sol:[C N] +fa:N ] bar ...
	-sol+mi:C si++mi:[C B] bar ...
	-la+mi:C la++mi:[C B] bar ...
	mi+si:C si++mi:[C B] bar ...
	~si++mi:C S:C S:N S:N bar ...
	[ S:B' bar ]*3 ...
	MARK_A DynF ~[ mi:B' bar ...
	sol:B fa:N bar ...
	mi:B' bar ...
	re:B do:N bar ...
	mi:B' bar ...
	sol:B fa:N bar ...
	mi:B' ] bar ...
	S:B' bar ...
	~[ mi:B fa:N bar ...
	sol:B la:N bar ...
	siB:B siB:'|':N bar ...
	siB:'|':B siB:'|':N bar ...
	siB:'|':B siB:'|':N bar ...
	siB:'|':N la:N sol:N bar ...
	mi:B' ] bar ...
	S:B' bar ...
	MARK_B ...
	~[ la:B' bar ...
	+do:B si:N bar ...
	la:B' bar ...
	sol:B faBe:N bar ...
	la:B' bar ...
	+do:B si:N bar ...
	la:B' ] bar ...
	S:B' bar ...
	~[ la:B si:N bar ...
	+do:B +re:N bar ...
	+miB:B +miB:'|':N bar ...
	+miB:'|':B +miB:'|':N bar ...
	+miB:'|':B +miB:'|':N bar ...
	+miB:'|':N +re:N +do:N bar ...
	la:B' ] bar ...
	S:B' bar ...
	MARK_C ...
	~[ si:N la:N si:N bar ...
	+re:B +do:N bar ...
	si:B' bar ...
	si:B' ] bar ...
	~[ si:N la:N si:N bar ...
	+re:B +do:N bar ...
	si:B' bar ...
	si:B' ] bar ...
	MARK_D [ S:B' bar ]*3 ...
	S:N S:N DynMF ~[ +re:N bar ...
	si:B' bar ...
	si:N +re:N +do:N bar ...
	si:D +do:D si:C sol:N mi:N bar ...
	sol:N si:N sol:N bar ...
	siB:B' bar ...
	siB:B' ] bar ...
	S:B' bar ...
	S:N S:N ~[ +faBe:N bar ...
	+re:B' bar ...
	+re:N +faBe:N +miB:N bar ...
	+re:D +miB:D +re:C si:N sol:N bar ...
	si:N +faBe:N +re:N bar ...
	+miB:R' bar ...
	+miB:R' ] bar ...
	MARK_E ~[ miB:'>':TN siBB:TN +miB:TN ] ~[ solB:'>':TN siBB:TN +solB:TN ] ~[ sol:'>':TN siBB:TN +faBe:TN ] bar ...
	+miB:R' bar ...
	~[ miB:'>':TN siBB:TN +miB:TN ] ~[ solB:'>':TN siBB:TN +solB:TN ] ~[ sol:'>':TN siBB:TN +faBe:TN ] bar ...
	+miB:R' bar ...
	~[ +miB:'>':TN +siBB:TN +miB:TN ] ~[ +solB:'>':TN ++miB:TN +solB:TN ] ~[ +faBe:'>':TN ++doB:TN +faBe:TN ] bar ...
	+miB:R' bar ...
	~[ +miB:'>':TN +siBB:TN +miB:TN ] ~[ +solB:'>':TN ++miB:TN +solB:TN ] ~[ +faBe:'>':TN ++doB:TN +faBe:TN ] bar ...
	+miB:R' bar ...
	MARK_F [ S:B' bar ]*4 ...
	MARK_G S:B' bar ...
	S:B' bar ...
	S:N S:C DynFF ++mi:'.':C S:N bar ...
	S:B' bar ...
	MARK_H ...
	];

NoteInit_fr

[siB, si] = deal(si, siB);
[miB, mi] = deal(mi, miB);
[laB, la] = deal(la, laB);

VIOLIN2 = [ ...
	MARK_H [ S:B' bar ]*3 ...
	S:N S:N DynMP +re:N bar ...
	MARK_I Note('') ~[ ~siB:B' bar ...
	siB:N +re:N +do:N bar ...
	siB:D +do:D siB:C sol:N mi:N bar ...
	sol:N siB:N S:C sol:C bar ...
	si:B' bar ...
	si:B' bar ...
	si:B' ] bar ...
	S:N S:N ~[ +fa:N bar ...
	Note('cresc',B'*8,'mf') +re:B' bar ...
	+re:N +fa:N +mi:N bar ...
	+re:D +mi:D +re:C siB:N sol:N bar ...
	siB:N +fa:N +mi:N bar ...
	+sol:B' bar ...
	+sol:B' bar ...
	+sol:B' ] bar ...
	Note('+') S:N S:N DynMF ~[ si:N bar ...
	MARK_J la:B' bar ...
	[ la do la doB -si la ].*C bar ...
	sol:B' bar ...
	sol:C ] ~[ [ do sol fa do fa ].*C bar ...
	mi:B' bar ...
	mi:C ] ~[ [ -mi -siB mi re -la ].*C bar ...
	-sol:B' ] bar ...
	sol:B' bar ...
	+sol:B' bar ...
	MARK_K S:N S:N DynMP re:N bar ...
	MARK_L S:N S:N Note('') DynMP ~[ +miB:N bar ...
	siB:B' bar ...
	siB:N +re:N +do:N bar ...
	siB:D +do:D siB:C sol:N miB:N bar ...
	sol:N siB:N sol:N bar ...
	si:B' bar ...
	si:B' bar ...
	si:B' bar ...
	si:B ] Note('+') ~[ sol:N bar ...
	MARK_M re:B' bar ...
	re:N fa:N mi:N bar ...
	re:D mi:D re:C -si:N -sol:N bar ...
	-si:N fa:N re:N bar ...
	mi:B' bar ...
	mi:B' ] bar ...
	MARK_N DynF ~[ +miB:B laB:N bar ...
	laB:N siB:N +do:N bar ...
	[ +miB +re +fa ].*N bar ...
	+fa:B +miB:N ] bar ...
	~[ +re:B sol:N bar ...
	[ sol laB siB ].*N bar ...
	[ +re siB +re ].*N bar ...
	+re:N +do:B ] bar ...
	~[ siB:B' bar ...
	[ siB laB sol ].*N bar ...
	+do:B' bar ...
	+do:B' ] bar ...
	Note('++') ~[ doD:B' bar ...
	[ doD -siB -laB ].*N bar ...
	Note('decresc',B'*2,'p') re:B' bar ...
	re:B' ] bar ...
	MARK_O DynP ~[ miB:B' bar ...
	sol:B fa:N bar ...
	miB:B' bar ...
	re:B do:N ] bar ...
	DynPP Note('+++') ~[ miB:B' bar ...
	sol:B fa:N bar ...
	miB:B' bar ...
	miB:B' ] bar ...
	];
	

%% PIANO

NoteInit_fr

siBB = Note( 'siBB' );
T = Note( 1/8 );
TN = Note( 2/3 );

[faBe, fa] = deal( fa, faD );

PIANO_MD = [ ...
	MARK_INTRO [ S:B' bar ]*9 ...
	DynF [ S:C -sol+-si+fa:'.':C S:N -sol+-si+mi:'.':C S:C bar ...
	-siB+mi+la:N' -siB+mi+sol:N S:C bar ]*2 ...
	MARK_A [ S:C -sol+-si+fa:'.':C S:N -sol+-si+mi:'.':C S:C bar ...
	-siB+mi+la:N' -siB+mi+sol:N S:C bar ]*7 ...
	S:C -sol+-si+fa:'.':C S:N -sol+-si+mi:'.':C S:C bar ...
	-siB+reB+faBe:N' -siB+reB+faBe+sol:N' bar ...
	MARK_B [ S:C do+mi+si:'.':C S:N do+mi+la:'.':C S:C bar ...
	miB+la++re:N' miB+la++do:N S:C bar ]*8 ...
	MARK_C -si+miB+sol:N' -si+miB+sol:N' bar ...
	miB+faBe+la:N' miB+faBe+la:N' bar ...
	S:C -sol+-si+fa:'.':C S:N -sol+-si+mi:'.':C S:C bar ...
	S:C -sol+-si+fa:'.':C S:N -sol+-si+mi:'.':C S:C bar ...
	-siB+mi+sol:N' -siB+mi+sol:N S:C bar ...
	miB+faBe+la:N' miB+faBe+la:N' bar ...
	S:C -sol+-si+fa:'.':C S:N -sol+-si+mi:'.':C S:C bar ...
	S:C -sol+-si+fa:'.':C S:N -sol+-si+mi:'.':C S:C bar ...
	MARK_D DynMF [ S:C -miB+-la+re:'.':C S:C -miB+-la+-si:'.':C S:C -miB+-la+re:'.':C bar ...
	S:C -fa+do+faBe:'.':C S:C -fa+do+re:'.':C S:C -fa+do+faBe:'.':C bar ]*6 ...
	DynMP Note( 'Cresc', B'*4, 'mf' ) [ S:C reD+la++re:C ]*3 bar ...
	[ S:C re+laB++reB:C ]*3 bar ...
	[ S:C doD+sol++do:C ]*3 bar ...
	[ S:C do+solB++doB:C ]*3 bar ...
	[ S:C miB+solB+siB:'.':C ]*6 bar ...
	[ S:C miB+solB+siB:'.':C ]*6 bar ...
	MARK_E [ miB+solB+siBB:B faBe+siBB:B miB+solB+siBB:B bar ...
	[ S:C miB+solB+siB:'.':C ]*6 bar ]*4 ...
	MARK_F DynF [ S:C -sol+-si+fa:'.':C S:N -sol+-si+mi:'.':C S:C bar ...
	-siB+mi+la:N' -si+mi+sol:N S:C bar ]*2 ...
	MARK_G S:C -sol+-si+fa:'.':C S:N -sol+-si+mi:'.':C S:C bar ...
	-siB+reB+faBe:N' -siB+reB+faBe+sol:N' bar ...
	S:N S:C +mi++sol++si:'.':C S:N bar ...
	S:B' bar ...
	MARK_H ...
	];

PIANO_MG = [ ...
	MARK_INTRO [ S:B' bar ]*9 ...
	Note('--') [ mi:N S:C si:'.':C S:C +re:'.':C bar ...
	S:C siB:C do:C S:C fa:N bar ]*2 ...
	MARK_A [ mi:N S:C si:'.':C S:C +re:'.':C bar ...
	S:C siB:C do:C S:C fa:N bar ]*7 ...
	mi:N S:C si:'.':C S:N bar ...
	[ S +miB siB S +miB siB ].*C bar ...
	MARK_B [ la:N S:C +mi:'.':C S:C +sol:'.':C bar ...
	S:C +miB:C faBe:C S:C si:N bar ]*7 ...
	la:N S:C +mi:'.':C S:C +sol:'.':C bar ...
	S:C +miB:C faBe:C S:C S:N bar ...
	MARK_C do++do:N' do++do:N' bar ...
	faBe++faBe:N' faBe++faBe:N' bar ...
	mi:N S:C si:'.':C S:C +re:'.':C bar ...
	mi:N S:C si:'.':C S:C +re:'.':C bar ...
	do++do:N' do++do:N' bar ...
	faBe++faBe:N' faBe++faBe:N' bar ...
	mi:N S:C si:'.':C S:C +re:'.':C bar ...
	mi:N S:C si:'.':C S:C +re:'.':C bar ...
	MARK_D [ -do+do:'.':C S:C -laB+laB:'.':C S:C -do+do:'.':C S:C bar ...
	-miB+miB:'.':C S:C do:'.':C S:C -miB+miB:'.':C S:C bar ]*6 ...
	[ si +si si ].*N bar ...
	[ +siB siB +siB ].*N bar ...
	[ la +la la ].*N bar ...
	[ +laB laB +laB ].*N bar ...
	[ +miB:'.':C S:C siB:'.':C S:C ]*3 bar ...
	[ +miB:'.':C S:C siB:'.':C S:C ]*3 bar ...
	MARK_E [ doB++doB:B faBe++faBe:B doB++doB:B bar ...
	[ miB++miB:'.':C S:C siB:'.':C S:C ]*3 bar ]*4 ...
	MARK_F [ mi:N S:C si:'.':C S:C +re:'.':C bar ...
	S:C siB:C do:C S:C fa:N bar ]*2 ...
	MARK_G mi:N S:C si:'.':C S:C +re:'.':C bar ...
	[ S +miB siB S +miB siB ].*C bar ...
	S:N S:C mi+si++mi:'.':C S:N bar ...
	S:B' bar ...
	MARK_H ...
	];

NoteInit_fr

[siB, si] = deal(si, siB);
[miB, mi] = deal(mi, miB);
[laB, la] = deal(la, laB);

PIANO2_MD = [ ...
	MARK_H DynP Note('-') [ S:N mi+sol+laB+si++re:'$':N mi+sol++do:N bar ...
	S:N mi+faD+siB:N mi+faD+laB:N bar ]*2 ...
	MARK_I Note('-') [ S:N mi+sol+laB+si++re:'$':N mi+sol++do:N bar ...
	S:N mi+faD+siB:N mi+faD+laB:N bar ]*4 ...
	Note('cresc',B'*8,'mf') [ S:N mi+sol+laB+si++re:'$':N mi+sol++do:N bar ...
	S:N mi+faD+siB:N mi+faD+laB:N bar ]*2 ...
	[ S:N fa+siB++sol:'$':N fa++fa:N bar ...
	S:N fa+siB++mi:N fa+siB++fa:N bar ]*2 ...
	MARK_J Note('') S:N DynMF fa+la++do:N fa+la++reB:N bar ...
	fa+la++re:N fa:N la++re:N bar ...
	S:N mi+sol+si++mi:N mi+sol+siB++mi:N bar ...
	mi+sol++re:N mi:N mi+sol:N bar ...
	S:N fa+la+siB++mi:'$':N fa+la+siB++re:N bar ...
	S:N fa+la+siB++mi:'$':N fa+la+siB++re:N bar ...
	~[ [ S mi do laB mi do ].*C bar ...
	[ siB mi do +do mi do].*C ] bar ...
	Note('Decresc',B'*2,'p') ~[ +re la fa +do la fa ].*C bar ...
	MARK_K ~[ +do sol fa siB sol fa ].*C bar ...
	MARK_L ~[ +do sol fa siB sol fa ].*C bar ...
	DynP ~( [ [re+faD do+miB].*C*3 bar ]*4 ) ...
	~( [ [mi+sol reB+fa].*C*3 bar ]*4 ) ...
	MARK_M ~( [ [sol+si fa+la].*C*3 bar ]*4 ) ...
	~( [ [solB+si fa+la].*C*3 bar ]*2 ) ...
	MARK_N DynF [ S do+fa+laB do+fa+siB ].*N bar ...
	[ fa+laB++do fa+laB++re fa+la++miB].*N bar ...
	[ S la++doB++miB la++doB++fa ].*N bar ...
	[ la++doB++sol la++doB++fa la++doB++miB ].*N bar ...
	[ S do+mi+sol do+mi+laB ].*N bar ...
	[ mi+sol+siB mi+sol++do mi+sol++re ].*N bar ...
	[ S mi+laB+siB mi+laB++do ].*N bar ...
	[ mi+laB++re mi+laB+siB mi+laB++do ].*N bar ...
	[ S -siB+miB+sol -siB+miB+laB ].*N bar ...
	[ -siB+miB+siB -siB+miB+laB -siB+miB+sol ].*N bar ...
	[ do+re+sol do+re+fa do+re+miB ].*N bar ...
	[ do+re+sol do+re+la do+re+sol ].*N bar ...
	[ S doD+faD+laB doD+faD+siB ].*N bar ...
	[ doD+faD+laB++doD doD+faD+siB doD+faD+laB ].*N bar ...
	Note('decresc',B'*2,'p') [ re+miB+laB re+miB+sol re+miB+faD ].*N bar ...
	[ re+miB+laB re+miB+si re+miB+laB ].*N bar ...
	MARK_O DynP Note('+') ~( [ fa+la++do++miB:'$':B' bar ]*4 ) ...
	DynPP ~( [ fa+siB++miB:'$':B' bar ]*2 ) ...
	miB:B' bar ...
	~miB:B' bar ...
	];

PIANO2_MG = [ ...
	MARK_H Note('--') [ do++do:B' bar ...
	-sol+sol:B' bar ]*2 ...
	MARK_I [ do++do:B' bar ...
	-sol+sol:B' bar ]*6 ...
	[ reB++reB:B' bar ...
	-la+la:B' bar ]*2 ...
	MARK_J fa++fa:B' bar ...
	si++si:B' bar ...
	mi++mi:B' bar ...
	laB++laB:B' bar ...
	sol++sol:B' bar ...
	sol++sol:B' bar ...
	do:B' bar ...
	[ +do +mi +si ].*N bar ...
	[ re la +fa ].*N bar ...
	MARK_K [ sol +re +sol ].*N bar ...
	MARK_L [ sol +re +sol ].*N bar ...
	~( [ do++do:B' bar ]*4 ) ...
	~( [ reB++reB:B' bar ]*4 ) ...
	~( [ -la+la:B' bar ]*4 ) ...
	~( [ mi++mi:B' bar ]*2 ) ...
	MARK_N re++re:B' bar ...
	+fa++laB++do:'$':B' bar ...
	reB++reB:B' bar ...
	+la+++doB+++sol:'$':B' bar ...
	do++do:B' bar ...
	+mi++sol+++do:'$':B' bar ...
	fa++fa:B' bar ...
	+fa++laB+++do:'$':B' bar ...
	doD++doD:B' bar ...
	do++do:B' bar ...
	-si+si:B' bar ...
	~-si+si:B' bar ...
	reD++reD:B' bar ...
	re++re:B' bar ...
	do++do:B' bar ...
	~do++do:B' bar ...
	Note('') ~( [ fa+la++do++miB:'$':B' bar ]*4 ) ...
	DynPP ~( [ reB+fa+la+siB:'$':B' bar ]*2 ) ...
	S:B' bar ...
	S:B' bar ...
	];

%% CACOFONIX

cacofonix( 'MysteryTrain', 'Velocity', linspace( 25, 100, 8 ), ...
		[ MAIN|MARK_G MARK_A|MAIN|MARK_D MARK_G|MAIN|MARK_H ...
		MARK_H|MAIN|MARK_L MARK_I|MAIN|MARK_K MARK_L|MAIN ], ...
	'Violin', ...
		[ VIOLIN|MARK_G MARK_A|VIOLIN|MARK_D MARK_G|VIOLIN|MARK_H ...
		MARK_H|VIOLIN2|MARK_L MARK_I|VIOLIN2|MARK_K MARK_L|VIOLIN2 ], ...
	'Piano', ...
		[ PIANO_MD|MARK_G MARK_A|PIANO_MD|MARK_D MARK_G|PIANO_MD|MARK_H ...
		MARK_H|PIANO2_MD|MARK_L MARK_I|PIANO2_MD|MARK_K MARK_L|PIANO2_MD ] / ...
		[ PIANO_MG|MARK_G MARK_A|PIANO_MG|MARK_D MARK_G|PIANO_MG|MARK_H ...
		MARK_H|PIANO2_MG|MARK_L MARK_I|PIANO2_MG|MARK_K MARK_L|PIANO2_MG ] );
