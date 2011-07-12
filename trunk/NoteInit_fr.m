
clc

V = Note( 'void' );

bar = Note( 'bar' );

S = Note( 'rest' ); % silence

doB = Note( 'doB' );	do = Note( 'do' );	doN = Note( 'do' );		doD = Note( 'doD' );
reB = Note( 'reB' );	re = Note( 're' );	reN = Note( 're' );		reD = Note( 'reD' );
miB = Note( 'miB' );	mi = Note( 'mi' );	miN = Note( 'mi' );		miD = Note( 'miD' );
faB = Note( 'faB' );	fa = Note( 'fa' );	faN = Note( 'fa' );		faD = Note( 'faD' );
solB = Note( 'solB' );	sol = Note( 'sol' );	solN = Note( 'sol' );	solD = Note( 'solD' );
laB = Note( 'laB' );	la = Note( 'la' );	laN = Note( 'la' );		laD = Note( 'laD' );
siB = Note( 'siB' );	si = Note( 'si' );	siN = Note( 'si' );		siD = Note( 'siD' );

R = Note( 4 ); % ronde
B = Note( 2 ); % blanche
N = Note( 1 ); % noire
C = Note( 1/2 ); % croche
D = Note( 1/4 ); % double-croche

T = Note( 1/3 ); % triolet (croche)

DynFFF = Note( 'Dynamics', 'fff');
DynFF = Note( 'Dynamics', 'ff');
DynF = Note( 'Dynamics', 'f');
DynMF = Note( 'Dynamics', 'mf');
DynMP = Note( 'Dynamics', 'mp');
DynP = Note( 'Dynamics', 'p');
DynPP = Note( 'Dynamics', 'pp');
DynPPP = Note( 'Dynamics', 'ppp');

DynpFFF = Note( 'Dynamics*', 'fff');
DynpFF = Note( 'Dynamics*', 'ff');
DynpF = Note( 'Dynamics*', 'f');
DynpMF = Note( 'Dynamics*', 'mf');
DynpMP = Note( 'Dynamics*', 'mp');
DynpP = Note( 'Dynamics*', 'p');
DynpPP = Note( 'Dynamics*', 'pp');
DynpPPP = Note( 'Dynamics*', 'ppp');

%% ### Accords

% Accord de trois notes
Cmaj = [ V V^[2 0] V^[4 0] ];	CM = Cmaj;
Cmin = [ V V^[2 -1] V^[4 0] ];	Cm = Cmin;
Caug = [ V V^[2 0] V^[4 1] ];
Cdim = [ V V^[2 -1] V^[4 -1] ];

% Accord de quatre notes
Cdim7 = [ V V^[2 -1] V^[4 -1] V^[6 -2] ];
Cm7f5 = [ V V^[2 -1] V^[4 -1] V^[6 -1] ];
Cmin7 = [ V V^[2 -1] V^[4 0] V^[6 -1] ];	Cm7 = Cmin7;
CmM7 = [ V V^[2 -1] V^[4 0] V^[6 0] ];
Cdom7 = [ V V^[2 0] V^[4 0] V^[6 -1] ];	    C7 = Cdom7;
Cmaj7 = [ V V^[2 0] V^[4 0] V^[6 0] ];	    CM7 = Cmaj7;
Caug7 = [ V V^[2 0] V^[4 1] V^[6 -1] ];
CM7s5 = [ V V^[2 0] V^[4 1] V^[6 0] ];

sus2 = [ V-1 (V-1)^[1 0] V-3 V-4 ];
sus4 = [ V-1 (V-1)^[3 0] V-3 V-4 ];

