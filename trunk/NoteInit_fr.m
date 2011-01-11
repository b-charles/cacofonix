
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
