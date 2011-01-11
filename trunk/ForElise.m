%#ok<*BDSCA>
clc

clear classes

NoteInit_fr

Note.setNbCharByQuater( 48 );

T = Note( 1/8 ); % triple-croche
Q = Note( 1/16 ); % quadruple-croche

TD = Note( 1/6 ); % triolet de double

Cresc1 = Note( 'crescendo', C', 'mf' );
Cresc2 = Note( 'crescendo', N', 'mf' );
Decresc = Note( 'decrescendo', C', 'pp' );

PedON = Note( 'sustain', 'on' );
PedOFF = Note( 'sustain', 'off' );

tempo = 70;

MARK_A = Note( 'marker', 'A' );
MARK_B = Note( 'marker', 'B' );
MARK_C = Note( 'marker', 'C' );
MARK_D = Note( 'marker', 'D' );
MARK_E = Note( 'marker', 'E' );
MARK_F = Note( 'marker', 'F' );

%% MAIN DROITE

MDAna = [ Note( [3 8] ) Note( '+' ) DynPP mi:D ~reD:D bar ];
MDA = [ MARK_A DynPP ...
	~[ [ Cresc1 ~mi reD mi Decresc -si re do ].*D bar ...
	-la:C ] S:D ~[ [ -do -mi -la ].*D bar ...
	-si:C ] S:D ~[ [ -mi -solD -si ].*D bar ...
	do:C ]  S:D ~[ [ -mi mi reD ].*D bar ...
	[ Cresc1 mi reD mi Decresc -si re do ] .* D bar ...
	-la:C ] S:D ~[ [ -do -mi -la ].*D bar ...
	-si:C ] S:D ~[ -mi do -si ].*D bar ];
MDA1 = [ ~-la:N  ~[ mi:D reD:D ] bar ];
MDA2 = [ ~-la:C  S:D Cresc1 ~[ -si:D do:D re:D ] bar ];

MDB = [ MARK_B DynMF ...
	~mi:C' ~[ [ -sol fa mi ].*D bar ...
	re:C' ] ~[ [ -fa mi re ].*D bar ...
	do:C' ] ~[ [ -mi re do ].*D bar ...
	-si:C ] S:D -mi:D ~mi:D S:D bar ...
	S:D mi:D ~+mi:D Note( 'rall', N', tempo-15 ) S:[D D] reD:D bar ...
	~mi:D S:[D D] Decresc Note( 'tempo', tempo ) ~[ reD:D mi:D reD:D bar ...
	[ mi reD mi -si re do ].*D bar ...
	-la:C ] S:D ~[ [ -do -mi -la ].*D bar ...
	-si:C ] S:D ~[ [ -mi -solD -si ].*D bar ...
	do:C ] S:D ~[ [ Cresc2 -mi mi reD ].*D bar ...
	[ mi reD mi Decresc -si re do ].*D bar ...
	-la:C ] S:D ~[ [ -do -mi -la ].*D bar ...
	-si:C ] S:D ~[ -mi do -si ].*D bar ...
	];
MDB1 = [ ~-la:C S:D Cresc1 ~[ -si do re ].*D bar ];
MDB2 = [ ~-la:C S:D Cresc1 [ -mi+do -fa+do -mi+-sol+do ] .* (S:'.':D) bar ];

MDC = [ MARK_C DynMF ...
	~[ -fa:D -la:D do:C fa:D' mi:T bar ...
	mi:C re:C ] ~[ siB:D' la:T bar ...
	[ la sol fa mi re do ] .* D bar ...
	-siB:C -la:C ] ~[ -siB:D [ -la -sol -la -siB ].*Q bar ...
	do:N ] ~[ re:D reD:D bar ...
	mi:C' ] ~[ mi:D fa:D -la:D ] bar ...
	~[ do:N re:D' -si:T ] bar ...
	DynP [ ~do sol ~[ -sol sol -la sol -si sol do sol re sol ] ].*T bar ...
	[ ~mi ~[ sol +do si la sol fa mi re sol fa re ] ].*T bar ...
	[ ~do sol ~[ -sol sol -la sol -si sol do sol re sol ] ].*T bar ...
	[ ~mi ~[ sol +do si la sol fa mi re sol fa re ] ].*T bar ...
	~[ mi fa mi reD mi -si mi reD mi -si mi reD ].*T bar ...
	~mi:C' ~[ -si mi reD ].*D bar ...
	~mi:C' -si:D ~mi:D S:D bar ...
	Note( 'rall', N', tempo-15 ) ...
	S:D reD:D ~mi:D S:[D D] DynPP reD:D bar ...
	];

MDD = [ MARK_D Note( '+' ) Note( 'tempo', tempo ) DynPP ...
	[ Cresc1 mi reD mi Decresc -si re do ].*~D bar ...
	~-la:C S:D ~[ -do -mi -la ].*D bar ...
	~-si:C S:D ~[ -mi -solD -si ].*D bar ...
	~do:C S:D ~[ Cresc2 -mi mi reD ].*D bar ...
	[ mi reD mi Decresc -si re do ].*~D bar ...
	~-la:C S:D ~[ -do -mi -la ].*D bar ...
	~-si:C S:D ~[ -mi do -si ].*D bar ...
	~-la:C' Cresc1 [ -si do re ].*D bar ...
	mi:C' ~[ -sol fa mi ].*D bar ...
	~re:C' ~[ -fa mi re ].*D bar ...
	~do:C' ~[ -mi re do ].*D bar ...
	~-si:C DynP S:D -mi:D ~mi:D S:D bar ...
	S:D mi:D ~+mi:D S:[D D] reD:D bar ...
	~mi:D S:D S:D ~[ DynPP reD mi reD ].*D bar ...
	[ Cresc1 mi reD mi Decresc -si re do ].*~D bar ...
	~-la:C S:D ~[ -do -mi -la ].*D bar ...
	~-si:C S:D ~[ -mi -solD -si ].*D bar ...
	~do:C S:D Cresc2 ~[ -mi mi reD ].*D bar ...
	[ mi reD mi Decresc -si re do ].*~D bar ...
	~-la:C S:D ~[ -do -mi -la ].*D bar ...
	~-si:C S:D ~[ -mi do -si ].*D bar ...
	];

MDE = [ MARK_E Note( '+' ) DynP ...
	~-la:C S:[C C] bar ...
	[ -mi -sol -siB doD ]:'>':N' bar ...
	~[ -fa -la re ]:'>':N doD+mi:D ~re+fa:D bar ...
	-solD+re+fa:'>':N -solD+re+fa:C bar ...
	~-la+do+mi:N' bar ...
	-fa+re:N ~[ -mi+do:D -re+-si:D bar ...
	-do+-faD+-la:N ] -do+-la:C bar ...
	~[ -do+-la:C -mi+do:C -re+-si:C bar ...
	-do+-la:N' ] DynP bar ...
	[ -mi -sol -siB doD ]:'>':N' bar ...
	~-fa+-la+re:N doD+mi:D ~re+fa:D bar ...
	re+fa:N re+fa:C bar ...
	re+fa:N' bar ...
	~[ -sol+miB:N -fa+re:D -miB+do:D bar ...
	-re+-fa+-siB:N ] -re+-fa+-la:C bar ...
	~-re+-fa+-solD:N -re+-fa+-solD:C bar ...
	DynP ~-do+-mi+-la:N S:C bar ...
	DynPP -re+-mi+-si:'.':C S:[C C] bar ...
	Note( 'crescendo', [ N' N' N ], 'mp' ) ...
	~[ --la -do -mi -la do mi re do -si ].*TD bar ...
	~[ -la do mi la +do +mi +re +do si ].*TD bar ...
	~[ la +do +mi +la ++do ++mi ++re ++do +si ].*TD bar ...
	~[ +siB +la +solD +sol +faD +fa +mi +reD +re ].*TD bar ...
	~[ +doD +do si siB la solD sol faD fa ].*TD bar ...
	DynPP  Note( 'rall', N', tempo-20 ) ~[ mi reD mi -si re do ].*D bar ...
	];

MDF = [ MARK_F Note( '+' ) Note( 'tempo', tempo ) DynPP ...
	~-la:C S:D ~[ -do -mi -la ].*D bar ...
	~-si:C S:D ~[ -mi -solD -si ].*D bar ...
	~do:C S:D ~[ [ -mi mi reD ].*D bar ...
	[ Cresc1 mi reD mi Decresc -si re do ].*D bar ...
	-la:C ] S:D ~[ -do -mi -la ].*D bar ...
	~-si:C S:D ~[ -mi do -si ].*D bar ...
	~-la:C S:D Cresc1 ~[ -si do re ].*D bar ...
	~mi:C' ~[ -sol fa mi ].*D bar ...
	~re:C' ~[ -fa mi re ].*D bar ...
	~do:C' ~[ -mi re do ].*D bar ...
	~-si:C DynP S:D -mi:D ~mi:D S:D bar ...
	S:D mi:D ~+mi:D S:[D D] reD:D bar ...
	~mi:D S:[D D] DynPP ~[ [ reD mi reD ].*D bar ...
	[ mi reD mi -si re do ].*D bar ...
	-la:C ] S:D ~[ -do -mi -la ].*D bar ...
	~-si:C S:D ~[ -mi -solD -si ].*D bar ...
	~do:C S:D Cresc1 ~[ [ -mi mi reD ].*D bar ...
	[ mi reD mi Decresc -si re do ].*~D bar ...
	-la:C ] S:D ~[ -do -mi -la ].*D bar ...
	Note( 'rall', N', tempo-20 ) ...
	~-si:C S:D ~[ -mi do -si ].*D bar ...
	-la:'-':N' bar ...
	];

%% MAIN GAUCHE

RIFF = [ PedON ~[ (V-1):D (V-2):D (V-3):D ] PedOFF S:[D C] bar ];

MGAna = [ Note( '-' ) DynPP S:C bar ];
MGA = [ MARK_A ...
	S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	[ -la mi la ] * RIFF ...
	S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	];
MGA1 = [ -la mi la ] * RIFF;
MGA2 = [ -la mi la ] * RIFF;

MGB = [ MARK_B DynMF ...
	[ -do sol +do ] * RIFF ...
	[ -sol sol si ] * RIFF ...
	[ -la mi la ] * RIFF ...
	PedON -mi:'.':D mi:D ~+mi:D S:[D D] +mi:D bar ...
	~++mi:D S:[D D] PedOFF ++reD:D ~++mi:D S:D bar ...
	S:D ++reD:D ~++mi:D S:D S:C bar ...
	DynPP S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	[ -la mi la ] * RIFF ...
	S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	];
MGB1 = [ -la mi la ] * RIFF;
MGB2 = [ PedON ~[ -la mi la ].*D PedOFF Cresc1 siB++do:'.':D ~la++do:'.':D ~sol++do:'.':D bar ];

MGC = [ MARK_C Note( '-' ) ...
	~[ fa la +do la +do la ].*D bar ...
	~[ fa siB +re siB +re siB ].*D bar ...
	~[ fa +mi fa+sol+siB +mi fa+sol+siB +mi ].*D bar ...
	~[ fa la +do la +do la ].*D bar ...
	~[ fa la +do la +do la ].*D bar ...
	~[ mi la +do la re++re fa ].*D bar ...
	~[ sol +mi sol +mi sol +fa ].*D bar ...
	DynP +do++mi:C S:D +fa++sol:'.':D +mi+sol:'.':D +re++fa++sol:'.':D bar ...
	+do++mi++sol:C ~[ fa+la:C sol+si:C bar ...
	+do:C ] S:D +fa++sol:'.':D +mi+sol:'.':D +re++fa++sol:'.':D bar ...
	+do++mi++sol:C fa+la:C ~sol+si:C bar ...
	~solD+si:C S:C S:C bar ...
	S:N' bar ...
	S:N S:D ++reD:D bar ...
	~++mi:D S:D S:D ++reD:D ~++mi:D DynPP S:D bar ];

MGD = [ MARK_D Note( '-' ) DynPP ...
	S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	[ -la mi la ] * RIFF ...
	S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	[ -la mi la ] * RIFF ...
	DynMF [ do sol +do ] * RIFF ...
	[ -sol sol si ] * RIFF ...
	[ -la mi la ] * RIFF ...
	DynP PedON -mi:'.':D mi:D ~+mi:D S:[D D] +mi:D bar ...
	~++mi:D S:[D D] PedOFF ++reD:D ~++mi:D S:D bar ...
	S:D ++reD:D ~++mi:D S:[D C] bar ...
	DynPP S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	[ -la mi la ] * RIFF ...
	S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	];

MGE = [ MARK_E Note( '--' ) DynP ...
	PedON ( la:'.':D )*6 bar ...
	PedON ( la:'.':D )*6 bar ...
	PedON ( la:'.':D )*6 bar ...
	PedON ( la:'.':D )*6 bar ...
	PedON ( la:'.':D )*6 bar ...
	PedON ( re+la:'.':D )*6 bar ...
	PedON ( reD+la:'.':D )*6 bar ...
	PedON ( mi+la:'.':D )*4 PedON ( mi+solD:'.':D )*2 bar ...
	DynP PedON -la+la:D ( la:'.':D )*5 bar ...
	PedON ( la:'.':D )*6 bar ...
	PedON ( la:'.':D )*6 bar ...
	PedON ( la:'.':D )*6 bar ...
	PedON ( siB:'.':D )*6 bar ...
	PedON ( siB:'.':D )*6 bar ...
	PedON ( siB:'.':D )*6 bar ...
	PedON ( si:'.':D )*6 bar ...
	Note( '-' ) PedON do:N PedOFF S:C bar ...
	DynPP mi+solD:'.':C S:C S:C bar ...
	Note( 'crescendo', [ N' N' N ], 'mp' ) ...
	PedON --la:C S:C la++do++mi:'.':C bar ...
	la++do++mi:'.':C S:C la++do++mi:'.':C bar ...
	la++do++mi:'.':C S:C la++do++mi:'.':C bar ...
	la++do++mi:C PedOFF S:C S:C bar ...
	S:N' bar ...
	S:N' bar ...
	];
	
MGF = [ MARK_F Note( '-' ) DynPP ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	[ -la mi la ] * RIFF ...
	S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	[ -la mi la ] * RIFF ...
	DynMF ...
	[ do sol +do ] * RIFF ...
	[ -sol sol si ] * RIFF ...
	[ -la mi la ] * RIFF ...
	DynP PedON -mi:'.':D mi:D ~+mi:D S:[D D] +mi:D bar ...
	~++mi:D S:[D D] PedOFF ++reD:D ~++mi:D S:D bar ...
	S:D ++reD:D ++mi:D S:[D C] bar ...
	DynPP S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	[ -la mi la ] * RIFF ...
	S:N' bar ...
	[ -la mi la ] * RIFF ...
	[ -mi mi solD ] * RIFF ...
	--la+-la:'-':N' bar ...
	];
	
%% CACOFONIX

cacofonix( 'FurElise.mid', 'Tempo', 70, 'Velocity', linspace( 25, 100, 8 ), 'Piano', ...
	[ MDAna MDA MDA1 MDA MDA2 MDB MDB1 MDB MDB2 MDC MDD MDE MDF] / ...
	[ MGAna MGA MGA1 MGA MGA2 MGB MGB1 MGB MGB2 MGC MGD MGE MGF] );
