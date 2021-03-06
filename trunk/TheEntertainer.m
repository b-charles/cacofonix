
%
% The Entertainer
%
% Compositor: Scott Joplin
%

%#ok<*BDSCA>
clc

NoteInit_fr

MARK_A = Note( 'Marker', 'A' );
MARK_A2= Note( 'Marker', 'A''' );
MARK_B = Note( 'Marker', 'B' );
MARK_B2= Note( 'Marker', 'B''' );
MARK_A3= Note( 'Marker', 'A''''' );
MARK_C = Note( 'Marker', 'C' );
MARK_C2= Note( 'Marker', 'C''' );
MARK_B3= Note( 'Marker', 'B''''' );
MARK_D = Note( 'Marker', 'D' );
MARK_D2= Note( 'Marker', 'D''' );

DecrescC = Note( 'Decresc', C, 'p' );
CrescC = Note( 'Cresc', C, 'f' );
DecrescN = Note( 'Decresc', N, 'p' );
CrescN = Note( 'Cresc', N, 'f' );
CrescB = Note( 'Cresc', B, 'f' );

PIANOMD = [ Note( 'Tempo', 90 ) Note('+') ...
	DynF +re:D +mi:D +do:D la:C si:D sol:C bar ...
	re:D mi:D do:D -la:C -si:D -sol:C bar ...
	-re:D -mi:D -do:D --la:C --si:D --la:D --laB:D bar ...
	--sol:C S:C -sol+-si+re+sol:'^':C DecrescC ~[ -re:D -reD:D ] bar ...
	MARK_A -mi:D do:C -mi:D do:C -mi:D do:D bar ...
	~do:N CrescN ~do:D do+mi++do:D re+fa++re:D reD+faD++reD:D bar ...
	mi+sol++mi:D do+mi++do:D re+fa++re:D mi+sol++mi:C -si+re+si:D re+fa++re:C bar ...
	do+mi++do:N DecrescN ~do+mi++do:C ~[ -re:D -reD:D ] bar ...
	-mi:D do:C -mi:D do:C -mi:D do:D bar ...
	~do:N CrescN ~do:C -la+do+la:D -sol+do+sol:D bar ...
	-faD+do+faD:D -la+la:D do++do:D mi++mi:C re++re:D do++do:D -la+la:D bar ...
	re+fa++re:N DecrescN ~re+fa++re:C ~[ -re:D -reD:D ] bar ...
	-mi:D do:C -mi:D do:C -mi:D do:D bar ...
	~do:N CrescN ~do:D do+mi++do:D re+fa++re:D reD+faD++reD:D bar ...
	mi+sol++mi:D do+mi++do:D re+fa++re:D mi+sol++mi:C -si+re+si:D re+fa++re:C bar ...
	do+mi++do:N ~do+mi++do:C do++do:D re++re:D bar ...
	mi++mi:D do++do:D re++re:D mi++mi:C do++do:D re++re:D do++do:D bar ...
	mi++mi:D do++do:D re++re:D mi++mi:C do++do:D re++re:D do++do:D bar ...
	mi+sol++mi:D do+mi++do:D re+fa++re:D mi+sol++mi:C -si+re+si:D re+fa++re:C bar ...
	do+mi++do:N DecrescN ~do+mi++do:C ~[ -re:D -reD:D ] bar ...
	MARK_A2 -mi:D do:C -mi:D do:C -mi:D do:D bar ...
	~do:N CrescN ~do:D do+mi++do:D re+fa++re:D reD+faD++reD:D bar ...
	mi+sol++mi:D do+mi++do:D re+fa++re:D mi+sol++mi:C -si+re+si:D re+fa++re:C bar ...
	do+mi++do:N DecrescN ~do+mi++do:C ~[ -re:D -reD:D ] bar ...
	-mi:D do:C -mi:D do:C -mi:D do:D bar ...
	~do:N CrescN ~do:C -la+do+la:D -sol+do+sol:D bar ...
	-faD+do+faD:D -la+la:D do++do:D mi++mi:C re++re:D do++do:D -la+la:D bar ...
	re+fa++re:N DecrescN ~re+fa++re:C ~[ -re:D -reD:D ] bar ...
	-mi:D do:C -mi:D do:C -mi:D do:D bar ...
	~do:N CrescN ~do:D do+mi++do:D re+fa++re:D reD+faD++reD:D bar ...
	mi+sol++mi:D do+mi++do:D re+fa++re:D mi+sol++mi:C -si+re+si:D re+fa++re:C bar ...
	do+mi++do:N ~do+mi++do:C do++do:D re++re:D bar ...
	mi++mi:D do++do:D re++re:D mi++mi:C do++do:D re++re:D do++do:D bar ...
	mi++mi:D do++do:D re++re:D mi++mi:C do++do:D re++re:D do++do:D bar ...
	mi+sol++mi:D do+mi++do:D re+fa++re:D mi+sol++mi:C -si+re+si:D re+fa++re:C bar ...
	do+mi++do:N ~do+mi++do:D -mi+do+mi:D -fa+re+fa:D -faD+reD+faD:D bar ...
	MARK_B -sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C -mi+do+mi:D -fa+re+fa:D -faD+reD+faD:D bar ...
	-sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C mi:D do:D -sol:D bar ...
	-la:D -si:D do:D re:D mi:D re:D do:D re:D bar ...
	-sol:D mi:D fa:D sol:D la:D sol:D mi:D fa:D bar ...
	-sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C -mi+do+mi:D -fa+re+fa:D -faD+reD+faD:D bar ...
	-sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C sol:D la:D laD:D bar ...
	re+sol+si:D re+sol+si:C do+faD+si:C la:D do+faD:D re:D bar ...
	-si+sol:N ~-si+sol:D -mi+do+mi:D -fa+re+fa:D -faD+reD+faD:D bar ...
	-sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C -mi+do+mi:D -fa+re+fa:D -faD+reD+faD:D bar ...
	-sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C mi:D do:D -sol:D bar ...
	-la:D -si:D do:D re:D mi:D re:D do:D re:D bar ...
	do:N DecrescN ~do:D -sol:D -faD:D -sol:D bar ...
	do:C -la:D do:C -la:D do:D -la:D bar ...
	CrescB -sol:D do:D mi:D sol:C mi:D do:D -sol:D bar ...
	-faD+-la:C -faD+do:C -fa+mi:D -fa+re:C -mi+do:D bar ...
	~-mi+do:N ~-mi+do:D Note('++') -mi+do+mi:D -fa+re+fa:D -faD+reD+faD:D bar ...
	MARK_B2 -sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C -mi+do+mi:D -fa+re+fa:D -faD+reD+faD:D bar ...
	-sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C mi:D do:D -sol:D bar ...
	-la:D -si:D do:D re:D mi:D re:D do:D re:D bar ...
	-sol:D mi:D fa:D sol:D la:D sol:D mi:D fa:D bar ...
	-sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C -mi+do+mi:D -fa+re+fa:D -faD+reD+faD:D bar ...
	-sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C sol:D la:D laD:D bar ...
	re+sol+si:D re+sol+si:C do+faD+si:C la:D do+faD:D re:D bar ...
	-si+sol:N ~-si+sol:D -mi+do+mi:D -fa+re+fa:D -faD+reD+faD:D bar ...
	-sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C -mi+do+mi:D -fa+re+fa:D -faD+reD+faD:D bar ...
	-sol+mi+sol:C -la+mi+la:D -sol+mi+sol:C mi:D do:D -sol:D bar ...
	-la:D -si:D do:D re:D mi:D re:D do:D re:D bar ...
	do:N ~do:D -sol:D -faD:D -sol:D bar ...
	do:C -la:D do:C -la:D do:D -la:D bar ...
	-sol:D do:D mi:D sol:C mi:D do:D -sol:D bar ...
	-faD+-la:C -faD+do:C -fa+mi:D -fa+re:C -mi+do:D bar ...
	~-mi+do:N DecrescN ~-mi+do:C Note('+') ~[ -re:D -reD:D ] bar ...
	MARK_A3 -mi:D do:C -mi:D do:C -mi:D do:D bar ...
	~do:N CrescN ~do:D do+mi++do:D re+fa++re:D reD+faD++reD:D bar ...
	mi+sol++mi:D do+mi++do:D re+fa++re:D mi+sol++mi:C -si+re+si:D re+fa++re:C bar ...
	do+mi++do:N DecrescN ~do+mi++do:C ~[ -re:D -reD:D ] bar ...
	-mi:D do:C -mi:D do:C -mi:D do:D bar ...
	~do:N CrescN ~do:C -la+do+la:D -sol+do+sol:D bar ...
	-faD+do+faD:D -la+la:D do++do:D mi++mi:C re++re:D do++do:D -la+la:D bar ...
	re+fa++re:N DecrescN ~re+fa++re:C ~[ -re:D -reD:D ] bar ...
	-mi:D do:C -mi:D do:C -mi:D do:D bar ...
	~do:N CrescN ~do:D do+mi++do:D re+fa++re:D reD+faD++reD:D bar ...
	mi+sol++mi:D do+mi++do:D re+fa++re:D mi+sol++mi:C -si+re+si:D re+fa++re:C bar ...
	do+mi++do:N ~do+mi++do:C do++do:D re++re:D bar ...
	mi++mi:D do++do:D re++re:D mi++mi:C do++do:D re++re:D do++do:D bar ...
	mi++mi:D do++do:D re++re:D mi++mi:C do++do:D re++re:D do++do:D bar ...
	mi+sol++mi:D do+mi++do:D re+fa++re:D mi+sol++mi:C -si+re+si:D re+fa++re:C bar ...
	do+mi++do:N do+mi++do:C S:C bar ...
	MARK_C fa+la:D solD:D fa+la:N fa+la++do:C bar ...
	[ S:C -siB:D -la:D -siB:D do:D re:C ] / (fa+siB++re:B) bar ...
	re+fa:D mi:D re+fa:N re+fa+la:C bar ...
	[ re+sol+siB:N ~re+sol+siB:C' sol:D ] / [ S:C -sol:D -faD:D -sol:D -la:D -siB:C ] bar ...
	re:C sol:D re:C sol:D re:C bar ...
	do:N fa:N bar ...
	mi:D solD:D si:D +mi:C +re:D si:D +do:D bar ...
	la:N siB:N bar ...
	fa+la:D solD:D fa+la:N fa+la++do:C bar ...
	[ S:C -siB:D -la:D -siB:D do:D re:C ] / (fa+siB++re:B) bar ...
	re+fa:D mi:D re+fa:N re+fa+la:C bar ...
	[ re+sol+siB:N ~re+sol+siB:C' sol:D ] / [ S:C -sol:D -faD:D -sol:D -la:D -siB:C ] bar ...
	re:C sol:D re:C sol:D re:C bar ...
	Note( 'Cresc', N, 'ff' ) do:N Note( 'Decresc', N, 'f' ) -solD+-si+fa:C' fa:D bar ...
	-la+do+la:D do++do:C [ -siB:C' -siB:C ] / [ sol:C do:D re:D mi:D ] bar ...
	-la+fa:C ~[ -si:D do:D re:D mi:D fa:D sol:D ] bar ...
	MARK_C2 fa+la:D solD:D fa+la:N fa+la++do:C bar ...
	[ S:C -siB:D -la:D -siB:D do:D re:C ] / (fa+siB++re:B) bar ...
	re+fa:D mi:D re+fa:N re+fa+la:C bar ...
	[ re+sol+siB:N ~re+sol+siB:C' sol:D ] / [ S:C -sol:D -faD:D -sol:D -la:D -siB:C ] bar ...
	re:C sol:D re:C sol:D re:C bar ...
	do:N fa:N bar ...
	mi:D solD:D si:D +mi:C +re:D si:D +do:D bar ...
	la:N siB:N bar ...
	fa+la:D solD:D fa+la:N fa+la++do:C bar ...
	[ S:C -siB:D -la:D -siB:D do:D re:C ] / (fa+siB++re:B) bar ...
	re+fa:D mi:D re+fa:N re+fa+la:C bar ...
	[ re+sol+siB:N ~re+sol+siB:C' sol:D ] / [ S:C -sol:D -faD:D -sol:D -la:D -siB:C ] bar ...
	re:C sol:D re:C sol:D re:C bar ...
	Note( 'Cresc', N, 'ff' ) do:N Note( 'Decresc', N, 'f' ) -solD+-si+fa:C' fa:D bar ...
	-la+do+la:D do++do:C [ -siB:C' -siB:C ] / [ sol:C do:D re:D mi:D ] bar ...
	-la+fa:C S:C fa+la++do++fa:C S:C bar ...
	MARK_B3 do:C -la:D do:C -la:D do:D -la:D bar ...
	-sol:D do:D mi:D sol:C mi:D do:D -sol:D bar ...
	-faD+-la:C do+faD:C -fa+mi:D -fa+re:C -mi+do:D bar ...
	~-mi+do:N do+mi+sol++do:C S:C bar ...
	MARK_D -re+-fa:C -doD+-mi:D -re+-fa:C -doD+-mi:D -re+-fa:C bar ...
	S:D -la:D -fa+re:D -la:D do:D re:D do:D -la:D bar ...
	-mi+-sol:C -reD+-faD:D -mi+-sol:C -reD+-faD:D -mi+-sol:C bar ...
	S:D do:D -sol+mi:D do:D re:D mi:D re:D do:D bar ...
	-si+re:C -laD+doD:D -si+re:C -laD+doD:D -si+re:C bar ...
	S:D fa:D -si+la:D fa:D sol:D la:D sol:D fa:D bar ...
	do++do:D do++do:D do++do:N do+la:C bar ...
	do+sol:C -mi+-sol:D -mi+-sol:D -mi+-sol:C -mi+-sol:C bar ...
	-re+-fa:C -doD+-mi:D -re+-fa:C -doD+-mi:D -re+-fa:C bar ...
	S:D -la:D -fa+re:D -la:D do:D re:D do:D -la:D bar ...
	-mi+-sol:C -reD+-faD:D -mi+-sol:C -reD+-faD:D -mi+-sol:C bar ...
	S:D do:D -sol+mi:D do:D re:D mi:D re:D do:D bar ...
	-la:D -solD:D -la:D -la+sol:C -la+fa:C -la+do:D bar ...
	-sol+mi:D reD:D mi:D la:C +do:D sol:D mi:D bar ...
	-faD+do:C -faD+do:C -fa+-si+mi:D -fa+-si+re:C -mi+-sol+do:D bar ...
	~-mi+-sol+do:C -mi+-sol:D -mi+-sol:D -mi+-sol:C -mi+-sol:C bar ...
	MARK_D2 -re+-fa:C -doD+-mi:D -re+-fa:C -doD+-mi:D -re+-fa:C bar ...
	S:D -la:D -fa+re:D -la:D do:D re:D do:D -la:D bar ...
	-mi+-sol:C -reD+-faD:D -mi+-sol:C -reD+-faD:D -mi+-sol:C bar ...
	S:D do:D -sol+mi:D do:D re:D mi:D re:D do:D bar ...
	-si+re:C -laD+doD:D -si+re:C -laD+doD:D -si+re:C bar ...
	S:D fa:D -si+la:D fa:D sol:D la:D sol:D fa:D bar ...
	do++do:D do++do:D do++do:N do+la:C bar ...
	do+sol:C -mi+-sol:D -mi+-sol:D -mi+-sol:C -mi+-sol:C bar ...
	-re+-fa:C -doD+-mi:D -re+-fa:C -doD+-mi:D -re+-fa:C bar ...
	S:D -la:D -fa+re:D -la:D do:D re:D do:D -la:D bar ...
	-mi+-sol:C -reD+-faD:D -mi+-sol:C -reD+-faD:D -mi+-sol:C bar ...
	S:D do:D -sol+mi:D do:D re:D mi:D re:D do:D bar ...
	-la:D -solD:D -la:D -la+sol:C -la+fa:C -la+do:D bar ...
	-sol+mi:D reD:D mi:D la:C +do:D sol:D mi:D bar ...
	-faD+do:C -faD+do:C -fa+-si+mi:D -fa+-si+re:C -mi+-sol+do:D bar ...
	~-mi+-sol+do:N do+mi+sol++do:C S:C bar ...
	];

PIANOMG = [ Note('-') ...
	DynF ++re:D ++mi:D ++do:D +la:C +si:D +sol:C bar ...
	+re:D +mi:D +do:D la:C si:D sol:C bar ...
	re:D mi:D do:D -la:C -si:D -la:D -laB:D bar ...
	-sol:C S:C --sol+-sol:'^':C DecrescC sol+si:C bar ...
	MARK_A do:C mi+sol++do:C -sol+sol:C sol+siB++do:C bar ...
	-fa+fa:C la++do:C CrescN -mi+mi:C sol++do:C bar ...
	-sol:C mi+sol++do:C -sol:C fa+sol+si:C bar ...
	do:C mi+sol++do:C DecrescN mi+sol++do:C sol+si:C bar ...
	do:C mi+sol++do:C -sol+sol:C sol+siB++do:C bar ...
	-fa+fa:C la++do:C CrescN -mi+mi:C -miB+miB:C bar ...
	-re+re:C re+faD+la++do:C re:C faD+la++do:C bar ...
	sol+si:C -sol+sol:C DecrescN -la+la:C -si+si:C bar ...
	do:C mi+sol++do:C -sol+sol:C sol+siB++do:C bar ...
	-fa+fa:C la++do:C CrescN -mi+mi:C sol++do:C bar ...
	-sol:C mi+sol++do:C -sol:C fa+sol+si:C bar ...
	do:C mi+sol++do:C sol++do++mi:C S:C bar ...
	do++do:C sol++do++mi:C -siB+siB:C sol++do++mi:C bar ...
	-la+la:C la++do++fa:C -laB+laB:C laB++do++fa:C bar ...
	-sol+sol:C sol++do++mi:C -sol:C sol+si:C bar ...
	do+sol++do:C -sol+sol:C DecrescN -la+la:C -si+si:C bar ...
	MARK_A2 do:C mi+sol++do:C -sol+sol:C sol+siB++do:C bar ...
	-fa+fa:C la++do:C CrescN -mi+mi:C sol++do:C bar ...
	-sol:C mi+sol++do:C -sol:C fa+sol+si:C bar ...
	do:C mi+sol++do:C DecrescN mi+sol++do:C sol+si:C bar ...
	do:C mi+sol++do:C -sol+sol:C sol+siB++do:C bar ...
	-fa+fa:C la++do:C CrescN -mi+mi:C -miB+miB:C bar ...
	-re+re:C re+faD+la++do:C re:C faD+la++do:C bar ...
	sol+si:C -sol+sol:C DecrescN -la+la:C -si+si:C bar ...
	do:C mi+sol++do:C -sol+sol:C sol+siB++do:C bar ...
	-fa+fa:C la++do:C CrescN -mi+mi:C sol++do:C bar ...
	-sol:C mi+sol++do:C -sol:C fa+sol+si:C bar ...
	do:C mi+sol++do:C sol++do++mi:C S:C bar ...
	do++do:C sol++do++mi:C -siB+siB:C sol++do++mi:C bar ...
	-la+la:C la++do++fa:C -laB+laB:C laB++do++fa:C bar ...
	-sol+sol:C sol++do++mi:C -sol:C sol+si:C bar ...
	do+sol++do:C -sol+sol:C -la+la:C S:C bar ...
	MARK_B -do+do:C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	do:C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	-fa:C la++do++fa:C fa:C laB++do++fa:C bar ...
	mi:C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	do:C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	do:C sol++do++mi:C mi:C miB:C bar ...
	re:C sol+si++re:C re:C la++do++re:C bar ...
	sol+si++re:C -fa+fa:'^':C -mi+mi:'^':C -re+re:'^':C bar ...
	-do+do:'^':C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	do:C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	-fa:C la++do++fa:C fa:C laB++do++fa:C bar ...
	mi:C sol++do++mi:C DecrescN do:C siB++do++mi:C bar ...
	fa+la++do++fa:C fa+la++do++fa:C faD+la++do++reD:C faD+la++do++reD:C bar ...
	CrescB sol++do++mi:C sol++do++mi:C sol++do++mi:C sol++do++mi:C bar ...
	re++do:C re+la:C sol+si:C sol+si:C bar ...
	do++do:C -sol+sol:'^':C -mi+mi:'^':C -re+re:'^':C bar ...
	MARK_B2 -do+do:C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	do:C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	-fa:C la++do++fa:C fa:C laB++do++fa:C bar ...
	mi:C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	do:C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	do:C sol++do++mi:C mi:C miB:C bar ...
	re:C sol+si++re:C re:C la++do++re:C bar ...
	sol+si++re:C -fa+fa:'^':C -mi+mi:'^':C -re+re:'^':C bar ...
	-do+do:'^':C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	do:C sol++do++mi:C -sol:C sol++do++mi:C bar ...
	-fa:C la++do++fa:C fa:C laB++do++fa:C bar ...
	mi:C sol++do++mi:C do:C siB++do++mi:C bar ...
	fa+la++do++fa:C fa+la++do++fa:C faD+la++do++reD:C faD+la++do++reD:C bar ...
	sol++do++mi:C sol++do++mi:C sol++do++mi:C sol++do++mi:C bar ...
	re++do:C re+la:C sol+si:C sol+si:C bar ...
	do++do:C -sol+sol:C DecrescN -do+do:C S:C bar ...
	MARK_A3 do:C mi+sol++do:C -sol+sol:C sol+siB++do:C bar ...
	-fa+fa:C la++do:C CrescN -mi+mi:C sol++do:C bar ...
	-sol:C mi+sol++do:C -sol:C fa+sol+si:C bar ...
	do:C mi+sol++do:C DecrescN mi+sol++do:C sol+si:C bar ...
	do:C mi+sol++do:C -sol+sol:C sol+siB++do:C bar ...
	-fa+fa:C la++do:C CrescN -mi+mi:C -miB+miB:C bar ...
	-re+re:C re+faD+la++do:C re:C faD+la++do:C bar ...
	sol+si:C -sol+sol:C DecrescN -la+la:C -si+si:C bar ...
	do:C mi+sol++do:C -sol+sol:C sol+siB++do:C bar ...
	-fa+fa:C la++do:C CrescN -mi+mi:C sol++do:C bar ...
	-sol:C mi+sol++do:C -sol:C fa+sol+si:C bar ...
	do:C mi+sol++do:C sol++do++mi:C S:C bar ...
	do++do:C sol++do++mi:C -siB+siB:C sol++do++mi:C bar ...
	-la+la:C la++do++fa:C -laB+laB:C laB++do++fa:C bar ...
	-sol+sol:C sol++do++mi:C -sol:C sol+si:C bar ...
	do+sol++do:C -sol+sol:C -do+do:C S:C bar ...
	MARK_C -fa:C la++do++fa:C do:C la++do++fa:C bar ...
	-siB:C siB++re++fa:C fa:C siB++re++fa:C bar ...
	-re:C la++re++fa:C -la:C la++re++fa:C bar ...
	-sol:C siB++re:C re:C siB++re:C bar ...
	-siB+siB:C siB++re:C -sol+sol:C -solD+solD:C bar ...
	-la+la:C la++do++fa:C re:C la++re++fa:C bar ...
	mi:C si++re++mi:C solD:C si++re++mi:C bar ...
	la++do++mi:N (sol++do++mi:N) / [ S:C do:C ] bar ...
	-fa:C la++do++fa:C do:C la++do++fa:C bar ...
	-siB:C siB++re++fa:C fa:C siB++re++fa:C bar ...
	-re:C la++re++fa:C -la:C la++re++fa:C bar ...
	-sol:C siB++re:C re:C siB++re:C bar ...
	-siB+siB:C siB++re:C -sol+sol:C -solD+solD:C bar ...
	Note( 'Cresc', N, 'ff' ) -la+la:D -fa+fa:D -mi+mi:D -re+re:D Note( 'Decresc', N, 'f' ) -reB+reB:N bar ...
	-do+do:C la++do++fa:C do++do:C -do+do:C bar ...
	-fa+fa:C S:C S:N bar ...
	MARK_C2 -fa:C la++do++fa:C do:C la++do++fa:C bar ...
	-siB:C siB++re++fa:C fa:C siB++re++fa:C bar ...
	-re:C la++re++fa:C -la:C la++re++fa:C bar ...
	-sol:C siB++re:C re:C siB++re:C bar ...
	-siB+siB:C siB++re:C -sol+sol:C -solD+solD:C bar ...
	-la+la:C la++do++fa:C re:C la++re++fa:C bar ...
	mi:C si++re++mi:C solD:C si++re++mi:C bar ...
	la++do++mi:N (sol++do++mi:N) / [ S:C do:C ] bar ...
	-fa:C la++do++fa:C do:C la++do++fa:C bar ...
	-siB:C siB++re++fa:C fa:C siB++re++fa:C bar ...
	-re:C la++re++fa:C -la:C la++re++fa:C bar ...
	-sol:C siB++re:C re:C siB++re:C bar ...
	-siB+siB:C siB++re:C -sol+sol:C -solD+solD:C bar ...
	Note( 'Cresc', N, 'ff' ) -la+la:D -fa+fa:D -mi+mi:D -re+re:D Note( 'Decresc', N, 'f' ) -reB+reB:N bar ...
	-do+do:C la++do++fa:C do++do:C -do+do:C bar ...
	-fa+fa:C S:C --fa+-fa:C S:C bar ...
	MARK_B3 fa+la++do++fa:C fa+la++do++fa:C faD+la++do++reD:C faD+la++do++reD:C bar ...
	sol++do++mi:C sol++do++mi:C sol++do++mi:C sol++do++mi:C bar ...
	re++do:C re+la:C sol+si:C sol+si:C bar ...
	do++do:N -do+do:C S:C bar ...
	MARK_D -fa:C fa+la:C -la:C fa+la:C bar ...
	-fa:C fa+la:C -la:C fa+la:C bar ...
	do:C mi+sol++do:C -sol:C mi+sol++do:C bar ...
	do:C mi+sol++do:C -sol:C mi+sol++do:C bar ...
	-sol:C fa+sol+si:C -si:C fa+sol+si:C bar ...
	-sol:C fa+sol+si:C re:C fa+sol+si:C bar ...
	reD+faD++do:C reD+faD++do:N reD+faD++do:C bar ...
	mi+sol++do:C S:C S:N bar ...
	-fa:C fa+la:C -la:C fa+la:C bar ...
	-fa:C fa+la:C -la:C fa+la:C bar ...
	do:C mi+sol++do:C -sol:C mi+sol++do:C bar ...
	do:C mi+sol++do:C -sol:C mi+sol++do:C bar ...
	-fa+fa:C -re+re:C -mi+mi:C -fa+fa:C bar ...
	-sol+sol:C sol++do++mi:C faD++do++reD:C sol++do++mi:C bar ...
	-la+la:C -re+re:C -sol+sol:C -si+si:C bar ...
	do++do:C S:C S:N bar ...
	MARK_D2 -fa:C fa+la:C -la:C fa+la:C bar ...
	-fa:C fa+la:C -la:C fa+la:C bar ...
	do:C mi+sol++do:C -sol:C mi+sol++do:C bar ...
	do:C mi+sol++do:C -sol:C mi+sol++do:C bar ...
	-sol:C fa+sol+si:C -si:C fa+sol+si:C bar ...
	-sol:C fa+sol+si:C re:C fa+sol+si:C bar ...
	reD+faD++do:C reD+faD++do:N reD+faD++do:C bar ...
	mi+sol++do:C S:C S:N bar ...
	-fa:C fa+la:C -la:C fa+la:C bar ...
	-fa:C fa+la:C -la:C fa+la:C bar ...
	do:C mi+sol++do:C -sol:C mi+sol++do:C bar ...
	do:C mi+sol++do:C -sol:C mi+sol++do:C bar ...
	-fa+fa:C -re+re:C -mi+mi:C -fa+fa:C bar ...
	-sol+sol:C sol++do++mi:C faD++do++reD:C sol++do++mi:C bar ...
	-la+la:C -re+re:C -sol+sol:C -si+si:C bar ...
	do++do:C -sol+sol:C -do+do:C S:C bar ...
	];

%cacofonix( 'TheEntertainer', 'Velocity', linspace( 50, 100, 8 ), PIANOMD / PIANOMG );

% faster end
cacofonix( 'TheEntertainer', 'Velocity', linspace( 50, 100, 8 ), ...
	[ PIANOMD|MARK_D2 Note('accel', B*16, 130 ) MARK_D|PIANOMD ], [ PIANOMG|MARK_D2 MARK_D|PIANOMG ] );

