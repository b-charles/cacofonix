
%
% William Tell Overture
%
% Compositor: Gioachino Rossini
%

clc

Note.setNbCharByQuater( 48 );

MARK226 = Note( 'Marker', '#226#' );
MARK234 = Note( 'Marker', '#234#' );
MARK243 = Note( 'Marker', '#243#' );
MARK250 = Note( 'Marker', '#250#' );
MARK256 = Note( 'Marker', '#256#' );
MARK264 = Note( 'Marker', '#264#' );
MARK272 = Note( 'Marker', '#272#' );
MARK280 = Note( 'Marker', '#280#' );
MARK286 = Note( 'Marker', '#286#' );
MARK291 = Note( 'Marker', '#291#' );
MARK300 = Note( 'Marker', '#300#' );

%% MAIN

NoteInit_fr

M = [ S:B bar ];

MAIN = [ ...
		MARK226 M*8 MARK234 M*9 MARK243 M*7 MARK250 M*6 MARK256 M*8 ...
		MARK264 M*8 MARK272 M*8 MARK280 M*6 MARK286 M*5 MARK291 M*9 ...
		MARK300 ];
	
%% PICCOLO

NoteInit_fr

[ faBe, fa ] = deal( fa, faD );
[ doBe, do ] = deal( do, doD );
[ solBe, sol ] = deal( sol, solD );
[ reBe, re ] = deal( re, reD );

PICCOLO = [ ...
		~MARK250 ...
		S:B bar ...
		S:N S:C DynPP si:D si:D bar ...
		si:C si:D si:D si:C si:D si:D bar ...
		+mi:C +fa:C +sol:C si:D si:D bar ...
		si:C si:D si:D +mi:C +sol:D +sol:D bar ...
		+fa:C +re:C si:C si:D si:D bar ...
		MARK256 ...
		si.*[ C D D ]*2 bar ...
		+mi:C +fa:C +sol:C DynFF Note('+') mi:D sol:D bar ...
		si:N ~si:D la:D sol:D fa:D bar ...
		mi:C sol:C mi:C DynFF sol:D sol:D bar ...
		sol.*[ C D D ]*2 bar ...
		[ sol +do sol +do ].*C bar ...
		[ sol +do sol fa ].*C bar ...
		mi:C re:C do:C sol:D sol:D bar ...
		MARK264 ...
		sol.*[ C D D ]*2 bar ...
		[ sol +do sol +do ].*C bar ...
		[ sol +do si laD ].*C bar ...
		si:C laD:C si:C sol:D sol:D bar ...
		sol.*[ C D D ]*2 bar ...
		[ sol +do sol +do ].*C bar ...
		[ sol +do sol fa ].*C bar ...
		mi:C re:C do:C sol:D sol:D bar ...
		MARK272 ...
		sol.*[ C D D ]*2 bar ...
		[ sol +do sol +do ].*C bar ...
		[ sol +do si laD ].*C bar ...
		si:C S:C S:N bar ...
		~MARK291 ...
		S:N S:C DynPP si.*D*2 bar ...
		si.*[ C D D ]*2 bar ...
		[ +mi +fa +sol ].*C si.*D*2 bar ...
		si.*[ C D D ] +mi:C +sol:D +sol:D bar ...
		[ +fa +re si ].*C si.*D*2 bar ...
		si.*[ C D D ]*2 bar ...
		[ +mi +fa +sol ].*C DynFF +mi:D +sol:D bar ...
		+si:N [ ~+si +la +sol +fa ].*D bar ...
		[ +mi +sol +mi ].*C S:C bar ...
		MARK300 ...
		];

%% FLUTE

NoteInit_fr

[ faBe, fa ] = deal( fa, faD );
[ doBe, do ] = deal( do, doD );
[ solBe, sol ] = deal( sol, solD );
[ reBe, re ] = deal( re, reD );

FLUTE = [ ...
		~MARK250 ...
		S:B bar ...
		Note( '+' ) S:N S:C DynPP si:D si:D bar ...
		si:C si:D si:D si:C si:D si:D bar ...
		+mi:C +fa:C +sol:C si:D si:D bar ...
		si:C si:D si:D +mi:C +sol:D +sol:D bar ...
		+fa:C +re:C si:C si:D si:D bar ...
		MARK256 ...
		si.*[ C D D ]*2 bar ...
		+mi:C +fa:C +sol:C DynFF mi:D sol:D bar ...
		si:N ~si:D la:D sol:D fa:D bar ...
		mi:C sol:C mi:C DynFF Note('++') mi:D mi:D bar ...
		mi.*[ C D D ]*2 bar ...
		[ mi do mi do ].*C bar ...
		[ mi do mi -fa ].*C bar ...
		do:C -siD:C do:C mi:D mi:D bar ...
		MARK264 ...
		mi.*[ C D D ]*2 bar ...
		[ mi do mi do ].*C bar ...
		[ mi do re do ].*C bar ...
		[ si laD si ].*C mi.*[D D] bar ...
		mi.*[ C D D ]*2 bar ...
		[ mi do mi do ].*C bar ...
		[ mi do mi do ].*C bar ...
		do:C -siD:C do:C mi:D mi:D bar ...
		MARK272 ...
		mi.*[ C D D ]*2 bar ...
		[ mi do mi do ].*C bar ...
		[ mi do re do ].*C bar ...
		-si:C S:C S:N bar ...
		~MARK291 ...
		S:N S:C DynPP si.*D*2 bar ...
		si.*[ C D D ]*2 bar ...
		[ +mi +fa +sol ].*C si.*D*2 bar ...
		si.*[ C D D ] +mi:C +sol:D +sol:D bar ...
		[ +fa +re si ].*C si.*D*2 bar ...
		si.*[ C D D ]*2 bar ...
		[ +mi +fa +sol ].*C DynFF Note('+0') +mi:D +sol:D bar ...
		+si:N [ ~+si +la +sol +fa ].*D bar ...
		[ +mi +sol +mi ].*C S:C bar ...
		MARK300 ...
		];

%% OBOES

NoteInit_fr

[ faBe, fa ] = deal( fa, faD );
[ doBe, do ] = deal( do, doD );
[ solBe, sol ] = deal( sol, solD );
[ reBe, re ] = deal( re, reD );

