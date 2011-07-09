% Tonality:		Note( 'do' ), Note ( 'C' )
% Octave:		Note( '+0' ), Note( '++' ), Note( '-' )
% Dynamics:		Note( 'dynamics', 'mf' )
% Crescendo:	Note( 'cresc', [ N C ], 'fff' )
% Bar:			Note( 'bar' )
% Sustain:		Note( 'sustain', 'on'|'off' )
% Tempo:		Note( 'tempo', 120 )
% Fermata:		Note( 'fermata', B, R )
% Acc/Rall:		Note( 'accel'|'rall', B, 80 )
% Duration:		B = Note( 2 )
% Meter:		Note( [3 4] )

classdef Note
	
	%% Constants
	
	properties( Constant, GetAccess = private )
		
		NOTES = struct( ...
			'name', { 'rest', ...
			'dobb',	 'dob',  'do',  'dod',  'dodd',  'cff', 'cf', 'c', 'cs', 'css', ...
			'rebb',  'reb',  're',  'red',  'redd',  'dff', 'df', 'd', 'ds', 'dss', ...
			'mibb',  'mib',  'mi',  'mid',  'midd',  'eff', 'ef', 'e', 'es', 'ess', ...
			'fabb',  'fab',  'fa',  'fad',  'fadd',  'fff', 'ff', 'f', 'fs', 'fss', ...
			'solbb', 'solb', 'sol', 'sold', 'soldd', 'gff', 'gf', 'g', 'gs', 'gss', ...
			'labb',  'lab',  'la',  'lad',  'ladd',  'aff', 'af', 'a', 'as', 'ass', ...
			'sibb',  'sib',  'si',  'sid',  'sidd',  'bff', 'bf', 'b', 'bs', 'bss' }, ...
			'tonality', { [NaN;NaN] ...
			[0;-2] [0;-1] [0;0]  [0;1]  [0;2]  [0;-2] [0;-1] [0;0]  [0;1]  [0;2]  ...
			[1;0]  [1;1]  [1;2]  [1;3]  [1;4]  [1;0]  [1;1]  [1;2]  [1;3]  [1;4]  ...
			[2;2]  [2;3]  [2;4]  [2;5]  [2;6]  [2;2]  [2;3]  [2;4]  [2;5]  [2;6]  ...
			[3;3]  [3;4]  [3;5]  [3;6]  [3;7]  [3;3]  [3;4]  [3;5]  [3;6]  [3;7]  ...
			[4;5]  [4;6]  [4;7]  [4;8]  [4;9]  [4;5]  [4;6]  [4;7]  [4;8]  [4;9]  ...
			[5;7]  [5;8]  [5;9]  [5;10] [5;11] [5;7]  [5;8]  [5;9]  [5;10] [5;11] ...
			[6;9]  [6;10] [6;11] [6;12] [6;13] [6;9]  [6;10] [6;11] [6;12] [6;13] } );
		
		DYNAMICS = struct( ...
			'pat', { '0', 'mf', 'mp', 'fff', 'ppp', 'ff', 'pp', 'f', 'p' }, ...
			'value', { -5 0 -1 3 -4 2 -3 1 -2 } );
		
		ACCENTS = struct( ...
			'pat', { '.', '^', '>', '-' }, ...
			'value', { 1 2 3 4 } );
				
	end
	
	%% Properties
	
	properties
		
		parallelStart = false;
		parallelNext = false;
		parallelEnd = false;
		
		isNote = false;
		tonality = zeros(2,0); % degree and absolute half-tonality
		duration = [];
		initialDuration = [];
		isDotted = 0;
		isTied = false;
		isArpeggiated = false;
		accent = 0;
		isDetached = NaN;
		
		isVoid = false;
		voidInfo = zeros(3,0); % [ index; trans degres; trans ton ]
		
		isBar = false;
		
		delay = []; % for dynamics (TODO: and tempo)

		defDynamics = false;
		dynamics = NaN;
		durationCresc = 0;
		channelDynamics = false;
		
		defMeter = false;
		meter = [];
		
		defOctave = false;
		octave = [];
		
		defSustain = false;
		startSustain = false;
		
		defTempo = false;
		tempo = [];
		
		defFermata = false;
		fermataDuration = [];
		fermataPlayedDuration = [];
	
		defModifiedTempo = false;
		transitionDuration = [];
		endTempo = [];
		
		isMarker = false;
		goto = false;
		marker = '';
		
	end
	
	%% Constructor
	
	methods
		
		function note = Note( varargin )
			
			function [ok, value] = getDynamics( arg )
				persistent dynamics dynamicsPattern pattern
				if isempty( dynamics )
					dynamics = Note.DYNAMICS;
					dynamicsPattern = { dynamics.pat };
					pattern = sprintf( '(?<dynamics>(%s)%s)', dynamics(1).pat, ...
						sprintf( '|(%s)', dynamics(2:end).pat ) );
				end
				
				ok = false;
				value = 0;
				
				match = regexpi( arg, pattern, 'once', 'names' );
				if ~isempty( match )
					ok = true;
					index = strcmpi( match.dynamics, dynamicsPattern );
					value = dynamics( index ).value;
				end
				
			end
			function [ok, value] = getDuration( arg )
				ok = true; value = 0;
				if isa( arg, 'Note' )
					durNote = plus( arg );
					value = durNote.duration;
				elseif isnumeric( arg )
					value = sum( arg );
				else
					ok = false;
					return
				end
			end
			
			function ok = checkParallel( varargin )
				ok = true;
				if nargin == 1 && ischar( varargin{1} )
					if strcmp( varargin{1}, '__PARALLEL_START__' )
						note.parallelStart = true; return
					elseif strcmp( varargin{1}, '__PARALLEL_NEXT__' )
						note.parallelNext = true; return
					elseif strcmp( varargin{1}, '__PARALLEL_END__' )
						note.parallelEnd = true; return
					end
				end
				ok = false;
			end
			function ok = checkTonality( varargin )
				persistent notesTonality notesName
				if isempty( notesTonality )
					notes = Note.NOTES;
					notesName = { notes.name };
					notesTonality = { notes.tonality };
				end
				
				ok = false;
				if nargin == 1 && ischar( varargin{1} )
					index = strcmpi( varargin{1}, notesName );
					if any( index )
						note.isNote = true;
						note.tonality = notesTonality{index};
						ok = true;
					end
				end
				
			end
			function ok = checkVoid( varargin )
				ok = false;
				if nargin == 0 || ( ...
						nargin == 1 && ...
						ischar( varargin{1} ) && ...
						strcmpi( varargin{1}, 'void' ) )
					note.isNote = true;
					note.isVoid = true;
					note.voidInfo = [Inf;0;0];
					ok = true;
				end
			end
			function ok = checkOctave( varargin )
				
				function [ok, value] = getNbSymbol( arg, c )
					
					ok = false;
					value = 0;
					
					pat = [ '(?<char>' regexptranslate( 'escape', c ) '+)(?<value>\d*)' ];
					match = regexp( arg, pat, 'once', 'names' );
					if ~isempty( match )
						ok = true;
						if isempty( match.value )
							value = length( match.char );
						else
							value = str2double( match.value );
						end
					end
					
				end
				
				if nargin == 1 && ischar( varargin{1} )
					[ok, val] = getNbSymbol( varargin{1}, '+' );
					if ok
						note.defOctave = true;
						note.octave = val;
						return
					end
					[ok, val] = getNbSymbol( varargin{1}, '-' );
					if ok
						note.defOctave = true;
						note.octave = -val;
						return
					end
				end
				ok = false;
				
			end
			function ok = checkDynamics( varargin )
				ok = false;
				if ( nargin == 2 || nargin == 3 ) && ...
						ischar( varargin{1} ) && ...
						any( strcmpi( varargin{1}, { 'dynamics', 'dynamics*' } ) ) && ...
						ischar( varargin{2} )
					
					channel = strcmpi( varargin{1}, 'dynamics*' );
					
					[ok, val] = getDynamics( varargin{2} );
					if ~ok, return; end
					
					delay_ = 0;
					if nargin == 3
						[ok, delay_] = getDuration( varargin{3} );
						if ~ok, return; end
					end
					
					note.defDynamics = true;
					note.dynamics = val;
					note.delay = delay_;
					note.channelDynamics = channel;
					
				end
			end
			function ok = checkBar( varargin )
				ok = false;
				if nargin == 1 && ischar( varargin{1} ) && strcmpi( varargin{1}, 'bar' )
					note.isBar = true;
					ok = true;
				end
			end
			function ok = checkCrescendo( varargin )
				persistent crescendoKeyWords channelCrescKeyWords
				if isempty( crescendoKeyWords )
					crescendoKeyWords = { ...
						'crescendo', ...
						'cresc', ...
						'decrescendo', ...
						'decresc' };
					channelCrescKeyWords = cellfun( @(kw) [kw '*'], crescendoKeyWords, 'UniformOutput', false );
				end
				
				ok = false;
				
				if ( nargin==3 || nargin==4 ) && ...
						ischar( varargin{1} ) && ...
						any( strcmpi( varargin{1}, [ crescendoKeyWords channelCrescKeyWords ] ) ) && ...
						ischar( varargin{3} )
					
					channel = any( strcmpi( varargin{1}, channelCrescKeyWords ) );
					
					[ok, duration_ ] = getDuration( varargin{2} );
					if ~ok, return; end
					
					delay_ = 0;
					if nargin==4
						[ ok, delay_ ] = getDuration( varargin{4} );
						if ~ok, return; end
					end
					
					[ok, dyn] = getDynamics( varargin{3} );
					if ~ok, return; end
					
					note.defDynamics = true;
					note.durationCresc = duration_;
					note.dynamics = dyn;
					note.delay = delay_;
					note.channelDynamics = channel;
					
				end
				
			end
			function ok = checkSustain( varargin )
				
				ok = false;
				if nargin ==2 && ...
						ischar( varargin{1} ) && strcmpi( varargin{1}, 'sustain' ) && ...
						ischar( varargin{2} ) && any( strcmpi( varargin{2}, { 'on', 'off' } ) )
					
					note.defSustain = true;
					note.startSustain = strcmpi( varargin{2}, 'on' );
					
					ok = true;
				end
				
			end
			function ok = checkTempo( varargin )
				
				ok  = false;
				if nargin == 2 && ...
						ischar( varargin{1} ) && strcmpi( varargin{1}, 'tempo' ) && ...
						isnumeric( varargin{2} ) && numel( varargin{2} ) == 1
					
					note.defTempo = true;
					note.tempo = varargin{2};
					
					ok = true;
					
				end
				
			end
			function ok = checkFermata( varargin )
				
				ok  = false;
				if nargin == 3 && ...
						ischar( varargin{1} ) && strcmpi( varargin{1}, 'fermata' )
					
					[ok, fermataDuration_ ] = getDuration( varargin{2} );
					if ~ok, return; end

					[ok, fermataPlayedDuration_] = getDuration( varargin{3} );
					if ~ok, return; end
					
					note.defFermata = true;
					note.fermataDuration = fermataDuration_;
					note.fermataPlayedDuration = fermataPlayedDuration_;
					
					ok = true;
					
				end
				
			end
			function ok = checkAccelerando( varargin )
				persistent accelerandoKeyWords
				if isempty( accelerandoKeyWords )
					accelerandoKeyWords = { ...
						'accelerando', ...
						'accel.', ...
						'accel', ...
						'rallentando', ...
						'rall.', ...
						'rall' };
				end
				
				ok  = false;
				if nargin == 3 && ...
						ischar( varargin{1} ) && any( strcmpi( varargin{1}, accelerandoKeyWords ) ) && ...
						isnumeric( varargin{3} ) && numel( varargin{3} ) == 1
					
					[ok, transitionDuration_] = getDuration( varargin{2} );
					if ~ok, return; end
					
					note.defModifiedTempo = true;
					note.transitionDuration = transitionDuration_;
					note.endTempo = varargin{3};
					
					ok = true;
					
				end
				
			end
			function ok = checkMarker( varargin )
				
				ok = false;
				if nargin == 2 && ...
						ischar( varargin{1} ) && ...
						any( strcmpi( varargin{1}, { 'marker', 'marker*' } ) ) && ...
						ischar( varargin{2} )
					
					note.isMarker = true;
					note.goto = strcmpi( varargin{1}, 'marker*' );
					note.marker = varargin{2};
					
					ok = true;
					
				end
				
			end
			function ok = checkDuration( varargin )
				
				ok = false;
				
				if nargin == 1 && isnumeric( varargin{1} ) && numel( varargin{1} ) == 1
					note.isNote = true;
					note.tonality = [NaN;NaN];
					note.duration = varargin{1};
					note.initialDuration = varargin{1};
					ok = true;
				end
				
			end
			function ok = checkMeter( varargin )
				
				ok = false;
				
				if nargin == 1 && isnumeric( varargin{1} ) && numel( varargin{1} ) == 2
					note.defMeter = true;
					note.meter = varargin{1};
					ok = true;
				end
				
			end
			function ok = checkSetTonality( varargin )
				ok = false;
				if nargin == 2 && ...
						ischar( varargin{1} ) && ...
						strcmpi( varargin{1}, '__SET_TONALITY__' ) && ...
						isnumeric( varargin{2} ) && numel( varargin{2} ) == 1
					
						note.isNote = true;
						note.tonality = [0;varargin{2}];
						ok = true;
					
				end
			end
			
			if ~checkParallel( varargin{:} ) && ...
					~checkTonality( varargin{:} ) && ...
					~checkVoid( varargin{:} ) && ...
					~checkOctave( varargin{:} ) && ...
					~checkDynamics( varargin{:} ) && ...
					~checkBar( varargin{:} ) && ...
					~checkCrescendo( varargin{:} ) && ...
					~checkSustain( varargin{:} ) && ...
					~checkTempo( varargin{:} ) && ...
					~checkFermata( varargin{:} ) && ...
					~checkAccelerando( varargin{:} ) && ...
					~checkMarker( varargin{:} ) && ...
					~checkDuration( varargin{:} ) && ...
					~checkMeter( varargin{:} ) && ...
					~checkSetTonality( varargin{:} )
				
				error( 'CACOFONIX:Note:UnexpectedArgument', ...
					'Input arguments are unexpected' );
				
			end
			
		end
		
	end
	
	%% tie not
	
	methods
		
		function notes = not( notes )
			
			index = [ notes.isNote ];
			
			if length( notes )>1
				index( find( index, 1, 'first' ) ) = false;
			end
			
			idx = index & ~isnan( [ notes.isDetached ] );
			if any( idx )
				index( idx ) = ~[ notes(idx).isDetached ];
			end
			
			if any( index )
				[ notes(index).isTied ] = deal( true );
			end
			
		end
		
	end
	
	%% point ctranpose
	
	methods
		
		function note = ctranspose( note )
			dot = note.isDotted + 1;
			note.isDotted = dot;
			note.duration = note.initialDuration * ( 2 - 2^-dot );
		end
		
	end
	
	%% octave -/+ 1 uminus/uplus
	
	methods
		
		function notes = uminus( notes )
			notes = addOctave( notes, -1 );
		end
		
		function notes = uplus( notes )
			notes = addOctave( notes, 1 );
		end
		
	end
	
	methods( Access = private )
		
		function notes = addOctave( notes, oct )
			offset = 12*oct;
			for i = find( [ notes.isNote ] )
				
				ton = notes(i).tonality;
				ton(2,:) = ton(2,:) + offset;
				notes(i).tonality = ton;
				
				info = notes(i).voidInfo;
				info(3,:) = info(3,:) + offset;
				notes(i).voidInfo = info;
				
			end
		end
		
	end
	
	%% set longueur colon
	
	methods
		
		function note = colon( note1, mod, note2 )
			persistent accents accentPattern pattern
			if isempty( accents )
				accents = Note.ACCENTS;
				accentPattern = { accents.pat };
				temp = cellfun( @(p)regexptranslate( 'escape', p ), { accents.pat }, 'UniformOutput', false );
				pattern = sprintf( '(?<accent>(%s)%s)', temp{1}, sprintf( '|(%s)', temp{2:end} ) );
			end
			
			if nargin == 2
				note2 = mod; 
				mod = '';
			end
			
			note = plus( [ note1 note2 ] );
			
			if ~isempty( mod )
				match = regexpi( mod, pattern, 'once', 'names' );
				if ~isempty( match )
					index = strcmpi( match.accent, accentPattern );
					note.accent = accents( index ).value;
				end
			end
			
			if ~isempty( mod ) && ismember( '|', mod )
				note.isDetached = true;
			end
			if ~isempty( mod ) && ismember( '$', mod )
				note.isArpeggiated = true;
			end
			
		end
		
	end
	
	%% accord plus
	
	methods
		
		function note = plus( notes, note2 )
			
			function B = myUnique( A )
				[ toto, I ] = unique( A', 'rows', 'first' );
				B = A(:,sort(I));
			end
			
			if nargin == 2
				notes = [ notes note2 ];
			end
			
			if any( ~[ notes.isNote ] )
				error( 'CACOFONIX:Note:plus', 'Only notes can be added' );
			end
			
			note = notes( 1 );
			
			ton = myUnique( [ notes.tonality ] );
			nanidx = any( isnan( ton ), 1 );
			if all( nanidx ) && size( ton, 2 ) > 1
				ton = [ NaN; NaN ];
			elseif any( nanidx )
				ton = ton( : , ~nanidx );
			end
			note.tonality = ton;
			
			note.duration = sum( [ notes.duration ] );
			note.initialDuration = note.duration;
			note.isDotted = 0;
			
			note.isTied = any( [ notes.isTied ] );
			
			note.accent = max( [ notes.accent ] ); % why not?
			
			note.isDetached = any( [ notes.isDetached ] );
			
			note.isArpeggiated = any( [ notes.isArpeggiated ] );
			
			note.isVoid = any( [ notes.isVoid ] );
			note.voidInfo = myUnique( [ notes.voidInfo ] );
			
		end
		
	end
	
	%% transpose mpower
	
	methods
		
		function notes = mpower( notes, height )
			persistent degree2HalfTons halfTons2Degree
			if isempty( degree2HalfTons )
				degree2HalfTons = [ 0 2 4 5 7 9 11 ];
				halfTons2Degree = [ 0 1 1 2 2 3 4 4 5 5 6 6 ];
			end
			function [q, r] = euclidQuotient( x, y )
				q = floor( x / y );
				r = mod( x, y );
			end
			
			if numel( height ) == 1
				
				absHalfTon = height;
				
				[ nbOctave, halfTon] = euclidQuotient( absHalfTon, 12 );
				nbDeg = nbOctave*7 + halfTons2Degree( halfTon +1 );
				
			else % numel( height ) == 2
				
				nbDeg = height(1);
				relHalfTon = height(2);
				
				[ nbOctave, deg ] = euclidQuotient( nbDeg, 7 );
				absHalfTon = 12*nbOctave + degree2HalfTons(deg+1) + relHalfTon;
				
			end
			
			notes = internalTranspose( notes, [ nbDeg, absHalfTon ] );
			
		end
		
	end
	
	methods( Access = private )
		
		function notes = internalTranspose( notes, height )
			
			% realize the transposition
			for i = find( [ notes.isNote ] )
				
				ton = notes(i).tonality;
				ton(1,:) = mod( ton(1,:) + height(1), 7 );
				ton(2,:) = ton(2,:) + height(2);
				notes(i).tonality = ton;
				
				info = notes(i).voidInfo;
				info(2,:) = info(2,:) + height(1);
				info(3,:) = info(3,:) + height(2);
				notes(i).voidInfo = info;

			end
						
		end
		
	end
	
	%% riff mtimes
	
	methods
		
		function notes = mtimes( accord, riff )
			
			if isnumeric( riff )
				notes = repmat( accord, 1, riff );
				return
			elseif isnumeric( accord )
				notes = repmat( riff, 1, accord );
				return
			end
			
			lAcc = length( accord );
			lRiff = length( riff );
			
			notes = riff;
			for nRiff = 1:lRiff
				
				if notes( nRiff ).isVoid
					
					riffNote = notes( nRiff );
					
					info = riffNote.voidInfo;
					nbInfo = size( info, 2 );
					
					notesOfVoid = cell( 1, nbInfo );
					
					% get all indexed notes
					for i = 1:nbInfo
						
						idx = info(1,i);
						if isinf( idx )
							idx = 1:lAcc;
						elseif idx == 0
							error( 'CACOFONIX:Note:NullIndex', ...
								'A void note has a null index' );
						elseif idx > 0
							idx = mod( idx-1, lAcc ) + 1;
						else % idx < 0
							idx = lAcc - mod( -idx-1, lAcc );
						end
						
						% get transposed notes
						notesOfVoid{i} = internalTranspose( accord( idx ), info([2 3],i) );
						
					end
					
					notesOfVoid = [ notesOfVoid{:} ];
					
					% flush void
					riffNote.isVoid = false;
					riffNote.voidInfo = zeros(3,0);
					
					% create the new note
					riffNote = notesOfVoid:riffNote; %#ok<BDSCI>
					
					notes( nRiff ) = riffNote;
					
				end
				
			end
			
		end
		
	end
	
	%% "expand" times
	
	methods
		
		function notes = times( accord, riff )
			
			if isnumeric( riff )
				notes = repmat( accord, 1, riff );
				return
			elseif isnumeric( accord )
				notes = repmat( riff, 1, accord );
				return
			end
			
			lAcc = length( accord );
			lRiff = length( riff );
			
			notes = cell( 1, lAcc );
			for nAcc = 1:lAcc
				
				if accord( nAcc ).isNote
					
					temp = riff;
					for nRiff = 1:lRiff
						if temp(nRiff).isNote
							temp(nRiff) = accord(nAcc):riff(nRiff);
						end
					end
					notes{nAcc} = temp;
					
				else
					
					notes{nAcc} = accord(nAcc);
					
				end
				
			end
			
			notes = [ notes{:} ];
			
		end
		
	end
	
	%% set index minus
	
	methods
		
		function notes = minus( notes, index )
			
			for i = find( [ notes.isVoid ] )
				
				info = notes(i).voidInfo; nbInfo = size( info, 2 );
				if nbInfo > 1
					error( 'CACOFONIX:SetIndex', ...
						'Index can not be defined for accords' );
				else
					notes(i).voidInfo = [ index; info( 2:end ) ];
				end
				
			end
			
		end
		
	end
	
	%% parallel mrdivide
	
	methods
		
		function sheet = mrdivide( A, B )
			persistent NoteStart NoteNext NoteEnd
			if isempty( NoteStart )
				NoteStart = Note( '__PARALLEL_START__' );
				NoteNext = Note( '__PARALLEL_NEXT__' );
				NoteEnd = Note( '__PARALLEL_END__' );
			end
			
			function a = chomp( a )
				numPar = cumsum( [ a.parallelStart ] - [ a.parallelEnd ] );
				if a(1).parallelStart && all( numPar(1:end-1) > 0 ) && a(end).parallelEnd
					% if all numPar strictly positive:
					%	a = [ NoteStart ...notes... NoteEnd ]
					a = a(2:end-1);
				end
			end
			
			sheet = [ NoteStart chomp( A ) NoteNext chomp( B ) NoteEnd ];
			
		end
		
	end
	
	%% extraction or
	
	methods
		
		function sheet = or( arg1, arg2 )
			
			function sheet = mainExtract( sheet )
				persistent NoteStart NoteNext NoteEnd
				if isempty( NoteStart )
					NoteStart = Note( '__PARALLEL_START__' );
					NoteNext = Note( '__PARALLEL_NEXT__' );
					NoteEnd = Note( '__PARALLEL_END__' );
				end
				
				isMark = find( [ sheet.isMarker ] );
				idx = isMark( find( strcmp( mark, { sheet( isMark ).marker } ), 1 ) );
				if isempty( idx )
					error( 'CACOFONIX:NOTE:MarkerNotFound', ...
						'Marker %s missing', mark );
				end
				
				% check parallelism
				parStart = [ sheet.parallelStart ];
				parEnd = [ sheet.parallelEnd ];
				numPar = cumsum( parStart - parEnd );
				
				if numPar(idx)~=0
					
					parNext = [ sheet.parallelNext ];
					
					idxTemp = 1:length( sheet );
					currentParStart = find( parStart & (numPar==1) & (idxTemp<idx), 1, 'last' );
					currentParEnd = find( parEnd & (numPar==0) & (idxTemp>idx), 1 );
					currentParNext = find( parNext & (numPar==1) & ...
						(currentParStart<idxTemp) & (idxTemp<currentParEnd) );
					
					sep = [ currentParStart currentParNext currentParEnd ];
					
					finalSheet = [ NoteStart mainExtract( sheet( (sep(1)+1):(sep(2)-1) ) ) ];
					for i = 2:( length( sep )-1 )
						finalSheet = [ finalSheet NoteNext ...
							mainExtract( sheet( (sep(i)+1):(sep(i+1)-1) ) ) ]; %#ok<AGROW>
					end
					
					sheet = joinFcn( sheet, ...
						currentParStart, ...
						currentParEnd, ...
						[ finalSheet NoteEnd ] );
					
				else
					
					sheet = extractFcn( sheet, idx );
					
				end
				
				
			end
			
			function sheet = getFromStart( sheet, idx )
				sheet = sheet( 1:idx );
			end
			function sheet = getToEnd( sheet, idx )
				sheet = sheet( idx:end );
			end
			
			function sheet = joinBefore( sheet, parStart, parEnd, parSheet ) %#ok<INUSL>
				sheet = [ parSheet sheet( parEnd+1:end ) ];
			end
			function sheet = joinAfter( sheet, parStart, parEnd, parSheet ) %#ok<INUSL>
				sheet = [ sheet(1:parStart-1) parSheet ];
			end
			
			if ischar( arg1 )
				mark = arg1;
				sheet = arg2;
				extractFcn = @getToEnd;
				joinFcn = @joinBefore;
			elseif numel( arg1 ) == 1 && isa( arg1, 'Note' ) && arg1.isMarker
				mark = arg1.marker;
				sheet = arg2;
				extractFcn = @getToEnd;
				joinFcn = @joinBefore;
			elseif ischar( arg2 )
				mark = arg2;
				sheet = arg1;
				extractFcn = @getFromStart;
				joinFcn = @joinAfter;
			elseif numel( arg2 ) == 1 && isa( arg2, 'Note' ) && arg2.isMarker
				mark = arg2.marker;
				sheet = arg1;
				extractFcn = @getFromStart;
				joinFcn = @joinAfter;
			else
				error( 'CACOFONIX:Note:UnexpectedArguments', ...
					'A string or a marker note is required' );
			end
			
			sheet = mainExtract( sheet );
			
		end
		
	end
	
	%% function display
	
	methods( Static )
		
		function setNbCharByQuater( newValue )
			Note.internCharByQuater( 'set', newValue );
		end
		
		function value = getNbCharByQuater()
			value = Note.internCharByQuater( 'get' );
		end
		
	end
	
	methods( Static, Access = private )
		
		function currentValue = internCharByQuater( flag, newValue )
			persistent value
			if isempty( value )
				value = 24;
			end
			
			if strcmp( flag, 'set' )
				if isnumeric( newValue ) && numel( newValue ) == 1 && newValue > 0
					value = newValue;
				else
					error( 'CACOFONIX:CharByQuater', ...
						'The new value has to be one numerical value greater than 0' );
				end
			end
			
			currentValue = value;
			
		end
		
	end
	
	methods
		
		function display( notes )
			
			persistent dynamicsNames
			if isempty( dynamicsNames )
				dynamicsNames = { '0', 'ppp', 'pp', 'p', 'mp', 'mf', 'f', 'ff', 'fff' };
			end
			
			persistent degDisp altDisp degree2HalfTons
			if isempty( degDisp )
				degDisp = { 'C', 'D', 'E', 'F', 'G', 'A', 'B' };
				altDisp = { '', '#', '##', '3#', '4#', '5#', '6#', '5b', '4b', '3b', 'bb', 'b' };
				degree2HalfTons = [ 0 2 4 5 7 9 11 ];
			end
			
			function string = append( string, line, startChar, str, overwrite )
				
				startChar = max( 1, startChar );
				
				lenStr = length( str );
				[nl, nc] = size( string );
				if nl < line
					string = [ string; repmat( ' ', line-nl, nc ) ];
					nl = size( string, 1 );
				end
				if nc < startChar + lenStr - 1
					string = [ string repmat( ' ', nl, startChar + lenStr - nc - 1 ) ];
				end
				
				if overwrite
					isOk = 1:lenStr;
				else
					isOk = find( string( line, startChar + ( 1:lenStr ) -1 ) == ' ' );
				end
				
				if ~isempty( isOk )
					string( line, startChar + isOk -1 ) = str( isOk );
				end
				
			end
			
			charByQuater = Note.internCharByQuater( 'get' );
			
			noteString = '';
			dynString = '';
			tempoString = '';
			%octaveString = '';
			sustainString = '';
			
			currentChar = 1;
			currentLine = 1;
			
			currentMeasure = 1;
			
			idxBar = [];
			
			markerData = struct( ...
				'numChar', {}, ...
				'name', {} );
			
			stack = struct( ...
				'char', {}, ...
				'startLine', {}, ...
				'nextLine', {}, ...
				'currentMeasure', {} );
			
			for n = 1:length( notes )
				
				note = notes(n);
				
				if note.isNote
					
					if isempty( note.duration ) || note.duration == 0
						dur = charByQuater;
					else
						dur = round( note.duration * charByQuater );
					end
					
					ton = note.tonality;
					if isempty( ton ) % void
						noteString = append( noteString, currentLine, currentChar, '|', false );
						noteString = append( noteString, currentLine, currentChar, repmat( '-', 1, dur ), false );
						noteString = append( noteString, currentLine, currentChar + round( (dur-1)/2 ), 'V', true );

					elseif any( isnan( ton ) ) % rest
						noteString = append( noteString, currentLine, currentChar, repmat( ' ', 1, dur ), false );
						
					else
						
						nbTon = size( ton, 2 );
						cellStrTon = cell( 1, nbTon );
						
						for t = 1:nbTon
							
							cellStrTon{t} = [ ...
								degDisp{ mod(ton(1,t),7 ) + 1 } ...
								altDisp{ mod( ton(2,t) - degree2HalfTons(ton(1,t)+1) , 12 ) + 1 } ...
								];
							
						end
						
						strTon = [ cellStrTon{:} ]; lenStrTon = length( strTon );
						noteString = append( noteString, currentLine, currentChar + round( ( dur - lenStrTon )/2 ), strTon, true );
						
						if note.isTied && ~note.isDetached
							noteString = append( noteString, currentLine, currentChar, '~', false );
						elseif note.accent ~= 0
							str = Note.ACCENTS(note.accent).pat;
							noteString = append( noteString, currentLine, currentChar, str, false );
						else
							noteString = append( noteString, currentLine, currentChar, '|', false );
						end
						
						noteString = append( noteString, currentLine, currentChar, repmat( '-', 1, dur ), false );
					end
					
					currentChar = currentChar + dur;
					
				elseif note.parallelStart
					stack = [ stack struct( ...
						'char', currentChar, ...
						'startLine', currentLine, ...
						'nextLine' , currentLine+1, ...
						'currentMeasure', currentMeasure ) ]; %#ok<AGROW>
				elseif note.parallelNext
					currentChar = stack( end ).char;
					currentLine = stack( end ).nextLine;
					currentMeasure = stack( end ).currentMeasure;
					stack( end ).nextLine = currentLine + 1;
				elseif note.parallelEnd
					currentLine = stack( end ).startLine;
					if length( stack ) > 1
						stack( end-1 ).nextLine = max( stack( [ end-1 end] ).nextLine );
					end
					stack( end ) = [];
					
				elseif note.isBar
					if length( idxBar ) < currentMeasure
						idxBar = [ idxBar currentChar ]; %#ok<AGROW>
					else
						% the bar is already defined with a previous
						% parallel statement
						currentChar = idxBar( currentMeasure );
					end
					
					currentMeasure = currentMeasure + 1;
					
				elseif note.isMarker
					if ~note.goto
						
						markerData = [ markerData struct( ...
							'numChar', currentChar, ...
							'name', note.marker ) ]; %#ok<AGROW>
						
					else
						
						idx = find( strcmp( note.marker, {markerData.name} ) & ...
							currentChar <= [markerData.numChar], 1 );
						
						if isempty( idx )
							markerData = [ markerData struct( ...
								'numChar', currentChar, ...
								'name', note.marker ) ]; %#ok<AGROW>
						else
							currentChar = markerData(idx).numChar;
						end
						
					end
					
				elseif note.defDynamics
					dur = round( note.durationCresc * charByQuater );
					
					dynString = append( dynString, 1, currentChar, repmat( '<', 1, dur ), false );
					
					str = dynamicsNames{ note.dynamics + 6 };
					dynString = append( dynString, 1, currentChar+dur-length(str), str, true );
					
				elseif note.defMeter
					noteString = append( noteString, 1, currentChar, sprintf( '%d', note.meter(2) ), true );
					noteString = append( noteString, 2, currentChar, sprintf( '%d', note.meter(1) ), true );
					
				%elseif note.defOctave
				%	if note.octave < 0
				%		str = sprintf( '-%d', -note.octave );
				%	else
				%		str = sprintf( '+%d', note.octave );
				%	end
				%	octaveString = append( octaveString, 1, currentChar, str, true );
					
				elseif note.defSustain
					if note.startSustain
						sustainString = append( sustainString, 1, currentChar, 'Ped', true );
					else
						sustainString = append( sustainString, 1, currentChar-1, '*', true );
					end
					
				elseif note.defTempo
					str = sprintf( '%d', note.tempo );
					tempoString = append( tempoString, 1, currentChar, str, true );
				elseif note.defFermata
					tempoString = append( tempoString, 1, currentChar, '(.)', true );
				elseif note.defModifiedTempo
					dur = round( note.transitionDuration * charByQuater );
					tempoString = append( tempoString, 1, currentChar, repmat( '.', 1, dur ), false );
					str = sprintf( '%d', note.endTempo );
					tempoString = append( tempoString, 1, currentChar+dur-length(str), str, true );
					
				end
				
				
			end
			
			% reverse line order in noteString
			noteString = noteString( end:-1:1, : );
			
			% set the markerString
			markerString = '';
			if ~isempty( idxBar ) || ~isempty( markerData )
				
				idxMarker = [ markerData.numChar ];
				markerNames = { markerData.name };
				
				% add '/' in marker string
				str = repmat( '/', 1, max( [ idxBar idxMarker size( noteString, 2 ) ] ) );
				markerString = append( markerString, 1, 1, str, true );

				eventPos = unique( [ 0 idxBar idxMarker ] );
				sinceLastMarker = []; currentMeasure = 1;
				for c = eventPos
					
					if ismember( c, idxBar )
						currentMeasure = currentMeasure + 1;
						sinceLastMarker = sinceLastMarker + 1;
					end
					
					if ismember( c, idxMarker )
						marker_ = markerNames{ find( c == idxMarker, 1 ) };
						markerString = append( markerString, 1, c, sprintf( '%s (%d)', marker_, currentMeasure ), true );
						sinceLastMarker = 0;
					else
						if ~isempty( sinceLastMarker )
							str = sprintf( '%d (%d)', sinceLastMarker, currentMeasure );
						else
							str = sprintf( '%d', currentMeasure );
						end
						
						markerString = append( markerString, 1, c, str, true );						
						
					end
					
				end

				% cut marker string
				if length( markerString ) > size( noteString, 2 )
					markerString = markerString( 1:size( noteString, 2 ) );
				end
				
			end
			
			cellString = { markerString, tempoString, dynString, noteString, sustainString };
			index = ~cellfun( 'isempty', cellString );
			string = strvcat( cellString{ index } ); %#ok<VCAT>
			[ lStr, cStr ] = size( string );

			startLine = repmat( '$', lStr, 1 );
			endLine = repmat( '$\n', lStr, 1 );

			index = unique( [ 0 min( idxBar-1, cStr ) cStr ] );
			cellString = mat2cell( string, lStr, diff( index ) );
			
			for i = 1:length( cellString )
				string = [ startLine cellString{i} endLine ]';
				fprintf( string(:)' );
			end
			
		end
					
	end
	
end
