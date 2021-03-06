
%
% Overworld
%
% Compositor: Koji Kondo
% From: The Legend of Zelda
%

clc

NoteInit

%% Zelda song

[Bn, B] = deal(B, Bf);
[En, E] = deal(E, Ef);
[An, A] = deal(A, Af);

MD1_INTRO = [ Note('') ...
	B:N2 R:N12 R:N12 B:N12 B:N12 B:N12 B:N12 bar ...
	B:N8' A:N16 B:N4 R:N12 R:N12 B:N12 B:N12 B:N12 B:N12 bar ...
	B:N8' A:N16 B:N4 R:N12 R:N12 B:N12 B:N12 B:N12 B:N12 bar ...
	B:N8 F:N16 F:N16 F:N8 F:N16 F:N16 F:N8 F:N16 F:N16 F:N8 F:N8 bar ]; %#ok<*BDSCA>
MD2_INTRO = [ Note('') ...
	D:N2 R:N12 R:N12 D:N12 D:N12 D:N12 D:N12 bar ...
	C:N8' C:N16 C:N4 R:N12 R:N12 C:N12 C:N12 C:N12 C:N12 bar ...
	Df:N8' Df:N16 Df:N4 R:N12 R:N12 Df:N12 Df:N12 Df:N12 Df:N12 bar ...
	Df:N8 -An:N16 -An:N16 -An:N8 -An:N16 -An:N16 -An:N8 -An:N16 -An:N16 -An:N8 -An:N8 bar ];
MG_INTRO = [ Note('--') ...
	B:'.':N4 B:N12 B:N12 B:N12 B:'.':N4 B:N12 B:N12 B:N12 bar ...
	A:'.':N4 A:N12 A:N12 A:N12 A:'.':N4 A:N12 A:N12 A:N12 bar ...
	Gf:'.':N4 Gf:N12 Gf:N12 Gf:N12 Gf:'.':N4 Gf:N12 Gf:N12 Gf:N12 bar ...
	F:N4 F:N4 F:N4 G:N8 An:N8 bar ];

MD1 = [ Note('+') ...
	-B:N4 -F:N4 ~-F:N8' -B:N16 -B:N16 C:N16 D:N16 E:N16 bar ...
	F:N2 R:N8 F:N8 F:N12 Gf:N12 A:N12 bar ...
	B:N2 R:N12 B:N12 B:N12 B:N12 A:N12 Gf:N12 bar ...
	A:N8' Gf:N16 F:N2 F:N4 bar ...
	E:N8 E:N16 F:N16 Gf:N2 F:N8 E:N8 bar ...
	Df:N8 Df:N16 E:N16 F:N2 E:N8 D:N8 bar ...
	C:N8 C:N16 D:N16 En:N2 G:N4 bar ...
	F:N8 -F:N16 -F:N16 -F:N8 -F:N16 -F:N16 -F:N8 -F:N16 -F:N16 -F:N8 -F:N8 bar ...
	-B:N4 -F:N4 ~-F:N8' -B:N16 -B:N16 C:N16 D:N16 E:N16 bar ...
	F:N2 R:N8 F:N8 F:N12 Gf:N12 A:N12 bar ...
	B:N2 R:N4 +Df:N4 bar ...
	+C:N4 An:N4 R:N4 F:N4 bar ...
	Gf:N2 R:N4 B:N4 bar ...
	An:N4 F:N4 R:N4 F:N4 bar ...
	Gf:N2 R:N4 B:N4 bar ...
	An:N4 F:N4 R:N4 D:N4 bar ...
	E:N2 R:N4 Gf:N4 bar ...
	F:N4 Df:N4 R:N4 -B:N4 bar ...
	C:N8 C:N16 D:N16 En:N4 R:N4 G:N4 bar ...
	F:N8 -F:N16 -F:N16 -F:N8 -F:N16 -F:N16 -F:N8 -F:N16 -F:N16 -F:N8 -F:N8 bar ];