OBOES = [ ...
		~MARK250 ...
		S:B bar ...
		S:N S:C DynPP sol+si:D sol+si:D bar ...
		(sol+si).*[ C D D ]*2 bar ...
		sol++mi:C sol++fa:C sol++sol:C sol+si:D sol+si:D bar ...
		sol+si:C sol+si:D sol+si:D sol++mi:C +mi++sol:D +mi++sol:D bar ...
		+re++fa:C si++re:C si:C sol+si:D sol+si:D bar ...
		MARK256 ...
		(sol+si).*[ C D D ]*2 bar ...
		sol++mi:C sol++fa:C sol++sol:C DynFF Note('+') mi:D sol:D bar ...
		si:N ~si:D la:D sol:D fa:D bar ...
		mi:C sol:C mi:C DynFF (mi+sol).*D*2 bar ...
		(mi+sol).*[C D D]*2 bar ...
		mi+sol:C do++do:C mi+sol:C do++do:C bar ...
		mi+sol:C do++do:C mi+sol:C re+fa:C bar ...
		do+mi:C -siD+re:C do:C (mi+sol).*D*2 bar ...
		MARK264 ...
		(mi+sol).*[ C D D ]*2 bar ...
		mi+sol:C do++do:C mi+sol:C do++do:C bar ...
		mi+sol:C do++do:C re+si:C do+laD:C bar ...
		re+si:C mi+laD:C (re+si):C (mi+sol).*D*2 bar ...
		(mi+sol).*[C D D]*2 bar ...
		mi+sol:C do++do:C mi+sol:C do++do:C bar ...
		mi+sol:C do++do:C mi+sol:C re+fa:C bar ...
		do+mi:C -siD+re:C do:C (mi+sol).*D*2 bar ...
		MARK272 ...
		(mi+sol).*[C D D]*2 bar ...
		mi+sol:C do++do:C mi+sol:C do++do:C bar ...
		mi+sol:C do++do:C re+si:C do+laD:C bar ...
		re+si:C S:C S:N bar ...
		[ S:B bar ]*3 ...
		S:N S:C DynP (-si+fa).*D*2 bar ...
		MARK280 ...
		(-si+fa).*[ C D D C ] mi+sol:C bar ...
		fa+la:C -si+fa:'>':N fa+la:C bar ...
		mi+sol:C -sol+mi:'>':N mi+sol:C bar ...
		re+fa:C S:C S:N bar ...
		~MARK291 ...
		S:N S:C DynPP sol+si:D sol+si:D bar ...
		(sol+si).*[C D D]*2 bar ...
		sol++mi:C sol++fa:C sol++sol:C sol+si:D sol+si:D bar ...
		(sol+si).*[C D D] sol++mi:C +mi++sol:D +mi++sol:D bar ...
		+re++fa:C si++re:C si:C sol+si:D sol+si:D bar ...
		(sol+si).*[ C D D C D D ] bar ...
		sol++mi:C sol++fa:C sol++sol:C DynFF +mi:D +sol:D bar ...
		+si:N [ ~+si +la +sol +fa ].*D bar ...
		[ +mi +sol +mi ].*C S:C bar ...
		MARK300 ...
		];

%% CLARINETS

NoteInit_fr

[ faBe, fa ] = deal( fa, faD );

CLARINETS = [ ...
		~MARK243 DynPP ...
		S:N S:C ( re:'.':S ).*[ D D ] bar ...
		( re:'.':S ).*[ C D D C D D ] bar ...
		[ sol la si ].*C re.*[ D D ] bar ...
		re:C re:D re:D sol:C si:D si:D bar ...
		[ la fa re ].*C re:D re:D bar ...
		re.*[ C D D C D D ] bar ...
		[ sol la si ].*C DynFF sol:D si:D bar ...
		MARK250 +re:N ~+re:D +do:D si:D la:D bar ...
		sol:C si:C sol:C DynPP re++re:D re++re:D bar ...
		re++re:C re++re:D re++re:D re++re:C re++re:D re++re:D bar ...
		sol++sol:C la++la:C si++si:C re++re:D re++re:D bar ...
		re++re:C re++re:D re++re:D sol+sol:C si++si:D si++si:D bar ...
		la++la:C fa++fa:C re++re:C re++re:D re++re:D bar ...
		MARK256 ...
		(re++re).*[C D D]*2 bar ...
		sol++sol:C la++la:C si++si:C DynFF sol:D si:D bar ...
		+re:N ~+re:D +do:D si:D la:D bar ...
		sol:C si:C sol:C DynFF Note('+') (sol+si).*[D D] bar ...
		(sol+si).*[ C D D ]*2 bar ...
		( [ sol+si mi ].*C )*2 bar ...
		sol+si:C mi:C sol+si:C reD:C bar ...
		mi:C reD+fa:C mi:C (sol+si).*[D D] bar ...
		MARK264 ...
		(sol+si).*[ C D D ]*2 bar ...
		( [ sol+si mi ].*C )*2 bar ...
		sol+si:C mi:C sol+si:C mi+sol:C bar ...
		re+fa:C doD+mi:C re:C (sol+si).*[D D] bar ...
		(sol+si).*[ C D D ]*2 bar ...
		( [ sol+si mi ].*C )*2 bar ...
		sol+si:C mi:C sol+si:C reD:C bar ...
		mi:C reD+fa:C mi:C (sol+si).*[D D] bar ...
		MARK272 ...
		(sol+si).*[ C D D ]*2 bar ...
		( [ sol+si mi ].*C )*2 bar ...
		sol+si:C mi:C fa+la:C mi+sol:C bar ...
		re+fa:C S:C S:C DynP Note('+0') (re+la).*D*2 bar ...
		(re+la).*[ C D D C ] sol+si:C bar ...
		la++do:C re+la:'>':N la++do:C bar ...
		sol+si:C -si+sol:'>':N sol+si:C bar ...
		(fa+la).*C*3 (re+la).*D*2 bar ...
		MARK280 ...
		(re+la).*[ C D D C ] sol+si:C bar ...
		la++do:C re+la:'>':N la++do:C bar ...
		sol+si:C -si+sol:'>':N sol+si:C bar ...
		fa+la:C S:C S:C DynPP re.*D*2 bar ...
		re.*[ C D D ]*2 bar ...
		[ sol la si ].*C re.*D*2 bar ...
		MARK286 ...
		re.*[ C D D ] sol:C si:D si:D bar ...
		[ la fa re ].*C re.*[D D] bar ...
		re.*[ C D D ]*2 bar ...
		[ sol la si ].*C DynFF sol:D si:D bar ...
		+re:N ~+re:D +do:D si:D la:D bar ...
		MARK291 ...
		[sol si sol].*C DynPP (re++re).*D*2 bar ...
		(re++re).*[ C D D C D D ] bar ...
		sol++sol:C la++la:C si++si:C re++re:D re++re:D bar ...
		(re++re).*[C D D] sol++sol:C (si++si).*D*2 bar ...
		la++la:C fa++fa:C re++re.*[ C D D ] bar ...
		re++re.*[ C D D C D D ] bar ...
		sol++sol:C la++la:C si++si:C DynFF sol:D si:D bar ...
		+re:N [ ~+re +do si la ].*D bar ...
		[ sol si sol S ].*C bar ...
		MARK300 ...
		];

%% BASSOONS

NoteInit_fr

