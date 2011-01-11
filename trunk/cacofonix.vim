
let mapleader="c"

let OctaveMap = {
			\ '!': '+',
			\ 'm': '-' }
let NoteTonalityMap = {
			\ 'a': 'doB',
			\ 'q': 'do',
			\ 'w': 'doD',
			\ 'z': 'reB',
			\ 's': 're',
			\ 'x': 'reD',
			\ 'e': 'miB',
			\ 'd': 'mi',
			\ 'c': 'miD',
			\ 'r': 'faB',
			\ 'f': 'fa',
			\ 'v': 'faD',
			\ 't': 'solB',
			\ 'g': 'sol',
			\ 'b': 'solD',
			\ 'y': 'laB',
			\ 'h': 'la',
			\ 'n': 'laD',
			\ 'u': 'siB',
			\ 'j': 'si',
			\ ',': 'siD',
			\ '<C-q>': 'doN',
			\ '<C-s>': 'reN',
			\ '<C-d>': 'miN',
			\ '<C-f>': 'faN',
			\ '<C-g>': 'solN',
			\ '<C-h>': 'laN',
			\ '<C-j>': 'siN',
			\ 'k': 'S',
			\ ';': 'V' }
let NoteDurationMap = {
			\ '<F5>': 'R',
			\ '<F6>': 'B',
			\ '<F7>': 'N',
			\ '<F8>': 'C',
			\ '<F9>': 'D',
			\ '<F10>': 'T',
			\ '<F11>': 'Q' }
let AccentMap = {
			\ '.': '.',
			\ '>': '>',
			\ '-': '-',
			\ '^': '^',
			\ } "\ '|': '|' }

let DotMap = "'"
let LinkedMap = "é"
let VisualLinkedMap = "<F4>"
let GetPreviousMap = "*"

let NormalInsertMap = {
			\ '<F1>': 'DynPPP ',
			\ '<F2>': 'DynPP ',
			\ '<F3>': 'DynP ',
			\ '<F4>': 'DynMP ',
			\ '<C-F4>': 'DynMF ',
			\ '<C-F3>': 'DynF ',
			\ '<C-F2>': 'DynFF ',
			\ '<C-F1>': 'DynFFF ',
			\ '<F12>': 'bar ...<CR>' }

function! RestartCurrentNote()
	let g:currentOctave = 0
	let g:currentNote = deepcopy( g:emptyNote )
endfunction
let currentOctave = 0
let emptyNote = {
			\ 'linked': 0,
			\ 'dotted': 0,
			\ 'tonality': [],
			\ 'accent': [],
			\ 'duration':[] }
let currentNote = deepcopy( g:emptyNote )
let previousNote = deepcopy( g:emptyNote )
call RestartCurrentNote()

function! AddTonality( ton )

	let octaveStr = ''
	if g:currentOctave < 0
		let octaveStr = repeat( '-', -g:currentOctave )
	elseif g:currentOctave > 0
		let octaveStr = repeat( '+', g:currentOctave )
	endif

	let g:currentNote['tonality'] += [ octaveStr.a:ton ] 

	let g:currentOctave = 0
	call PreviewNote()
endfunction

function! AddOctave( oct )
	let g:currentOctave += ( a:oct=='+' ? 1 : -1 )
	call PreviewNote()
endfunction

function! AddAccent( acc )
	let g:currentNote['accent'] += [ a:acc ]
	call PreviewNote()
endfunction

function! AddDuration( dur )
	let g:currentNote['duration'] += [ a:dur ]
	call PreviewNote()
endfunction

function! AddLink()
	let g:currentNote['linked'] = 1 - g:currentNote['linked']
	call PreviewNote()
endfunction

function! AddDotted()
	let g:currentNote['dotted'] += 1
	call PreviewNote()
endfunction

function! GetCurrentNote()

	let cur = g:currentNote

	let tonStr = join( cur['tonality'], '+' )

	let accentStr = ""
	if !empty( cur['accent'] )
		let accentStr = ":'".join( cur['accent'], "" )."'"
	endif

	let durStr = join( cur['duration'], ' ')
	if len( cur['duration'] )>1
		let durStr = "[ ".durStr." ]"
	endif
	let durStr = ":".durStr

	let linkStr = ""
	if cur['linked']
		let linkStr = "~"
	end

	let dotStr = repeat( "'", cur['dotted'] )

	return linkStr.tonStr.accentStr.durStr.dotStr

endfunction


function! EscapeNote()
	call RestartCurrentNote()
	call PreviewNote()
endfunction

function! PreviewNote()
	echo GetCurrentNote()
endfunction

function! WriteNote()
	let str = GetCurrentNote()
	execute 'normal! a'.str." "
	let g:previousNote = deepcopy( g:currentNote )
	call RestartCurrentNote()
endfunction

function! GetPrevious()
	let g:currentNote = deepcopy( g:previousNote )
	call PreviewNote()
endfunction

function! AddMap( m, f )
	for [key,val] in items( a:m )
		execute 'nnoremap <silent> '.key.' :call '.a:f.'("'.val.'")<CR>'
	endfor
endfunction
function! RemMap( m )
	for key in keys( a:m )
		try
			execute 'nunmap '.key
		finally
		endtry
	endfor
endfunction

function! ActivateMapping()
	call AddMap( g:NoteTonalityMap, "AddTonality" )
	call AddMap( g:NoteDurationMap, "AddDuration" )
	call AddMap( g:AccentMap, "AddAccent" )
	call AddMap( g:OctaveMap, "AddOctave" )
	for [key,val] in items( g:NormalInsertMap )
		execute 'nnoremap <silent> '.key.' a'.val.'<ESC>'
	endfor
	nnoremap <silent> <SPACE> :call WriteNote()<CR>
	execute 'nnoremap <silent> '.g:DotMap.' :call AddDotted()<CR>'
	execute 'nnoremap <silent> '.g:LinkedMap.' :call AddLink()<CR>'
	execute 'nnoremap <silent> '.g:GetPreviousMap.' :call GetPrevious()<CR>'

	execute 'nnoremap '.g:VisualLinkedMap.' :normal! v<CR>'
	execute 'vnoremap '.g:VisualLinkedMap." <ESC>`>a ]<ESC>`<i~[ <ESC>"
endfunction

function! RemoveMapping()
	call RemMap( g:NoteTonalityMap )
	call RemMap( g:NoteDurationMap )
	call RemMap( g:AccentMap )
	call RemMap( g:OctaveMap )
	call RemMap( g:NormalInsertMap )
	try
		nunmap <SPACE>
		execute 'nunmap '.g:DotMap
		execute 'nunmap '.g:LinkedMap
		execute 'nunmap '.g:VisualLinkedMap
		execute 'vunmap '.g:VisualLinkedMap
		execute 'vunmap '.g:GetPreviousMap
	finally
	endtry
endfunction

map <silent> <Leader>a :call ActivateMapping()<CR>
map <silent> <Leader>u :call RemoveMapping()<CR>
map <silent> <Leader><ESC> :call EscapeNote()<CR>

