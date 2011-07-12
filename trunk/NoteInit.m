
clc

V = Note( 'void' );

bar = Note( 'bar' );

R = Note( 'rest' );

Cf = Note( 'Cf' ); C = Note( 'C' ); Cs = Note( 'Cs' );
Df = Note( 'Df' ); D = Note( 'D' ); Ds = Note( 'Ds' );
Ef = Note( 'Ef' ); E = Note( 'E' ); Es = Note( 'Es' );
Ff = Note( 'Ff' ); F = Note( 'F' ); Fs = Note( 'Fs' );
Gf = Note( 'Gf' ); G = Note( 'G' ); Gs = Note( 'Gs' );
Af = Note( 'Af' ); A = Note( 'A' ); As = Note( 'As' );
Bf = Note( 'Bf' ); B = Note( 'B' ); Bs = Note( 'Bs' );

N = Note( 4 );
N2 = Note( 2 );
N4 = Note( 1 );
N8 = Note( 0.5 );
N16 = Note( 0.25 );
N12 = Note( 1/3 );

DynFFF = Note( 'Dynamics', 'fff');
DynFF = Note( 'Dynamics', 'ff');
DynF = Note( 'Dynamics', 'f');
DynMF = Note( 'Dynamics', 'mf');
DynMP = Note( 'Dynamics', 'mp');
DynP = Note( 'Dynamics', 'p');
DynPP = Note( 'Dynamics', 'pp');
DynPPP = Note( 'Dynamics', 'ppp');

%% ### Chords

% TRIADS
Cmaj = [ V V^[2 0] V^[4 0] ];	CM = Cmaj;
Cmin = [ V V^[2 -1] V^[4 0] ];	Cm = Cmin;
Caug = [ V V^[2 0] V^[4 1] ];
Cdim = [ V V^[2 -1] V^[4 -1] ];

% SEVENTH CHORDS
Cdim7 = [ V V^[2 -1] V^[4 -1] V^[6 -2] ];
Cm7f5 = [ V V^[2 -1] V^[4 -1] V^[6 -1] ];
Cmin7 = [ V V^[2 -1] V^[4 0] V^[6 -1] ];	Cm7 = Cmin7;
CmM7 = [ V V^[2 -1] V^[4 0] V^[6 0] ];
Cdom7 = [ V V^[2 0] V^[4 0] V^[6 -1] ];	C7 = Cdom7;
Cmaj7 = [ V V^[2 0] V^[4 0] V^[6 0] ];	CM7 = Cmaj7;
Caug7 = [ V V^[2 0] V^[4 1] V^[6 -1] ];
CM7s5 = [ V V^[2 0] V^[4 1] V^[6 0] ];