[ faBe, fa ] = deal( fa, faD );
[ doBe, do ] = deal( do, doD );
[ solBe, sol ] = deal( sol, solD );
[ reBe, re ] = deal( re, reD );

BASSOON = [ Note( '--' ) ...
		~MARK234 ...
		[ S:B bar ]*6 ...
		DynF si++re:B bar ...
		~si++re:B bar ...
		~si++re:C S:C S:N bar ...
		MARK243 DynPP ...
		S:N S:C +mi.*[ D D ] bar ...
		+mi.*[ C D D C D D ] bar ...
		+mi:C +mi:C +mi:C mi.*[ D D ] bar ...
		+mi.*[ C D D C D D ] bar ...
		si++si:C si++fa:C si++fa:C +mi:D +mi:D bar ...
		+mi.*[ C D D C D D ] bar ...
		+mi:C +mi:C +mi:C DynFF mi.*[ D D ] bar ...
		MARK250 fa+la .* [ C D D ]*2 bar ...
		mi+sol:C mi+si:C mi+si:C DynPP mi+si:D mi+si:D bar ...
		( mi+si ) .* [ C D D C D D bar C C C D D bar C D D C D D bar ] ...
		-si+fa:C -si+fa:C -si+fa:C mi+si:D mi+si:D bar ...
		MARK256 ...
		(mi+si).*[ C D D C D D bar C C C DynFF D D ] bar ...
		(-si++re).*[ C D D ]*2 bar ...
		mi++mi:C mi+si:C mi+si:C DynFF do++do:D do++do:D bar ...
		(do++do).*[ C D D ]*2 bar ...
		( [ do++do S ].*C )*2 bar ...
		do++do:C S:C do++do:C -sol+sol:C bar ...
		(do++do).*[ C C C D D ] bar ...
		MARK264 ...
		(do++do).*[ C D D ]*2 bar ...
		( [ do++do S ].*C )*2 bar ...
		do++do:C S:C ( -mi+fa:C )*2  bar ...
		(do++do).*[ C C C D D ] bar ...
		(do++do).*[ C D D ]*2 bar ...
		( [ do++do S ].*C )*2 bar ...
		do++do:C S:C do++do:C -sol+sol:C bar ...
		(do++do).*[ C C C D D ] bar ...
		MARK272 ...
		(do++do).*[ C D D ]*2 bar ...
		( [ do++do S ].*C )*2 bar ...
		do++do:C S:C -fa+fa:C -fa+fa:C bar ...
		-si+si:C S:C S:N bar ...
		B:S bar ...
		S:C DynP Note('-') [ -si do re bar ...
		mi fa sol la ].*(S:'.':C) bar ...
		[ si -si si S ].*C bar ...
		MARK280 ...
		S:B bar ...
		[ S -si do re ].*(S:'.':C) bar ...
		[ mi fa sol la ].*(S:'.':C) bar ...
		si:C S:C S:C DynPP mi.*D*2 bar ...
		mi.*[ C D D ]*2 bar ...
		mi.*[ C C C D D ] bar ...
		MARK286 ...
		mi.*[ C D D C D D ] bar ...
		-si+si:C -si+fa:C -si+fa:C mi:D mi:D bar ...
		mi.*[ C D D ]*2 bar ...
		mi.*C*3 DynFF mi:D mi:D bar ...
		(fa+la).*[ C D D ]*2 bar ...
		MARK291 ...
		mi+sol:C (mi+si).*[ C C DynPP D D ] bar ...
		(mi+si).*[ C D D C D D ] bar ...
		(mi+si).*[ C C C D D ] bar ...
		(mi+si).*[ C D D C D D ] bar ...
		(-si+fa).*C*3 (mi+si).*D*2 bar ...
		(mi+si).*[ C D D C D D ] bar ...
		(mi+si).*[ C C C DynFF D D ] bar ...
		(-si++re).*[ C D D C D D ] bar ...
		mi++mi:C mi+si:C mi+si:C S:C bar ...
		MARK300 ...
		];

%% HORNS

NoteInit_fr

HORNS12 = [ ...
		~MARK234 DynFF ...
		mi++mi:N S:C mi++mi:D mi++mi:D bar ...
		mi++mi:N S:C mi++mi:D mi++mi:D bar ...
		( mi++mi ) .* [ C D D C C ] bar ...
		( mi++mi ) .* [ C D D C C ] bar ...
		( mi++mi ) .* [ C D D C C ] bar ...
		( mi++mi ) .* [ C D D C C ] bar ...
		DynF mi++mi:B bar ...
		~mi++mi:B bar ...
		~mi++mi:C S:C S:N bar ...
		~MARK250 S:B bar ...
		S:N S:C DynPP mi:D mi:D bar ...
		mi:C mi:D mi:D mi:C mi:D mi:D bar ...
		mi:C mi:C mi:C mi:D mi:D bar ...
		mi:C mi:D mi:D mi:C mi:D mi:D bar ...
		mi:C mi:C mi:C mi:D mi:D bar ...
		MARK256 ...
		mi.*[ C D D C D D bar ...
		C C C DynFF D D bar ...
		C D D C D D bar ...
		C C C ] DynFF +doD.*[ D D bar ...
		C D D C D D ] bar ...
		( [+doD S].*C )*2 bar ...
		+doD:C S:C +doD:C si:C bar ...
		+doD:C si:C la:C +doD:D +doD:D bar ...
		MARK264 ...
		+doD.*[ C D D C D D ] bar ...
		( [+doD S].*C )*2 bar ...
		+doD:C S:C si:C si:C bar ...
		+mi:C +do:C si:C +doD:D +doD:D bar ...
		+doD.*[ C D D C D D ] bar ...
		( [+doD S].*C )*2 bar ...
		+doD:C S:C +doD:C si:C bar ...
		+doD:C si:C la:C +doD:D +doD:D bar ...
		MARK272 ...
		+doD.*[ C D D C D D ] bar ...
		( [+doD S].*C )*2 bar ...
		+doD:C S:C si:C si:C bar ...
		mi++mi:C S:C S:N bar ...
		[ S:B bar ].*3 ...
		S:N S:C DynP (mi++mi).*D*2 bar ...
		MARK280 ...
		mi++mi:C S:C S:C (mi++mi:D)*2 bar ...
		mi++mi:C S:C S:C (mi++mi:D)*2 bar ...
		mi++mi:C S:C S:C (mi++mi:D)*2 bar ...
		mi++mi:C S:C S:N bar ...
		~MARK291 ...
		S:N S:C DynPP mi:D mi:D bar ...
		mi.*[C D D C D D] bar ...
		mi.*[C C C D D] bar ...
		mi.*[C D D C D D] bar ...
		mi.*[C C C D D] bar ...
		mi.*[C D D C D D] bar ...
		mi.*[C C C DynFF D D] bar ...
		mi.*[C D D C D D] bar ...
		mi.*[C C C] S:C bar ...
		MARK300
		];