MD2 = [ Note('') ...
	D:N4 D:N12 D:N12 C:N12 D:N8' D:N16 D:N16 E:N16 F:N16 G:N16 bar ...
	A:N8' B:N16 B:N16 +C:N16 +D:N16 +E:N16 +F:N4 A:N12 B:N12 +C:N12 bar ...
	+Df:N8' Gf:N16 Gf:N16 A:N16 B:N16 +C:N16 +Df:N2 bar ... %%
	+Df:N8' A:N16 A:N12 A:N12 Gf:N12 A:N8' A:N16 A:N12 Gf:N12 A:N12 bar ...
	Gf:N8 Gf:N16 F:N16 Gf:N8 Gf:N16 A:N16 B:N4 A:N8 Gf:N8 bar ...
	F:N8 F:N16 E:N16 F:N8 F:N16 Gf:N16 A:N4 Gf:N8 F:N8 bar ...
	En:N4 En:N8 En:N16 F:N16 G:N8 G:N16 An:N16 B:N8 +C:N8 bar ...
	An:N8 -An:N16 -An:N16 -An:N8 -An:N16 -An:N16 -An:N8 -An:N16 -An:N16 -An:N8 -An:N8 bar ...
	D:N4 D:N12 D:N12 C:N12 D:N8' D:N16 D:N16 E:N16 F:N16 G:N16 bar ...
	A:N8' B:N16 B:N16 +C:N16 +D:N16 +E:N16 +F:N4 A:N12 B:N12 +C:N12 bar ...
	+Df:N2 R:N4 +En:N4 bar ...
	+E:N4 +C:N4 R:N4 An:N4 bar ...
	Bn:N2 R:N4 +Df:N4 bar ...
	+C:N4 An:N4 R:N4 An:N4 bar ...
	Bn:N2 R:N4 +Df:N4 bar ...
	+C:N4 An:N4 R:N4 An:N4 bar ...
	Gf:N2 R:N4 +Cf:N4 bar ...
	B:N4 F:N4 R:N4 Df:N4 bar ...
	En:N4 En:N8 En:N16 F:N16 G:N8 G:N16 An:N16 B:N8 +C:N8 bar ...
	An:N8 -An:N16 -An:N16 -An:N8 -An:N16 -An:N16 -An:N8 -An:N16 -An:N16 -An:N8 -An:N8 bar ];

MG = [ Note('--') ...
	B:'.':N4 B:N12 B:N12 A:N12 B:'.':N4 B:'.':N4 bar ...
	A:'.':N4 A:N12 A:N12 Gf:N12 A:'.':N4 A:'.':N4 bar ...
	Gf:'.':N4 Gf:N12 Gf:N12 Ff:N12 Gf:'.':N4 Gf:'.':N4 bar ...
	+Df:'.':N4 +Df:N12 +Df:N12 +C:N12 +Df:'.':N4 +Df:'.':N4 bar ...
	Bn:'.':N4 Bn:N12 Bn:N12 B:N12 Bn:'.':N4 Bn:N12 Bn:N12 Bn:N12 bar ...
	B:'.':N4 B:N12 B:N12 A:N12 B:'.':N4 B:N12 B:N12 B:N12 bar ...
	+C:'.':N4 +C:N12 +C:N12 Bn:N12 +C:N4 +C:N12 +C:N12 +C:N12 bar ...
	F:N4 F:N4 F:N4 G:N8 An:N8 bar ...
	B:'.':N4 B:N12 B:N12 A:N12 B:'.':N4 B:'.':N4 bar ...
	A:'.':N4 A:N12 A:N12 Gf:N12 A:'.':N4 A:'.':N4 bar ...
	Gf:N4 Gf:N12 Gf:N12 Ff:N12 Gf:'.':N4 Gf:'.':N4 bar ...
	F:'.':N4 F:N12 F:N12 E:N12 F:'.':N4 F:'.':N4 bar ...
	En:N12 B:N12 +Df:N12 +En:N12 +B:N12 ++Df:N12 ++En:'.':N4 R:N4 bar ...
	++F:'.':N4 F:N12 F:N12 F:N12 F:'.':N4 R:N4 bar ...
	En:N12 B:N12 +Df:N12 +En:N12 +B:N12 ++Df:N12 ++En:'.':N4 R:N4 bar ...
	++F:'.':N4 F:N12 F:N12 F:N12 F:'.':N4 R:N4 bar ...
	Bn:'.':N4 Bn:N12 Bn:N12 Bn:N12 Bn:'.':N4 Bn:N12 Bn:N12 Bn:N12 bar ...
	B:'.':N4 B:N12 B:N12 B:N12 B:'.':N4 B:N12 B:N12 B:N12 bar ...
	+C:'.':N4 +C:N12 +C:N12 Bn:N12 +C:'.':N4 +C:N12 +C:N12 +C:N12 bar ...
	F:N4 F:N4 F:N4 G:N8 An:N8 bar ];

cacofonix( 'Zelda', 'Tempo', 150, ...
	'Piano', [ MD1_INTRO MD1 MD1 ] / [ MD2_INTRO MD2 MD2 ] / [MG_INTRO MG MG ] );
