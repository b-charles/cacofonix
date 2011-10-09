
%
% Dark World
%
% Compositor: Koji Kondo
% From: The Legend of Zelda: A Link to the Past
%

clc

NoteInit_fr

[si, siN] = deal(siB, si);
[mi, miN] = deal(miB, mi);

%% Main Droite

RIFF1 = [ V-1:D V-2:D V-3:D V-4:[D C] V-5:[C C] V-6:C V-7:D V-8:D V-9:C bar ];

MD = [ ...
	[ S:R bar ]*3 ...
	S:[B N C] do:C bar ...
	mi+sol:[B C] do:C mi+sol:C sol++do:C bar ...
	fa+la:D sol+si:D fa+la:[N' N'] mi+sol:D re+fa:D bar ...
	mi+sol:N -laB+do:[B C] fa:C bar ...
	-si+re:D mi:D -si+re:[N' N'] do:D -si:D bar ...
	-sol+do:B' [sol +do +mi +sol].*D bar ...
	+re:B' ~+re:'.':C do:C bar ...
	mi+sol++do:B [ +sol do mi+sol sol++do].*C bar ...
	fa+la++fa:D sol+si:D fa+la:[N' N'] mi+sol:D re+fa:D bar ...
	mi+sol++mi:N do+mi++do:[B C] fa++mi:C bar ...
	re++re:D mi:D re++re:[N' N'] do:D -si:D bar ...
	do+mi++do:B' [+fa +mi +re +do].*D bar ...
	+re:B' ~+re:'.':C do+sol:D re+la:D bar ...
	mi+sol+si:B' sol:C mi+sol+si:C bar ...
	fa+la:D sol:D fa:[N' N'] do+mi:D re+fa:D bar ...
	mi+sol:B' -laB+do:C mi+sol:C bar ...
	re+fa:D do+mi:D -si+re:[N' N'] do+sol:D re+la:D bar ...
	mi+sol+si:B' sol:C mi+sol+si:C bar ...
	fa+la:D sol+si:D la++do:[N' B] bar ...
	sol+si:B' miN+sol:C sol+si:C bar ...
	faD+la:D miN+sol:D faD+la:[N' B] bar ...
	re+sol:R bar ...
	S:R bar ...
	[ do+mi++do sol fa mi+sol do+mi do+mi do+mi++do do+mi do+mi ]*RIFF1 ...
	[ -si+re+si sol fa re+sol -si+re -si+re -si+re -si+re -si+re ]*RIFF1 ...
	[ reB+si fa mi reB+fa -si+reB -si+reB -si+reB+si -si+reB -si+reB ]*RIFF1 ...
	[ do+laB mi re do+mi -laB+do -laB+do -laB+do -laB+do -laB+do ]*RIFF1 ...
	[ -siN+sol re reB -siN+re -siN+re -siN+re -siN+re+sol -siN+re -siN+re ]*RIFF1 ...
	[ do++do sol fa do+sol -sol+do+mi do+mi do+mi++do do+mi do+mi ]*RIFF1 ...
	faD+la++re:N' (-la+do).*[N C D D C] bar ...
	do+re:N' (-siN+re).*[N C D D C] bar ];
	

%% Main Gauche

V1 = V-1; V2 = V-2; V3 = V-3; V4 = V-4;
RIFF1 = [ -V1+V1:C V2+V3:C V1+V2+V3:C V2+V3:D V2+V3:D V1+V2+V3:C V4:C V1:C -V1+V1:C bar ];
RIFF2 = [ -V1+V1:C V2+V3:C V1+V2+V3:C V2+V3:D V2+V3:D V1+V2+V3:C V2+V3:C V2+V3:D V2+V3:D -V1+V1:C bar ];
RIFF3 = [ (-V+V).*[N' N C D D C ] bar ];

MG = [ Note('-') DynMP ...
	[ do mi sol fa+la ]*RIFF1 ...
	[ do sol si fa+la++do ]*RIFF1 ...
	[ do mi sol fa+la ]*RIFF1 ...
	[ do sol si fa+la++do ]*RIFF1 ...
	[ do mi sol mi+sol ]*RIFF1 ...
	[ fa la +do la++do ]*RIFF1 ...
	[ -laB mi sol mi+sol ]*RIFF1 ...
	[ -si re fa re+fa ]*RIFF1 ...
	[ do mi sol fa+la ]*RIFF1 ...
	[ do sol si fa+la++do ]*RIFF1 ...
	[ do mi sol mi+sol ]*RIFF1 ...
	[ fa la +do la++do ]*RIFF1 ...
	[ -laB mi sol mi+sol ]*RIFF1 ...
	[ -si re fa re+fa ]*RIFF1 ...
	[ do mi sol fa+la ]*RIFF1 ...
	[ do sol si fa+la++do ]*RIFF1 ...
	[ mi sol si ]*RIFF2 ...
	[ fa la +do ]*RIFF2 ...
	[ -laB mi sol ]*RIFF2 ...
	[ -si re fa ]*RIFF2 ...
	[ mi sol si ]*RIFF2 ...
	[ fa la +do ]*RIFF2 ...
	[ miN sol si]*RIFF2 ...
	[ re faD la ]*RIFF2 ...
	-sol+sol:C si++re:C sol+si++re:C si++re:D si++re:D sol++do++miN:C +do++miN:C sol:D sol:D -sol+sol:C bar ...
	-sol+sol:C +re++fa:C sol++re++fa:C +re++fa:D +re++fa:D sol++do++miN:C +do++miN:C sol:D sol:D -sol+sol:C bar ...
	laB*RIFF3 ...
	sol*RIFF3 ...
	faD*RIFF3 ...
	fa*RIFF3 ...
	miN*RIFF3 ...
	mi*RIFF3 ...
	re*RIFF3 ...
	sol*RIFF3 ];
	


%% Cacofonix

cacofonix( 'DarkWorld', 'Tempo', 138, (MD/MG)*2 );
	
	