NoteInit_fr

HORNS34 = [ ...
		MARK226 ...
		[ S:B bar ]*4 DynFF ...
		+do++mi:N S:C +do++mi:D +do++mi:D bar ...
		+do++mi:N S:C +do++mi:D +do++mi:D bar ...
		[ +do++mi sol++re mi++do sol++re ] .*C bar ...
		[ +do++mi +mi++sol +re++fa +do++mi ] .*C bar ...
		[ sol++re +do++mi sol++re +re++fa ] .*C bar ...
		[ +do++mi sol++re mi++do +do++mi ] .*C bar ...
		( si++re ) .* [ C D D C C ] bar ...
		( si++re ) .* [ C D D C C ] bar ...
		( si++re ) .* [ C D D C C ] bar ...
		( si++re ) .* [ C D D C C ] bar ...
		DynF si++re:B bar ...
		~si++re:B bar ...
		~si++re:C S:C S:N bar ...
		MARK243 DynPP ...
		S:N S:C (mi+sol).*[D D] bar ...
		(mi+sol) .* [ C D D C D D ] bar ...
		(mi+sol) .* [ C C C D D ] bar ...
		(mi+sol) .* [ C D D C D D ] bar ...
		(-sol+si) .* [ C C C ] (mi+sol) .* [ D D ] bar ...
		(mi+sol) .* [ C D D C D D ] bar ...
		(mi+sol) .* [ C C C ] DynFF (mi+sol) .* [ D D ] bar ...
		MARK250	...
		(-sol+si) .* [ C D D C D D ] bar ...
		(mi++do) .* [ C C C DynPP D D bar C D D C D D bar C C C D D bar C D D C D D ] bar ...
		(-sol+si) .* [ C C C ] (mi++do) .* [ D D ] bar ...
		MARK256 ...
		(mi++do).*[C D D C D D bar ...
		C C C DynFF D D ] bar ...
		(-sol+si).*[C D D]*2 bar ...
		(mi++do:C)*3 DynFF Note('+') (do+mi).*[ D D bar ...
		C D D C D D ] bar ...
		( [ do+mi S ].*C )*2 bar ...
		do+mi:C S:C do+mi:C -mi+mi:C bar ...
		-mi+mi:C -mi+re:C -mi+do:C (do+mi).*[D D] bar ...
		MARK264 ...
		(do+mi).*[ C D D ]*2 bar ...
		( [ do+mi S ].*C )*2 bar ...
		-la++do:C S:C -sol++re:C do+re:C bar ...
		-sol+re:C do+miB:C -sol+re:C (do+mi).*[D D] bar ...
		(do+mi).*[ C D D ]*2 bar ...
		( [ do+mi S ].*C )*2 bar ...
		do+mi:C S:C do+mi:C -mi+mi:C bar ...
		-mi+mi:C -mi+re:C -mi+do:C (do+mi).*[D D] bar ...
		MARK272 ...
		(do+mi).*[ C D D ]*2 bar ...
		( [ do+mi S ].*C )*2 bar ...
		do+mi:C S:C -sol+re:C do+re:C bar ...
		-sol+re:C S:C S:C DynP (-sol+re:'.':D)*2 bar ...
		(-sol+re).*[ C D D C ] do+mi:C bar ...
		re+sol:C -sol+re:'>':N re+sol:C bar ...
		do+mi:C -mi+do:'>':N do+mi:C bar ...
		-sol+re:C --sol+-sol:C --sol+-sol:C (-sol+re).*D*2 bar ...
		MARK280 ...
		-sol+re.*[ C D D C ] do+mi:C bar ...
		re+fa:C -sol+re:'>':N re+fa:C bar ...
		do+mi:C -mi+do:'>':N do+mi:C bar ...
		-sol+re:C S:C S:C DynPP Note('+0') (mi+sol).*D*2 bar ...
		(mi+sol).*[ C D D ]*2 bar ...
		(mi+sol).*[ C C C D D ] bar ...
		MARK286 ...
		(mi+sol).*[ C D D ]*2 bar ...
		(-sol+si).*C*3 (mi+sol).*D*2 bar ...
		(mi+sol).*[ C D D ]*2 bar ...
		(mi+sol).*[ C C C DynFF D D ] bar ...
		(-sol+si).*[ C D D ]*2 bar ...
		MARK291 ...
		(mi++do).*[C C C DynPP D D] bar ...
		(mi++do).*[C D D C D D] bar ...
		(mi++do).*[C C C D D] bar ...
		(mi++do).*[C D D C D D] bar ...
		(-sol+si).*C*3 (mi++do).*D*2 bar ...
		(mi++do).*[C D D C D D] bar ...
		(mi++do).*[C C C DynFF D D] bar ...
		(-sol+si).*[C D D C D D ] bar ...
		mi++do.*C*3 S:C bar ...
		MARK300 ...
		];

%% TRUMPET

NoteInit_fr

TRUMPET = [ ...
		MARK226 DynFF ...
		sol:N S:C sol:D sol:D bar ...
		sol:N S:C sol:D sol:D bar ...
		[ sol mi do mi ].*C bar ...
		[ sol mi sol +do].*C bar ...
		[ sol mi do mi ].*C bar ...
		[ sol mi sol +do].*C bar ...
		sol:N S:C sol:D sol:D bar ...
		sol:N S:C sol:D sol:D bar ...
		sol:N S:C sol:D sol:D bar ...
		sol:N S:C sol:D sol:D bar ...
		sol .* [ C D D C C ] bar ...
		sol .* [ C D D C C ] bar ...
		sol .* [ C D D C C ] bar ...
		sol .* [ C D D C C ] bar ...
		DynF sol:B bar ...
		~sol:B bar ...
		~sol:C S:C S:N bar ...
		~MARK250 ...
		S:B bar ...
		S:N S:C DynPP (do+mi) .* [ D D ] bar ...
		(do+mi) .* [ C D D C D D bar C C C D D bar C D D C D D ] bar ...
		(-sol+mi) .* [ C C C ] (do+mi) .* [ D D ] bar ...
		MARK256 ...
		(do+mi).*[ C D D C D D bar ...
		C C C DynFF D D ] bar ...
		(-sol+sol).*[ C D D ]*2 bar ...
		(do+mi).*[C C C] DynFF (mi++do).*[ D D ] bar ...
		(mi++do).*[ C D D ]*2 bar ...
		mi++do:C S:C mi++do:C S:C bar ...
		mi++do:C S:C mi++do:C mi++re:C bar ...
		(mi++do).*[ C C C D D ] bar ...
		MARK264 ...
		(mi++do).*[ C D D ]*2 bar ...
		mi++do:C S:C mi++do:C S:C bar ...
		mi++do:C S:C sol:C do:C bar ...
		[ sol do sol ].*C (mi++do:D)*2 bar ...
		(mi++do).*[ C D D ]*2 bar ...
		mi++do:C S:C mi++do:C S:C bar ...
		mi++do:C S:C mi++do:C mi++re:C bar ...
		(mi++do).*[ C C C D D ] bar ...
		MARK272 ...
		(mi++do).*[ C D D ]*2 bar ...
		mi++do:C S:C mi++do:C S:C bar ...
		mi++do:C S:C sol:C do:C bar ...
		sol:C S:C S:C DynPP sol.*D*2 bar ...
		sol:C S:C S:C sol.*D*2 bar ...
		sol:C S:C S:C sol.*D*2 bar ...
		sol:C S:C S:C sol.*D*2 bar ...
		sol:C S:C S:N bar ...
		MARK280 ~MARK291 ...
		S:N S:C (do+mi).*D*2 bar ...
		(do+mi).*[C D D C D D] bar ...
		(do+mi).*[C C C D D] bar ...
		(do+mi).*[C D D C D D] bar ...
		(-sol+sol).*C*3 (do+mi).*D*2 bar ...
		(do+mi).*[C D D C D D] bar ...
		(do+mi).*[C C C DynFF D D] bar ...
		(-sol+sol).*[C D D C D D ] bar ...
		(do+mi).*C*3 S:C bar ...
		MARK300 ...
		];

%% TROMBONE

NoteInit_fr

[ faBe, fa ] = deal( fa, faD );
[ doBe, do ] = deal( do, doD );
[ solBe, sol ] = deal( sol, solD );
[ reBe, re ] = deal( re, reD );

TROMBONE12 = [...
		Note( '--' ) ...
		~MARK234 ...
		[ S:B bar ]*6 ...
		DynF re+fa:B bar ...
		~re+fa:B bar ...
		~re+fa:C S:C S:N bar ...
		~MARK250 S:B bar S:B bar ...
		DynPP Note( '---' ) ...
		mi:'.':C S:C mi:'.':C S:C bar ...
		mi:'.':C mi:'.':C mi:'.':C S:C bar ...
		mi:C S:C mi:C S:C bar ...
		-si:C -si:C -si:C S:C bar ...
		MARK256 ...
		[ mi S mi S ].*C bar ...
		[mi mi mi S ].*C bar ...
		DynF [ -si S -si S ].*C bar ...
		[ mi S mi S ].*C bar ...
		DynFF Note('+') [ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S do -sol ].*C bar ...
		[ do do do S ].*C bar ...
		MARK264 ...
		[ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S -fa -fa ].*C bar ...
		[ do do do S ].*C bar ...
		DynF [ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S do -sol ].*C bar ...
		[ do do do S ].*C bar ...
		MARK272 ...
		[ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S -fa -fa ].*C bar ...
		si:C S:C S:N bar ...
		~MARK291 ...
		S:B bar ...
		DynPP Note('-') [ mi S mi S ].*(S:'.':C) bar ...
		[ mi mi mi S ].*(S:'.':C) bar ...
		[ mi S mi S ].*(S:'.':C) bar ...
		[ -si -si -si S ].*(S:'.':C) bar ...
		[ mi mi mi S ].*(S:'.':C) bar ...
		[ mi S mi S ].*(S:'.':C) bar ...
		DynF [ -si S -si S ].*(S:'.':C) bar ...
		[ mi mi mi S ].*(S:'.':C) bar ...
		MARK300 ...
		];

TROMBONE3 = [...
		Note( '-' ) ...
		~MARK234 ...
		[ S:B bar ]*6 ...
		DynF si:B bar ...
		~si:B bar ...
		~si:C S:C S:N bar ...
		~MARK250 S:B bar S:B bar ...
		DynPP ...
		mi:'.':C S:C mi:'.':C S:C bar ...
		mi:'.':C mi:'.':C mi:'.':C S:C bar ...
		mi:C S:C mi:C S:C bar ...
		-si:C -si:C -si:C S:C bar ...
		MARK256 ...
		[ mi S mi S ].*C bar ...
		[mi mi mi S ].*C bar ...
		DynF [ -si S -si S ].*C bar ...
		[ mi S mi S ].*C bar ...
		DynFF Note('+') [ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S do -sol ].*C bar ...
		[ do do do S ].*C bar ...
		MARK264 ...
		[ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S -fa -fa ].*C bar ...
		[ si si si S ].*C bar ...
		DynF [ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S do -sol ].*C bar ...
		[ do do do S ].*C bar ...
		MARK272 ...
		[ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S -fa -fa ].*C bar ...
		si:C S:C S:N bar ...
		~MARK291 Note('-') ...
		S:B bar ...
		[ mi S mi S ].*(S:'.':C) bar ...
		[ mi mi mi S ].*(S:'.':C) bar ...
		[ mi S mi S ].*(S:'.':C) bar ...
		[ -si -si -si S ].*(S:'.':C) bar ...
		[ mi mi mi S ].*(S:'.':C) bar ...
		[ mi S mi S ].*(S:'.':C) bar ...
		DynF [ -si S -si S ].*(S:'.':C) bar ...
		[ mi mi mi S ].*(S:'.':C) bar ...
		MARK300 ...
		];

%% TIMPANI

NoteInit_fr

B_ = si;
E_ = +mi;

TIMPANI = [ ...
		Note( '---' ) ...
		~MARK234 ...
		[ S:B bar ]*2 DynFF ...
		( B_:'.':S ) .* [ C D D C C ] bar ...
		( B_:'.':S ) .* [ C D D C C ] bar ...
		( B_:'.':S ) .* [ C D D C C ] bar ...
		( B_:'.':S ) .* [ C D D C C ] bar ...
		DynF ( B_ .* D )*8 bar ...
		( B_ .* D )*8 bar ...
		( B_ .* D )*2 S:C S:N bar ...
		MARK243 DynPP ...
		B:S bar ...
		E_:C S:C E_:C S:C bar ...
		E_:C E_:C E_:C S:C bar ...
		E_:C S:C E_:C S:C bar ...
		B_:C B_:C B_:C S:C bar ...
		E_:C S:C E_:C S:C bar ...
		E_:C E_:C E_:C S:C bar ...
		MARK250 ...
		DynF B_:C S:C B_:C S:C bar ...
		E_:C E_:C E_:C S:C bar ...
		DynP E_:C S:C E_:C S:C bar ...
		E_:C E_:C E_:C S:C bar ...
		E_:C S:C E_:C S:C bar ...
		B_:C B_:C B_:C S:C bar ...
		MARK256 ...
		E_:C S:C E_:C E_:C bar ...
		E_:C E_:C E_:C S:C bar ...
		DynF B_:C S:C B_:C S:C bar ...
		E_:C E_:C E_:C DynFF E_:D E_:D bar ...
		E_:C E_:D E_:D E_:C E_:D E_:D bar ...
		E_:C E_:C E_:C E_:C bar ...
		E_:C E_:C E_:C E_:C bar ...
		E_:C E_:C E_:C E_:D E_:D bar ...
		MARK264 ...
		E_.*[ C D D C D D ] bar ...
		E_.*C*4 bar ...
		E_:C E_:C B_:C E_:C bar ...
		B_.*C*3 E_.*D*2 bar ...
		E_.*[ C D D ]*2 bar ...
		E_.*C*4 bar ...
		E_.*C*4 bar ...
		E_.*C*3 E_.*D*2 bar ...
		MARK272 ...
		E_.*[ C D D C D D ] bar ...
		E_.*C*4 bar ...
		E_:C E_:C B_:C E_:C bar ...
		B_:C S:C S:N bar ...
		~MARK280 [ S:B bar ]*4 ...
		DynPP E_:C S:C E_:C S:C bar ...
		E_:C E_:C E_:C S:C bar ...
		MARK286 ...
		E_:C S:C E_:C S:C bar ...
		B_:C B_:C B_:C S:C bar ...
		E_:C S:C E_:C S:C bar ...
		E_:C E_:C E_:C S:C bar ...
		DynFF B_:C S:C B_:C S:C bar ...
		MARK291 ...
		E_:C E_:C E_:C S:C bar ...
		DynP E_:C S:C E_:C S:C bar ...
		E_:C E_:C E_:C S:C bar ...
		E_:C S:C E_:C S:C bar ...
		B_:C B_:C B_:C S:C bar ...
		E_:C S:C E_:C S:C bar ...
		E_:C E_:C E_:C S:C bar ...
		DynF B_:C S:C B_:C S:C bar ...
		E_:C E_:C E_:C S:C bar ...
		MARK300 ...
		];

%% PERCUSSIONS

PERCU = [ ...
		~MARK256 ...
		[ S:B bar ]*4 ...
		DynFF V:C S:C V:C S:C bar ...
		V:C S:C V:C S:C bar ...
		V:C S:C V:C S:C bar ...
		V:C V:C V:C S:C bar ...
		MARK264 ...
		V:C S:C V:C S:C bar ...
		V:C S:C V:C S:C bar ...
		V:C S:C V:C S:C bar ...
		V:C V:C V:C S:C bar ...
		DynF V:C S:C V:C S:C bar ...
		V:C S:C V:C S:C bar ...
		V:C S:C V:C S:C bar ...
		V:C V:C V:C S:C bar ...
		MARK272 ...
		V:C S:C V:C S:C bar ...
		V:C S:C V:C S:C bar ...
		V:C S:C V:C S:C bar ...
		V:C S:C S:N bar ...
		];

%% VIOLIN

NoteInit_fr

[ faBe, fa ] = deal( fa, faD );
[ doBe, do ] = deal( do, doD );
[ solBe, sol ] = deal( sol, solD );
[ reBe, re ] = deal( re, reD );

VIOLIN1 = [ ...
		~MARK243 DynPP ...
		S:N S:C ( -si:'.':S ).*[ D D ] bar ...
		( -si:'.':S ).*[ C D D C D D ] bar ...
		[ mi fa sol ].*( S:'.':C ) ( -si:'.':S ).*[ D D ] bar ...
		-si:'.':C -si:'.':D -si:'.':D mi:'.':C sol:'.':D sol:'.':D bar ...
		[ fa re -si ].*( S:'.':C ) -si:'.':D -si:'.':D bar ...
		( -si:'.':S ).*[ C D D C D D ] bar ...
		[ mi fa sol ].*( S:'.':C ) DynFF mi:D sol:D bar ...
		MARK250 ...
		si:N ~si:D la:D sol:D fa:D bar ...
		mi:C sol:C mi:C DynPP -si:D -si:D bar ...
		-si:C -si:D -si:D -si:C -si:D -si:D bar ...
		mi:C fa:C sol:C -si:D -si:D bar ...
		-si:C -si:D -si:D mi:C sol:D sol:D bar ...
		fa:C re:C -si:C -si:D -si:D bar ...
		MARK256 ...
		-si.*[ C D D ]*2 bar ...
		mi:C fa:C sol:C DynFF mi:D sol:D bar ...
		si:N ~si:D la:D sol:D fa:D bar ...
		mi:C sol:C mi:C DynFF Note('+') sol:D sol:D bar ...
		sol.*[ C D D ]*2 bar ...
		[ sol +do sol +do ].*(S:'.':C) bar ...
		[ sol +do sol fa ].*(S:'.':C) bar ...
		[ mi re do ].*C sol:D sol:D bar ...
		MARK264 ...
		sol.*[ C D D ]*2 bar ...
		[ sol +do sol +do ].*C bar ...
		[ sol +do si laD ].*C bar ...
		[ si laD si ].*C sol:D sol:D bar ...
		sol.*[ C D D ]*2 bar ...
		[ sol +do sol +do ].*C bar ...
		[ sol +do sol fa ].*C bar ...
		[ mi re do ].*C sol:D sol:D bar ...
		MARK272 ...
		sol.*[ C D D ]*2 bar ...
		[ sol +do sol +do ].*C bar ...
		[ sol +do si laD ].*C bar ...
		DynF [ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		[ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		[ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		[ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		[ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		MARK280 ...
		[ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		[ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		[ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		si:C Note('+0') si.*D*2 si:C DynPP -si.*D*2 bar ...
		(-si:'.':S).*[ C D D ]*2 bar ...
		[ mi fa sol ].*(S:'.':C) -si.*D*2 bar ...
		MARK286 ...
		-si:'.':C -si:'.':D -si:'.':D mi:'.':C sol:'.':D sol:'.':D bar ...
		fa:'.':C re:'.':C -si:'.':C -si:'.':D -si:'.':D bar ...
		(-si:'.':S).*[ C D D ]*2 bar ...
		[mi fa sol ].*C DynFF mi:'.':D sol:'.':D bar ...
		si:N [ ~si la sol fa ].*D bar ...
		MARK291 ...
		mi:C sol:C mi:C DynPP -si:D -si:D bar ...
		-si.*[C D D C D D] bar ...
		mi:C fa:C sol:C -si.*D*2 bar ...
		-si.*[C D D] mi:C sol:D sol:D bar ...
		fa:C re:C -si:C -si.*D*2 bar ...
		-si.*[C D D C D D] bar ...
		mi:C fa:C sol:C DynFF mi:D sol:D bar ...
		si:N [ ~si la sol fa ].*D bar ...
		mi:C sol:C mi:C S:C bar ...
		MARK300 ...
		];

VIOLIN2 = [ ...
		~MARK243 DynPP Note( '-' ) ...
		S:N S:C ( sol:'.':S ).*[ D D ] bar ...
		( sol:'.':S ).*[ C D D C D D ] bar ...
		si.*C*3 sol.*D*2 bar ...
		sol.*[C D D ] si.*[C D D ] bar ...
		si.*C*3 sol.*D*2 bar ...
		sol.*[C D D ] si.*[C D D ] bar ...
		si.*C*3 DynFF +mi.*D*2 bar ...
		MARK250 ...
		+re.*[ C D D C D D ] bar ...
		+mi.*C*3 DynPP sol:D sol:D bar ...
		sol.*[ C D D ]*2 bar ...
		si.*C*3 sol.*D*2 bar ...
		[sol si].*[ C D D ] bar ...
		si.*C*3 sol.*D*2 bar ...
		MARK256 ...
		sol.*[ C D D ]*2 bar ...
		si.*C*3 DynFF Note('+0') mi:D mi:D bar ...
		re.*[ C D D ]*2 bar ...
		mi.*C*3 DynFF Note('+') mi.*[ D D ] bar ...
		mi.*[ C D D C D D ] bar ...
		[ mi do mi do ].*C bar ...
		[ mi do mi re ].*C bar ...
		[ do -sol -mi ].*C mi.*D*2 bar ...
		MARK264 ...
		mi.*[ C D D C D D ] bar ...
		[ mi do mi do ].*C bar ...
		[ mi do re do ].*C bar ...
		[ re mi re ].*C mi.*D*2 bar ...
		mi.*[ C D D C D D ] bar ...
		[ mi do mi do ].*C bar ...
		[ mi do mi do ].*C bar ...
		[ fa -fa -mi ].*C mi.*D*2 bar ...
		MARK272 ...
		mi.*[ C D D C D D ] bar ...
		[ mi do mi do ].*C bar ...
		[ mi do fa mi ].*C bar ...
		re:C S:C S:N bar ...
		[ S:B bar ]*3 ...
		DynPP Note('+0') [ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		MARK280 ...
		[ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		[ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		[ si laD +do laD si laD +do laD ].*(S:'.':D) bar ...
		si:C S:C S:C DynPP Note('-') sol.*D*2 bar ...
		(sol:'.':S).*[ C D D ]*2 bar ...
		( si:'.':C )*3 sol.*D*2 bar ...
		MARK286 ...
		[ sol:'.':S si:'.':S ].*[ C D D ] bar ...
		( si:'.':C )*3 ( sol:'.':D )*2 bar ...
		sol.*[ C D D ]*2 bar ...
		si.*C*3 DynFF Note('+0') mi.*D*2 bar ...
		re.*[ C D D ]*2 bar ...
		MARK291 ...
		mi.*C*3 DynPP -sol.*D*2 bar ...
		-sol.*[C D D C D D] bar ...
		-si.*C*3 -sol.*D*2 bar ...
		-sol.*[C D D] -si.*[C D D] bar ...
		-si.*[C C C] -sol.*D*2 bar ...
		-sol.*[C D D C D D] bar ...
		-si.*C*3 DynFF mi.*D*2 bar ...
		re.*[C D D C D D] bar ...
		mi.*C*3 S:C bar ...
		MARK300 ...
		];

%% VIOLA

NoteInit_fr

[ faBe, fa ] = deal( fa, faD );
[ doBe, do ] = deal( do, doD );
[ solBe, sol ] = deal( sol, solD );
[ reBe, re ] = deal( re, reD );

VIOLA = [ ...
		~MARK243 DynPP Note( '-' ) ...
		S:N S:C ( mi:'.':S ).*[ D D ] bar ...
		( mi:'.':S ).*[ C D D C D D ] bar ...
		(mi+sol).*C*3 mi.*D*2 bar ...
		mi.*[C D D ] (mi+sol).*[C D D ] bar ...
		(re+fa).*C*3 mi.*D*2 bar ...
		mi.*[C D D C D D ] bar ...
		(mi+sol).*C*3 DynFF (sol+si).*D*2 bar ...
		MARK250 ...
		(fa+la).*[ C D D C D D ] bar ...
		(sol+si).*C*3 DynPP mi.*D*2 bar ...
		mi .* [ C D D ]*2 bar ...
		(mi+sol).*C*3 mi.*D*2 bar ...
		[ mi mi+sol ] .* [ C D D ] bar ...
		(re+fa).*C*3 mi.*D*2 bar ...
		MARK256 ...
		mi.*[ C D D ]*2 bar ...
		(mi+sol).*C*3 DynFF (sol+si:D)*2 bar ...
		(fa+la).*[ C D D ]*2 bar ...
		(sol+si).*C*3 DynFF Note('+') (mi+sol).*D.*2 bar ...
		(mi+sol).*[C D D]*2 bar ...
		[ mi+sol do++do mi+sol do++do ].*C bar ...
		[ mi+sol do++do mi+sol re+fa ].*C bar ...
		[ do+mi la sol ].*C (mi+sol).*D*2 bar ...
		MARK264 ...
		(mi+sol).*[C D D]*2 bar ...
		[ mi+sol do++do mi+sol do++do ].*C bar ...
		[ mi+sol do++do fa +do ].*C bar ...
		[ fa solBe fa ].*C (mi+sol).*D*2 bar ...
		(mi+sol).*[C D D]*2 bar ...
		[ mi+sol do++do mi+sol do++do ].*C bar ...
		[ mi+sol do++do mi+sol re+fa ].*C bar ...
		[ do+mi la sol ].*C (mi+sol).*D*2 bar ...
		MARK272 ...
		(mi+sol).*[C D D]*2 bar ...
		[ mi+sol do++do mi+sol do++do ].*C bar ...
		[ mi+sol do++do re +do ].*C bar ...
		re:C S:C S:N bar ...
		~MARK280 [ S:B bar ]*3 ...
		S:N S:C DynPP Note('+0') mi.*D*2 bar ...
		(mi:'.':S) .* [ C D D ]*2 bar ...
		(mi+sol).*(S:'.':C)*3 (mi:'.':D)*2 bar ...
		MARK286 ...
		[ mi:'.':S mi+sol:'.':S ].*[ C D D ] bar ...
		( re+fa:'.':C )*3 ( mi:'.':D )*2 bar ...
		mi.*[ C D D ]*2 bar ...
		(mi+sol).*C*3 DynFF (sol+si).*D*2 bar ...
		(fa+la).*[ C D D ]*2 bar ...
		MARK291 ...
		(sol+si).*C*3 DynPP -la.*D*2 bar ...
		mi.*[C D D C D D] bar ...
		(mi+sol).*[C C C] mi.*D*2 bar ...
		mi.*[C D D] (mi+sol).*[C D D] bar ...
		(re+fa).*C*3 mi.*D*2 bar ...
		mi.*[C D D C D D] bar ...
		(mi+sol).*C*3 DynFF sol+si:D sol+si:D bar ...
		(fa+la).*[C D D C D D] bar ...
		sol+si.*C*3 S:C bar ...
		MARK300 ...
		];

%% VIOLONCELLO

NoteInit_fr

[ faBe, fa ] = deal( fa, faD );
[ doBe, do ] = deal( do, doD );
[ solBe, sol ] = deal( sol, solD );
[ reBe, re ] = deal( re, reD );

VIOLONCELLO = [ ...
		~MARK243 DynPP Note( '-' ) ...
		S:N S:C ( mi:'.':S ).*[ D D ] bar ...
		( mi:'.':S ).*[ C D D C D D ] bar ...
		mi.*C*3 mi.*D*2 bar ...
		mi.*[C D D ] mi.*[C D D ] bar ...
		-si.*C*3 mi.*D*2 bar ...
		mi.*[C D D C D D ] bar ...
		mi.*C*3 DynFF mi.*D*2 bar ...
		MARK250 ...
		-si.*[ C D D ]*2 bar ...
		mi.*[ C*3 DynPP D*2 bar C D D C D D bar C C C D D bar C D D C D D ] bar ...
		-si.*C*3 mi.*D*2 bar ...
		MARK256 ...
		mi.*[ C D D C D D bar ...
		C C C DynFF D D ] bar ...
		-si.*[ C D D ]*2 bar ...
		[ mi mi mi S ].*C bar ...
		DynFF [ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S sol -sol ].*C bar ...
		[ do do do S ].*C bar ...
		MARK264 ...
		[ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S fa -fa ].*C bar ...
		[ si si si S ].*C bar ...
		DynF [ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S sol -sol ].*C bar ...
		[ do do do S ].*C bar ...
		MARK272 ...
		[ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S fa -fa ].*C bar ...
		-si:C S:C S:N bar ...
		S:B bar ...
		DynPP [ S -si do re ].*(S:'.':C) bar ...
		[ mi fa sol la ].*(S:'.':C) bar ...
		[ si -si si S ].*(S:'.':C) bar ...
		MARK280 ...
		S:B bar ...
		[ S -si do re ].*C bar ...
		[ mi fa sol la ].*C bar ...
		si:C S:C S:C DynPP mi.*D*2 bar ...
		(mi:'.':S).*[ C D D ]*2 bar ...
		mi.*(S:'.':C)*3 (mi:'.':D)*2 bar ...
		MARK286 ...
		(mi:'.':S).*[ C D D ]*2 bar ...
		( -si:'.':C )*3 ( mi:'.':D )*2 bar ...
		mi.*[ C D D ]*2 bar ...
		mi.*C*3 DynFF mi.*D*2 bar ...
		-si.*[ C D D ]*2 bar ...
		MARK291 ...
		mi.*C*3 DynPP mi.*D*2 bar ...
		mi.*[C D D]*2 bar ...
		mi.*C*3 mi.*D*2 bar ...
		mi.*[C D D]*2 bar ...
		-si.*C*3 mi.*D*2 bar ...
		mi.*[C D D]*2 bar ...
		mi.*C*3 DynFF mi.*D*2 bar ...
		-si.*[C D D]*2 bar ...
		mi.*C*3 S:C ...
		MARK300 ...
		];

%% CONTRABASS

NoteInit_fr

[ faBe, fa ] = deal( fa, faD );
[ doBe, do ] = deal( do, doD );
[ solBe, sol ] = deal( sol, solD );
[ reBe, re ] = deal( re, reD );

CONTRABASS = [ ...
		~MARK243 DynPP Note( '-' ) ...
		S:N S:C ( mi:'.':S ).*[ D D ] bar ...
		( mi:'.':S ).*[ C D D C D D ] bar ...
		mi.*C*3 mi.*D*2 bar ...
		mi.*[C D D ] mi.*[C D D ] bar ...
		-si.*C*3 mi.*D*2 bar ...
		mi.*[C D D C D D ] bar ...
		mi.*C*3 DynFF mi.*D*2 bar ...
		MARK250 ...
		-si.*[ C D D ]*2 bar ...
		mi.*[ C*3 DynPP D*2 bar C D D C D D bar C C C D D bar C D D C D D ] bar ...
		-si.*C*3 mi.*D*2 bar ...
		MARK256 ...
		mi.*[ C D D C D D bar ...
		C C C DynFF D D ] bar ...
		-si.*[ C D D ]*2 bar ...
		[ mi mi mi S ].*C bar ...
		DynFF [ do S do S bar ...
		do S do S ].*C bar ...
		[ do S sol -sol ].*C bar ...
		[ do do do S ].*C bar ...
		MARK264 ...
		[ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S fa -fa ].*C bar ...
		[ si si si S ].*C bar ...
		DynF [ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S sol -sol ].*C bar ...
		[ do do do S ].*C bar ...
		MARK272 ...
		[ do S do S ].*C bar ...
		[ do S do S ].*C bar ...
		[ do S fa -fa ].*C bar ...
		-si:C S:C S:N bar ...
		~MARK280 [ S:B bar ]*3 ...
		S:N S:C DynPP mi.*D*2 bar ...
		(mi:'.':S).*[ C D D ]*2 bar ...
		mi.*(S:'.':C)*3 (mi:'.':D)*2 bar ...
		MARK286 ...
		(mi:'.':S).*[ C D D ]*2 bar ...
		( -si:'.':C )*3 ( mi:'.':D )*2 bar ...
		mi.*[ C D D ]*2 bar ...
		mi.*C*3 DynFF mi.*D*2 bar ...
		-si.*[ C D D ]*2 bar ...
		MARK291 ...
		mi.*C*3 DynPP mi.*D*2 bar ...
		mi.*[C D D]*2 bar ...
		mi.*C*3 mi.*D*2 bar ...
		mi.*[C D D]*2 bar ...
		-si.*C*3 mi.*D*2 bar ...
		mi.*[C D D]*2 bar ...
		mi.*C*3 DynFF mi.*D*2 bar ...
		-si.*[C D D]*2 bar ...
		mi.*C*3 S:C ...
		MARK300 ...
		];

%% CACOFONIX

cacofonix( 'WilliamTellOverture.mid', 'Tempo', 152, 'Velocity', linspace( 50, 126, 8 ), ...
		MAIN, ...
		'Piccolo', PICCOLO, ...
		'Flute', FLUTE, ...
		'Oboe', OBOES, ...
		'Clarinet', CLARINETS^[-2 0], ...
		'Bassoon', BASSOON, ...
		'English Horn', HORNS12^[4 0] / HORNS34^[2 0], ...
		'Trumpet', TRUMPET^[2 0], ...
		'Trombone', TROMBONE12 / TROMBONE3, ...
		'Timpani', TIMPANI, ...
		'Open Triangle', PERCU, ...
		'Crash Cymbal 1', PERCU, ...
		'Acoustic Bass Drum', PERCU, ...
		'Violin', VIOLIN1 / VIOLIN2, ...
		'Viola', VIOLA, ...
		'Cello', VIOLONCELLO );

