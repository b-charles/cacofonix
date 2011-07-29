%CACOFONIX create a midi file from a set of Note arrays.
%	cacofonix( files, ... ) specify the output file.
%
%	cacofonix( ..., mainSheet, ... ) (with no playable notes) defines a
%	main sheet.
%
%	cacofonix( ..., sheet, ... ) (with playable notes) defines a piano
%	sheet.
%
%	cacofonix( ..., instrument, sheet, ... ) defines a sheet for a
%	particular instrument.
%
%	cacofonix( ..., 'Tempo', tempo, ... ) sets the default tempo
%
%	cacofonix( ..., 'Velocities', velocities, ... ) maps plain dynamics to
%	velocity values.
%
%	cacofonix -instruments displays all availables instruments.
%
%	cacofonix -percussions displays all availables percussions.
%
%	See also: Note.
%

function cacofonix( filepath, varargin )

%% ### CONSTANTS

%% Default values

defaultTempo = 120;

precisionDuration = 1e-5;
roundDuration = @(dur) round( dur / precisionDuration ) * precisionDuration;

detachSeparatorFix = 0.1;
detachSeparatorLim = 0.05;

deltaArpeggio = 0.2;

crescendoSampling = 0.25;

tempoSample = 10;

deltaTimeTicks = prod( [ 2 2 2 2 2 2 3 3 5 7 ] );

deltaSustain = 0.001;

deltaStartAndEndTrack = 0.001;

%% Instruments

persistent INSTRUMENTS PERCUSSIONS
if isempty( INSTRUMENTS )
	
	INSTRUMENTS = struct( 'name', ...
		{ 'Piano', ...
		'Acoustic Grand Piano', 'Bright Acoustic Piano', 'Electric Grand Piano', ...
		'Honky-tonk Piano', 'Electric Piano 1', ...
		'Electric Piano 2', 'Harpsicord', 'Clavinet', 'Celesta', 'Glockenspiel', ...
		'Music Box', 'Vibraphone', 'Marimba', 'Xylophone', 'Tubular Bells', ...
		'Dulcimer', 'Drawbar Organ', 'Percussive Organ', 'Rock Organ', 'Church Organ', ...
		'Reed Organ', 'Accordion', 'Harmonica', 'Bandoneon', 'Nylon String Guitar', ...
		'Steel String Guitar', 'Jazz Guitar', 'Clean Guitar', ...
		'Palm Muted Guitar', 'Overdriven Guitar', ...
		'Distortion Guitar', 'Guitar Harmonics', 'Acoustic Bass', ...
		'Fingered Bass', 'Picked Bass', ...
		'Fretless Bass', 'Slap Bass 1', 'Slap Bass 2', 'Synth Bass 1', 'Synth Bass 2', ...
		'Violin', 'Viola', 'Cello', 'Contrabass', 'Tremolo Strings', ...
		'Pizzicato Strings', 'Orchestral Harp', 'Timpani', 'String Ensemble 1', 'String Ensemble 2', ...
		'Synth Strings 1', 'Synth Strings 2', 'Choir Aahs', 'Voice Oohs', 'Synth Voice', ...
		'Orchestra Hit', 'Trumpet', 'Trombone', 'Tuba', 'Muted Trumpet', ...
		'French Horn', 'Brass Section', 'Synth Brass 1', 'Synth Brass 2', 'Soprano Sax', ...
		'Alto Sax', 'Tenor Sax', 'Baritone Sax', 'Oboe', 'English Horn', ...
		'Bassoon', 'Clarinet', 'Piccolo', 'Flute', 'Recorder', ...
		'Pan Flute', 'Blown Bottle', 'Shakuhachi', 'Whistle', 'Ocarina', ...
		'Square', 'Sawtooth', 'Calliope', 'Chiff', 'Charang', ...
		'Voice', 'Fifths', 'Bass+lead', 'New age', 'Warm', ...
		'Polysynth', 'Choir', 'Bowed', 'Metallic', 'Halo', ...
		'Sweep', 'Rain', 'Soundtrack', 'Crystal', 'Atmosphere', ...
		'Brightness', 'Goblins', 'Echoes', 'Sci-fi', 'Sitar', ...
		'Banjo', 'Shamisen', 'Koto', 'Kalimba', 'Bagpipe', ...
		'Fiddle', 'Shanai', 'Tinkle Bell', 'Agogo', 'Steel Drums', ...
		'Woodblock', 'Taiko Drum', 'Melodic Tom', 'Synth Drum', 'Reverse Cymbal', ...
		'Guitar Fret Noise', 'Breath Noise', 'Seashore', 'Bird Tweet', 'Telephone Ring', ...
		'Helicopter', 'Applause', 'Gunshot' }, 'patch', num2cell( [ 0 0:127 ] ) );

	PERCUSSIONS = [ ...
		struct( 'name', 'High Q',				'ton', -33 )
		struct( 'name', 'Slap',					'ton', -32 )
		struct( 'name', 'Scratch',				'ton', -31 )
		struct( 'name', 'Scratch 2',			'ton', -30 )
		struct( 'name', 'Sticks',				'ton', -29 )
		struct( 'name', 'Square',				'ton', -28 )
		struct( 'name', 'Metronome',			'ton', -27 )
		struct( 'name', 'Metronome 2',			'ton', -26 )
		...
		struct( 'name', 'Acoustic Bass Drum', 	'ton', -25 )
		struct( 'name', 'Bass Drum 1',			'ton', -24 )
		struct( 'name', 'Side Stick',			'ton', -23 )
		struct( 'name', 'Acoustic Snare',		'ton', -22 )
		struct( 'name', 'Hand Clap',			'ton', -21 )
		struct( 'name', 'Electric Snare',		'ton', -20 )
		struct( 'name', 'Low Floor Tom',		'ton', -19 )
		struct( 'name', 'Closed Hi-Hat',		'ton', [ -18 -14 -16 ] )
		struct( 'name', 'High Floor Tom',		'ton', -17 )
		struct( 'name', 'Pedal Hi-Hat',			'ton', [ -16 -14 -18 ] )
		struct( 'name', 'Low Tom',				'ton', -15 )
		struct( 'name', 'Open Hi-Hat',			'ton', [ -14 -16 -18 ] )
		struct( 'name', 'Low-Mid Tom',			'ton', -13 )
		struct( 'name', 'Hi-Mid Tom',			'ton', -12 )
		struct( 'name', 'Crash Cymbal 1',		'ton', -11 )
		struct( 'name', 'High Tom',				'ton', -10 )
		struct( 'name', 'Ride Cymbal 1',		'ton', -9 )
		struct( 'name', 'Chinese Cymbal',		'ton', -8 )
		struct( 'name', 'Ride Bell',			'ton', -7 )
		struct( 'name', 'Tambourine',			'ton', -6 )
		struct( 'name', 'Splash Cymbal',		'ton', -5 )
		struct( 'name', 'Cowbell',				'ton', -4 )
		struct( 'name', 'Crash Cymbal 2',		'ton', -3 )
		struct( 'name', 'Vibraslap',			'ton', -2 )
		struct( 'name', 'Ride Cymbal 2',		'ton', -1 )
		struct( 'name', 'Hi Bongo',				'ton', 0 )
		struct( 'name', 'Low Bongo',			'ton', 1 )
		struct( 'name', 'Mute Hi Conga',		'ton', 2 )
		struct( 'name', 'Open Hi Conga',		'ton', 3 )
		struct( 'name', 'Low Conga',			'ton', 4 )
		struct( 'name', 'High Timbale',			'ton', 5 )
		struct( 'name', 'Low Timbale',			'ton', 6 )
		struct( 'name', 'High Agogo',			'ton', 7 )
		struct( 'name', 'Low Agogo',			'ton', 8 )
		struct( 'name', 'Cabasa',				'ton', 9 )
		struct( 'name', 'Maracas',				'ton', 10 )
		struct( 'name', 'Short Whistle',		'ton', [ 11 12 ] )
		struct( 'name', 'Long Whistle',			'ton', [ 12 11 ] )
		struct( 'name', 'Short Guiro',			'ton', [ 13 14 ] )
		struct( 'name', 'Long Guiro',			'ton', [ 14 13 ] )
		struct( 'name', 'Claves',				'ton', 15 )
		struct( 'name', 'Hi Wood Block',		'ton', 16 )
		struct( 'name', 'Low Wood Block',		'ton', 17 )
		struct( 'name', 'Mute Cuica',			'ton', [ 18 19 ] )
		struct( 'name', 'Open Cuica',			'ton', [ 19 18 ] )
		struct( 'name', 'Mute Triangle',		'ton', [ 20 21 ] )
		struct( 'name', 'Open Triangle',		'ton', [ 21 20 ] )
		...
		struct( 'name', 'Shaker',				'ton', 22 )
		struct( 'name', 'Jingle Bell',			'ton', 23 )
		struct( 'name', 'Belltree',				'ton', 24 )
		struct( 'name', 'Castanets',			'ton', 25 )
		struct( 'name', 'Mute Surdo',			'ton', [ 26 27 ] )
		struct( 'name', 'Open Surdo',			'ton', [ 27 26 ] ) ];

end

%% ### INPUTS

%% Only display available programs

if nargin == 1 && ischar( filepath ) && strcmpi( filepath, '-instruments' )
	fprintf( ' - %s\n', INSTRUMENTS.name );
	return
end
if nargin == 1 && ischar( filepath ) && strcmpi( filepath, '-percussions' )
	fprintf( ' - %s\n', PERCUSSIONS(9:55).name );
	return
end

%% Search option function

	function value = getOption( key, default )
		value = default;
		
		inputIsChar = find( cellfun( @ischar, varargin ) );
		if ~isempty( inputIsChar )
			index = find( strcmp( key, varargin( inputIsChar ) ) );
			if ~isempty( index )
				value = varargin{ index+1 };
				varargin( [ index index+1 ] ) = [];
			end
		end
	end

%% Path to final file

[ filepath, filename, fileext ] = fileparts( filepath );
if isempty( fileext )
	fileext = '.mid';
end
filepath = fullfile( filepath, [ filename, fileext ] );

%% Tempo

defaultTempo = getOption( 'Tempo', defaultTempo );

%% Dynamics -> Velocity

velocityValues = getOption( 'Velocity', [ 16 33 49 64 80 96 112 126 ] );
if length( velocityValues ) ~= 8
	throwError( 'CACOFONIX:VELOCITY', ...
		'The velocity vector must have 8 elements.' );
end

%% Sheets

args = varargin;
nbArgs = length( args );

sheets = struct( ...
	'number', {}, ...
	'name', {}, ...
	'notes', {}, ...
	'channel', {}, ...
	'instrument', {}, ...
	'events', {}, ...
	'bin', {} );

firstSheetGeneral = false;

freeChannels = true( 1, 16 );
freeChannels( 10 ) = false;

lastInstrument = INSTRUMENTS(1).patch;

	function chan = getAFreeChannel()
		chan = find( freeChannels, 1, 'first' ) - 1;
		if isempty( chan )
			throwError( 'CACOFONIX:NoMoreChannels', ...
				'The limit of channels is reached.' );
		end
		freeChannels( chan+1 ) = false;
	end

numArg = 1;
numSheet = 0;

while numArg <= nbArgs
	
	numSheet = numSheet + 1;
	
	if ischar( args{ numArg } )
		% 'Intrument'|'Percussion', notes
		
		idxInstrument = find( strcmpi( args{ numArg }, { INSTRUMENTS.name } ), 1 );
		idxPercussion = find( strcmpi( args{ numArg }, { PERCUSSIONS.name } ), 1 );
		
		if isempty( idxInstrument ) && isempty( idxPercussion )
			throwError( 'CACOFONIX:UnexpectedArgument', ...
				'Unexpected argument: %s', args{ numArg } );
		end
		
		numArg = numArg + 1;
		if numArg > nbArgs || ~isa( args{numArg}, 'Note' )
			throwError( 'CACOFONIX:NoNoteObjets', ...
				'Note objects expected after %s', args{ numArg-1 } );
		end
		
		if ~isempty( idxInstrument )
			% add instrument sheet
			
			lastInstrument = INSTRUMENTS(idxInstrument).patch;

			sheets = [ sheets struct( ...
				'number', numSheet, ...
				'name', INSTRUMENTS(idxInstrument).name, ...
				'notes', args{numArg}, ...
				'channel', getAFreeChannel(), ...
				'instrument', lastInstrument, ...
				'events', [], ...
				'bin', [] ) ]; %#ok<AGROW>
			
		else % ~isempty( idxPercussion )
			% add percussion sheet
			
			% replace all notes by tonality of percussion
			
			ton = PERCUSSIONS( idxPercussion ).ton; nbTon = length( ton );
			percu = cell( 1, nbTon );
			for ii = 1:nbTon
				percu{ii} = Note( '__SET_TONALITY__', ton(ii) );
			end
			percu = [ percu{:} ];
			
			sheets = [ sheets struct( ...
				'number', numSheet, ...
				'name', PERCUSSIONS(idxPercussion).name, ...
				'notes', percu * args{numArg}, ...
				'channel', 9, ...
				'instrument', [], ...
				'events', [], ...
				'bin', [] ) ]; %#ok<AGROW>
			
		end
		
	elseif isa( args{ numArg }, 'Note' )
		
		notes = args{ numArg };
		
		if numArg == 1
			% test if the first sheet sets only general features
			%	in this case, the first sheet only contains rest notes
			isNoteIdx = [ notes.isNote ];
			firstSheetGeneral = all( all( isnan( [ notes( isNoteIdx ).tonality ] ), 1 ) );
		end
		
		if numArg == 1 && firstSheetGeneral
			sheets = [ sheets struct( ...
				'number', numSheet, ...
				'name', 'Main', ...
				'notes', notes, ...
				'channel', 0, ...
				'instrument', [], ...
				'events', [], ...
				'bin', [] ) ]; %#ok<AGROW>
		else
			sheets = [ sheets struct( ...
				'number', numSheet, ...
				'name', '', ...
				'notes', notes, ...
				'channel', getAFreeChannel(), ...
				'instrument', lastInstrument, ...
				'events', [], ...
				'bin', [] ) ]; %#ok<AGROW>
		end
		
	else
		throwError( 'CACOFONIX:UnexpectedArgument', 'Unexpected argument' );
	end
	
	numArg = numArg + 1;
	
end

% add a default Main sheet
if ~firstSheetGeneral
	sheets = [ struct( ...
		'number', 0, ...
		'name', 'Main', ...
		'notes', [], ...
		'channel', 0, ...
		'instrument', [], ...
		'events', [], ...
		'bin', [] ) sheets ];
end

nbSheets = length( sheets );

%% ### CONVERT NOTE TO EVENTS

%% ERROR

	function str = getCurrentMeasureInfo()
		if ~isempty( sinceLastMarker )
			if sinceLastMarker == 0
				str = sprintf( 'measure %d (marker %s)', ...
					numCurrentMeasure, currentMarker );
			else
				str = sprintf( 'measure %d (%d after marker %s)', ...
					numCurrentMeasure, sinceLastMarker, currentMarker );
			end
		else
			str = sprintf( 'measure %d', numCurrentMeasure );
		end
	end

	function str = getCurrentSheetInfo()
		sheetNumber = sheets( numCurrentSheet ).number;
		sheetName = sheets( numCurrentSheet ).name;
		if isempty( sheetName )
			str = sprintf( 'sheet %d', sheetNumber );
		else
			str = sprintf( 'sheet %d (%s)', sheetNumber, sheetName );
		end
	end

	function throwError( identifier, message, varargin )
		error( struct( ...
			'identifier', identifier, ...
			'message', sprintf( message, varargin{:} ), ...
			'stack', struct( 'file', mfilename, 'name', 'cacofonix', 'line', 0 ) ) );
	end

%% NOTES

NOTE = struct( ...
	'tonality', [], ...
	'start', [], ...
	'stop', [], ...
	'startPlay', [], ...
	'stopPlay', [], ...
	'dynamics', [] );

bufferNotes = repmat( NOTE, 1, 100 );
notes = [];
nbNotes = 0;

	function initNotes()
		notes = bufferNotes;
		nbNotes = 0;
	end

	function addNote(tonality, dynamics, varargin )
		% addNote( tonality, dynamics, duration, durationPlay )
		% addNote( tonality, dynamics, start, stop, startPlay, stopPlay)
		
		if length( varargin ) == 2
			start = currentTime;
			startPlay = currentTime;
			stop = start + varargin{1};
			stopPlay = startPlay + varargin{2};
		else % length( varargin ) == 4
			start = varargin{1};
			stop = varargin{2};
			startPlay = varargin{3};
			stopPlay = varargin{4};
		end
		
		if nbNotes == length( notes )
			notes = [ notes bufferNotes ];
		end
		
		nbNotes = nbNotes+1;
		notes(nbNotes) = struct( ...
			'tonality', tonality, ...
			'start', start, ...
			'stop', stop, ...
			'startPlay', startPlay, ...
			'stopPlay', stopPlay, ...
			'dynamics', dynamics );
		
	end

	function convertsNotes2Events()
		
		for numNote = 1:nbNotes
			n = notes( numNote );
			ton = n.tonality;
			st = n.startPlay;
			if length( st ) == 1, st = repmat( st, 1, length( ton ) ); end
			et = n.stopPlay;
			velo = dyn2value( n.dynamics );
			
			arrayfun( @(ton, st) addEvent( NOTE_ON, st, ton, velo ), ton, st );
			arrayfun( @(ton) addEvent( NOTE_OFF, et, ton, velo ), ton );
		end
		
	end

%% EVENTS

NOTE_ON = 'NOTE_ON';
NOTE_OFF = 'NOTE_OFF';
PROGRAM = 'PROGRAM';
TEMPO = 'TEMPO';
VOLUME = 'VOLUME';
SUSTAIN = 'SUSTAIN';
MARKER = 'MARKER';
END_TRACK = 'END_TRACK';

EVENT = struct( ...
	'name', '', ...
	'time', 0, ...
	'arg1', [], ...
	'arg2', [], ...
	'hexa', 0, ...
	'len', 1 );
bufferEvents = repmat( EVENT, 1, 100 );
lengthBufferEvent = length( bufferEvents );

events = [];
nbEvents = 0;
nbArrayEvents = 0;

	function initEvents()
		events = bufferEvents;
		nbEvents = 0;
		nbArrayEvents = length( events );
	end

	function addEvent( name, time, arg1, arg2 )
		
		if nbEvents == nbArrayEvents
			events = [ events bufferEvents ];
			nbArrayEvents = nbArrayEvents + lengthBufferEvent;
		end
		
		nbEvents = nbEvents + 1;
		
		events( nbEvents ).name = name;
		events( nbEvents ).time = time;
		
		if nargin >= 3
			events( nbEvents ).arg1 = arg1;
		end
		if nargin >= 4
			events( nbEvents ).arg2 = arg2;
		end
		
	end

	function EV = getEvents()
		EV = events( 1:nbEvents );
	end

%% TONALITY

currentOctave = 0;

	function initOctave()
		currentOctave = 0;
	end

	function setOctave( note )
		currentOctave = note.octave;
	end

	function ton = getTonality( note )
		ton = 60 + note.tonality(2,:) + 12*currentOctave;
	end

	function state = getTonalityState()
		state = struct( 'currentOctave', currentOctave );
	end

	function restoreTonalityState( state )
		currentOctave = state.currentOctave;
	end

	function continueTonalityState( state )
		currentOctave = state.currentOctave;
	end

%% DYNAMICS

currentDynamic = [0 0]'; % [ -time- ; -dynamics- ]
channelDynamic = [0 0]'; % [ -time- ; -dynamics- ]

	function initDynamics()
		currentDynamic = [0 0]';
		channelDynamic = [0 0]';
	end

	function values = dyn2value( dyn )
		values = max( min( round( interp1( -5:4, [ 0 velocityValues 127 ], dyn, 'linear', 'extrap' ) ), 127 ), 0 );
	end

	function dyn = getCurrDyn( dyns, t )
		if nargin==1
			t = currentTime;
		end
		
		if dyns(1,end) <= t
			dyn = dyns(2,end);
		else
			startIdx = find( dyns(1,:) <= t, 1, 'last' );
			ts = dyns( 1, startIdx );
			ds = dyns( 2, startIdx );
			te = dyns( 1, startIdx+1 );
			de = dyns( 2, startIdx+1 );
			
			dyn = (de-ds)*(t-ts)/(te-ts) + ds;
		end
	end

	function dyn = getCurrentDynamics( note )
		
		dyn = note.dynamics;
		if isempty( dyn ) || ~isfinite( dyn )
			dyn = getCurrDyn( currentDynamic );
		end
		
	end

	function setDynamics( note )
		
		channel = note.channelDynamics;
		
		ts = currentTime + note.delay;
		te = ts + note.durationCresc;
		de = note.dynamics;
		
		if channel
			ds = getCurrDyn( channelDynamic, ts );
			channelDynamic( :, ts < channelDynamic(1,:) ) = [];
			channelDynamic = [ channelDynamic [ ts ds ]' [ te de ]' ];
		else
			ds = getCurrDyn( currentDynamic, ts );
			currentDynamic( :, ts < currentDynamic(1,:) ) = [];
			currentDynamic = [ currentDynamic [ ts ds ]' [ te de ]' ];
		end
		
	end

	function addChannelDynamicsEvents()
		endDyn = [ currentTime getCurrDyn( channelDynamic, currentTime ) ]';
		channelDynamic( :, channelDynamic(1,:) >= currentTime ) = [];
		channelDynamic = [ channelDynamic endDyn ];
		
		nbseg = size( channelDynamic, 2 )-1;
		times = cell(1, nbseg);
		
		for i = 1:nbseg
			if channelDynamic(2,i) ~= channelDynamic(2,i+1)
				times{i} = channelDynamic(1,i):crescendoSampling:channelDynamic(1,i+1);
			else
				times{i} = channelDynamic(1,i);
			end
		end
		
		times = unique( [ times{:} ] );
		dyn = arrayfun( @(t)getCurrDyn( channelDynamic, t ), times );
		
		values = dyn2value( dyn );
		
		% delete doubloon
		isEqValues = [ false diff( values )==0 ];
		times = times( ~isEqValues );
		values = values( ~isEqValues );
		
		for i = 1:length( times )
			addEvent( VOLUME, times(i), values(i) );
		end
		
	end

	function state = getDynamicsState()
		state = struct( ...
			'currentDynamic', currentDynamic );
	end

	function restoreDynamicsState( state )
		currentDynamic = state.currentDynamic;
	end

	function continueDynamicsState( state ) %#ok<INUSD>
	end

%% SUSTAIN

sustainOnProgress = false;

	function state = getSustainState()
		state = struct( 'sustainOnProgress', sustainOnProgress );
	end

	function restoreSustainState( state )
		sustainOnProgress = state.sustainOnProgress;
	end

	function continueSustainState( state ) %#ok<INUSD>
	end

%% MARKERS

markers = struct( ...
	'name', {}, ...
	'time', {}, ...
	'meterState', {} );

currentMarker = '';
sinceLastMarker = [];

	function initMarker()
		currentMarker = '';
		sinceLastMarker = [];
	end

	function addMarker( note )
		
		if note.goto
			
			idx = find( roundDuration([markers.time]-currentTime)>=0 & strcmp(note.marker,{markers.name}), 1, 'first' );
			
			if isempty( idx )
				throwError( 'CACOFONIX:MarkerNotFound', ...
					'No marker %s after the %s found (%s).', ...
					note.marker, getCurrentMeasureInfo(), getCurrentSheetInfo() );
			else
				currentTime = markers( idx ).time;
				restoreMeterState( markers( idx ).meterState );
			end
			
		else
			
			idx = roundDuration(currentTime-[markers.time])==0 & strcmp(note.marker,{markers.name});
			
			if ~any( idx )
				if isempty( markers ) || roundDuration( currentTime - markers(end).time ) >= 0
					markers = [ markers struct( ...
						'name', note.marker, ...
						'time', roundDuration( currentTime ), ...
						'meterState', getMeterState() ) ];
				else
					throwError( 'CACOFONIX:MarkerMisplaced', ...
						'The marker %s does not match an existing marker (%s, %s).', ...
						note.marker, getCurrentMeasureInfo(), getCurrentSheetInfo() );
				end
			end
			
		end
		
		currentMarker = note.marker;
		sinceLastMarker = 0;
		
	end

	function state = getMarkerState()
		state = struct( 'currentMarker', currentMarker, 'sinceLastMarker', sinceLastMarker );
	end

	function restoreMarkerState( state )
		currentMarker = state.currentMarker;
		sinceLastMarker = state.sinceLastMarker;
	end

	function continueMarkerState( state ) %#ok<INUSD>
	end

	function m = getMarkersEvent()
		m = markers;
	end

%% BARS AND METERS

timesBars = [];
measureDuration = NaN;

numCurrentMeasure = 0;
currentNbBeat = [];
currentMeter = [];

	function initBarSync()
		numCurrentMeasure = 1;
	end

	function synchronizeBar()
		
		if numCurrentMeasure == 1
			
			nbBeat = roundDuration( currentTime );
			
			if isnan( measureDuration(1) )
				% set first measure (can be anacrusis)
				
				timesBars(1) = nbBeat;
				measureDuration(1) = nbBeat;
				
			elseif roundDuration( nbBeat - measureDuration(1) ) ~= 0
				throwError( 'CACOFONIX:MEASURE', ...
					'The first measure of the %s is incorrect.', getCurrentSheetInfo() );
			end
			
		else
			
			% if not defined, set the number of beats per measure
			if numCurrentMeasure == 2 && isempty( currentNbBeat )
				currentNbBeat = roundDuration( currentTime - timesBars(1) );
			end
			
		end
		
		if length( timesBars ) < numCurrentMeasure
			
			% get last bar time
			lastTimeBar = timesBars(numCurrentMeasure-1);
			
			% check measure length
			nbBeat = roundDuration( currentTime - lastTimeBar );
			if roundDuration( nbBeat - currentNbBeat ) ~= 0
				throwError( 'CACOFONIX:MEASURE', ...
					'The %s of the %s is incorrect.', ...
					getCurrentMeasureInfo(), getCurrentSheetInfo() );
			end
			
			% add time
			timesBars(numCurrentMeasure) = roundDuration(currentTime);
			measureDuration(numCurrentMeasure) = nbBeat;
			
		else
			
			% check measure length
			if roundDuration( currentTime - timesBars(numCurrentMeasure) ) ~= 0
				throwError( 'CACOFONIX:MEASURE', ...
					'The %s of the %s is incorrect.', ...
					getCurrentMeasureInfo(), getCurrentSheetInfo() );
			end
			
			% resynchronize currentTime
			currentTime = timesBars( numCurrentMeasure );
			
		end
		
		% next measure
		numCurrentMeasure = numCurrentMeasure + 1;
		sinceLastMarker = sinceLastMarker + 1;
		
	end

	function setMeter( meter )
		currentMeter = meter;
		currentNbBeat = 4 * currentMeter(1) / currentMeter(2);
	end

	function state = getMeterState()
		state = struct( ...
			'numCurrentMeasure', numCurrentMeasure, ...
			'currentNbBeat', currentNbBeat, ...
			'currentMeter', currentMeter );
	end

	function restoreMeterState( state )
		numCurrentMeasure = state.numCurrentMeasure;
		currentNbBeat = state.currentNbBeat;
		currentMeter = state.currentMeter;
	end

	function continueMeterState( state ) %#ok<INUSD>
	end

%% TEMPO

tempoEvt = repmat( struct( ...
	'time', [], ...
	'tempo', [] ), 1, 0 );

	function addTempo( times, tempo )
		
		t = [ tempoEvt.time ];
		tempoEvt( t >= min( times ) ) = [];
		
		tempoEvt = [ tempoEvt struct( ...
			'time', num2cell( times ), ...
			'tempo', num2cell( tempo ) ) ];
		
	end

	function finalTempo = getTempoEvents()
		
		finalTempo = tempoEvt;
		
		if isempty( finalTempo )
			return
		end
		
		times = [ finalTempo.time ];
		eq = [ diff( times )==0 false ];
		finalTempo( eq ) = [];
		
		tempos = [ finalTempo.tempo ];
		eq = [ false diff( tempos )==0 ];
		finalTempo( eq ) = [];
		
	end

	function currentTempo = getCurrentTempo()
		if isempty( tempoEvt )
			currentTempo = defaultTempo;
		else
			index = find( currentTime >= [ tempoEvt.time ], 1, 'last' );
			currentTempo = tempoEvt( index ).tempo;
		end
	end

%% NOTES UTILITIES (addNote, notesReader)

	function durationPlay = getDurationPlay( duration )
		if duration * detachSeparatorLim > detachSeparatorFix
			durationPlay = duration - detachSeparatorFix;
		else
			durationPlay = duration * (1-detachSeparatorLim);
		end
	end

	function createNote( note )
		
		tonality = note.tonality;
		
		if isfinite( tonality )
			
			tonality = getTonality( note );
			accent = note.accent;
			duration = note.duration;
			dynamics = getCurrentDynamics( note );
			isTied = note.isTied;
			isArpeggiated = note.isArpeggiated;
			
			isAdded = false;
			
			if isTied
				
				indexTime = roundDuration( [ notes(1:nbNotes).stop ] - currentTime ) == 0;
				
				if ~isnan( note.isDetached ) && ~note.isDetached
					% if the note is not detached, search the previous note
					% with the same tonality and prolongate it. If no note
					% is found, prolongate all.
					
					indexTonality = arrayfun( @(n)isequal( n.tonality, tonality ), notes(1:nbNotes) );
					index = find( indexTime & indexTonality, 1, 'last' );
					
					if ~isempty( index )
						notes( index ).stop = currentTime + duration;
						duration = notes( index ).stop - notes( index ).start;
						
						notes( index ).stopPlay = notes( index ).start + getDurationPlay( duration );
						
						isAdded = true;
					end
					
				end
				
				if ~isAdded && any( indexTime )
					% prolongate all
					[ notes( indexTime ).stopPlay ] = deal( currentTime );
				end
				
			end
			
			if ~isAdded
				
				start = currentTime;
				startPlay = currentTime;
				stop = start + duration;
				stopPlay = startPlay + duration;
				
				if accent == 0
					stopPlay = startPlay + getDurationPlay( duration );
					
				elseif accent == 1 % '.' staccato
					stopPlay = startPlay + duration / 2;
					
				elseif accent == 2 % '^' marcato
					stopPlay = startPlay + duration / 2;
					dynamics = dynamics + 1;
					
				elseif accent == 3 % '>' accent
					stopPlay = startPlay + getDurationPlay( duration );
					dynamics = dynamics + 1;
					
				elseif accent == 4 % '-' tenuto
					if duration * 2*detachSeparatorLim > 2*detachSeparatorFix
						sep = detachSeparatorFix;
					else
						sep = duration * detachSeparatorLim;
					end
					startPlay = currentTime + sep;
					stopPlay = currentTime + duration - sep;
					dynamics = dynamics + 1;
					
				end
				
				if isArpeggiated
					
					nbTon = length( tonality );
					delta = deltaArpeggio;
					
					if nbTon*delta > stopPlay - startPlay
						delta = ( stopPlay - startPlay ) / nbTon;
					end
					
					startPlay = delta*(0:nbTon-1)/(nbTon-1) + startPlay;
					
				end
				
				addNote( tonality, dynamics, start, stop, startPlay, stopPlay )
				
			end
			
		end
		
	end

	function notesReader( notes )
		
		states = struct( ...
			'currentTime', {}, ...
			'tonality', {}, ...
			'dynamics', {}, ...
			'sustain', {}, ...
			'marker', {}, ...
			'meter', {} );
		function createState()
			states = [ states struct( ...
				'currentTime', currentTime, ...
				'tonality', getTonalityState(), ...
				'dynamics', getDynamicsState(), ...
				'sustain', getSustainState(), ...
				'marker', getMarkerState(), ...
				'meter', getMeterState() ) ];
		end
		function restoreState()
			state = states( end );
			currentTime = state.currentTime;
			restoreTonalityState( state.tonality );
			restoreDynamicsState( state.dynamics );
			restoreSustainState( state.sustain );
			restoreMarkerState( state.marker );
			restoreMeterState( state.meter );
		end
		function continueState()
			state = states( end );
			continueTonalityState( state.tonality );
			continueDynamicsState( state.dynamics );
			continueSustainState( state.sustain );
			continueMarkerState( state.marker );
			continueMeterState( state.meter );
			states(end) = [];
		end
		
		nbNotesToRead = length( notes );
		n = 0;
		while n < nbNotesToRead
			n = n+1;
			
			note = notes(n);
			
			if note.isNote
				createNote( note )
				currentTime = currentTime + note.duration;
				
			elseif note.isBar
				synchronizeBar();
				
			elseif note.defMeter
				setMeter( note.meter );
				
			elseif note.defOctave
				setOctave( note );
				
			elseif note.defDynamics
				setDynamics( note );
				
			elseif note.defSustain
				if note.startSustain
					if sustainOnProgress
						addEvent( SUSTAIN, currentTime-deltaSustain, false );
					end
					addEvent( SUSTAIN, currentTime, true );
					sustainOnProgress = true;
				else
					addEvent( SUSTAIN, currentTime, false );
					sustainOnProgress = false;
				end
				
			elseif note.defTempo
				addTempo( currentTime, note.tempo );
				
			elseif note.defFermata
				currentTempo = getCurrentTempo();
				dur = note.fermataDuration;
				played = note.fermataPlayedDuration;
				addTempo( [ currentTime currentTime + dur ], [ currentTempo*dur/played currentTempo ] );
				
			elseif note.defModifiedTempo
				currentTempo = getCurrentTempo();
				transi = note.transitionDuration;
				endTempo = note.endTempo;
				addTempo( linspace( currentTime, currentTime+transi, tempoSample ), ...
					linspace( currentTempo, endTempo, tempoSample ) );
				
			elseif note.isMarker
				addMarker( note );
				
			elseif note.parallelStart
				
				createState();
				
				n = n+1;
				startIndex = n;
				
				level = 0;
				
				while ~notes(n).parallelEnd || level ~= 0;
					
					if notes(n).parallelNext && level == 0;
						notesReader( notes( startIndex:n-1 ) );
						restoreState();
						startIndex = n + 1;
					elseif notes(n).parallelStart
						level = level + 1;
					elseif notes(n).parallelEnd
						level = level - 1;
					end
					
					n = n+1;
				end
				
				notesReader( notes( startIndex:n-1 ) );
				continueState();
				
			end
			
		end
		
	end

%% MAIN

maxDuration = deltaStartAndEndTrack;

% read sheets
for numCurrentSheet = 1:nbSheets
	
	initEvents();
	initNotes();
	initOctave();
	initDynamics();
	initMarker();
	initBarSync();
	
	currentTime = deltaStartAndEndTrack;
	
	if ~isempty( sheets(numCurrentSheet).instrument )
		addEvent( PROGRAM, 0, sheets(numCurrentSheet).instrument );
	end
	
	if ~isempty( sheets(numCurrentSheet).notes )
		notesReader( sheets(numCurrentSheet).notes );
	end
	
	if numCurrentSheet > 1
		addEvent( END_TRACK, currentTime+deltaStartAndEndTrack );
		maxDuration = max( maxDuration, currentTime+deltaStartAndEndTrack );
	end
	
	% converts channel dynamics to events
	addChannelDynamicsEvents();
	
	% converts notes to events
	convertsNotes2Events()
	
	ev = getEvents();
	
	% sort events
	[toto, index] = sort( [ ev.time ] );
	ev = ev( index );
	
	sheets(numCurrentSheet).events = ev;
	
end

% adjust first sheet

initEvents();

% converts tempo events to events
tempoEvt = getTempoEvents();
if isempty( tempoEvt ) || tempoEvt(1).time ~= 0
	% add default tempo
	addEvent( TEMPO, 0, defaultTempo );
end
for ii = 1:length( tempoEvt )
	addEvent( TEMPO, tempoEvt(ii).time, tempoEvt(ii).tempo );
end

% get markers
markersEvt = getMarkersEvent();
for ii = 1:length( markersEvt )
	addEvent( MARKER, markersEvt(ii).time, markersEvt(ii).name );
end

addEvent( END_TRACK, maxDuration );

% reorganize events
ev = [ sheets(1).events getEvents() ];
[ toto, index ] = sort( [ ev.time ] );
sheets(1).events = ev( index );

% adjust channel volume

maxValue = 127;
allEvents = [ sheets.events ];
volumeIdx = strcmp( VOLUME, { allEvents.name } );
if any( volumeIdx )
	maxValue = max( [ allEvents( volumeIdx ).arg1 ] );
end

for ii = 1:length( sheets )
	
	ev = sheets(ii).events;
	volumeIdx = strcmp( VOLUME, { ev.name } );
	if any( volumeIdx )
		values = num2cell( [ ev( volumeIdx ).arg1 ] - maxValue + 127 );
		[ sheets(ii).events( volumeIdx ).arg1 ] = deal( values{:} );
	end
	
end


%% ### CONVERTS EVENTS TO HEXA-CODE

% converts delta time to hexa
	function value = convDeltaTime( value )
		str = dec2bin( round( value ) )';
		str = reshape( [ repmat( '0', 7 - mod( length(str), 7 ), 1 ); str ], 7, [] );
		str = [ repmat( '1', 1, size(str,2)-1 ) '0'; str ];
		value = bin2dec( str' )';
	end

prevTime = 0;

	function [hexa, len] = getHexa( time, hexaEvt, varargin )
		% getHexa( 'init' )
		% [ hexa, len ] = getHexa( time, hexaEvt, [arg, len], ... )
		
		if ischar( time ) && strcmp( time, 'init' )
			prevTime = 0;
			return
		end
		
		deltaTime = convDeltaTime( (time - prevTime)*deltaTimeTicks );
		lenDeltaTime = ones( 1, length( deltaTime ) );
		prevTime = time;
		
		args = varargin(1:2:end);
		lenArgs = varargin(2:2:end);
		
		hexa = [ deltaTime hexaEvt args{:} ];
		len = [ lenDeltaTime ones(1, length( hexaEvt ) ) lenArgs{:} ];
		
	end

for ii = 1:nbSheets
	
	getHexa( 'init' );
	
	channel = sheets( ii ).channel;
	events = sheets( ii ).events;
	nbEvents = length( events );
	
	bin = repmat( struct( 'hexa', [], 'len', [] ), 1, nbEvents );
	
	for jj = 1:nbEvents
		
		ev = events(jj);
		
		switch ev.name
			
			case NOTE_OFF
				[ bin(jj).hexa bin(jj).len] = getHexa( ev.time, 128+channel, ev.arg1, 1, ev.arg2, 1 );
			case NOTE_ON
				[ bin(jj).hexa bin(jj).len] = getHexa( ev.time, 144+channel, ev.arg1, 1, ev.arg2, 1 );
				
			case TEMPO
				[ bin(jj).hexa bin(jj).len] = getHexa( ev.time, [255 81 3], 60000000 / ev.arg1, 3 );
				
			case VOLUME
				[ bin(jj).hexa bin(jj).len] = getHexa( ev.time, [ 176+channel 7 ], ev.arg1, 1 );
				
			case SUSTAIN
				[ bin(jj).hexa bin(jj).len] = getHexa( ev.time, [ 176+channel 64 ], 127*ev.arg1, 1 );
				
			case PROGRAM
				[ bin(jj).hexa bin(jj).len ] = getHexa( ev.time, 192+channel, ev.arg1, 1 );
				
			case MARKER
				marker = ev.arg1; lMarker = length( marker );
				[ bin(jj).hexa bin(jj).len] = getHexa( ev.time, [255 6 lMarker ], marker+0, ones(1,lMarker) );
				
			case END_TRACK
				[ bin(jj).hexa bin(jj).len] = getHexa( ev.time, [255 47], 0, 1 );
				
		end
		
	end
	
	sheets( ii ).bin = bin;
	
end

%% ### WRITE FILE

MThd = [ 77 84 104 100 ];
MTrk = [ 77 84 114 107 ];

fid = fopen( filepath, 'w', 'b' );

if fid == -1
	throwError( 'CACOFONIX:UnableToOpenFile', ...
		'Unable to open the file %s', filepath );
end

	function writeMidi( format, A )
		fwrite( fid, A, sprintf( 'ubit%d', format*8 ) );
	end

% Header Chunk
writeMidi( 1, MThd );
writeMidi( 4, 6 );
writeMidi( 2, 1 );
writeMidi( 2, nbSheets );
writeMidi( 2, deltaTimeTicks );

% Track Chunk

for ii = 1:nbSheets
	
	hexa = [ sheets(ii).bin.hexa ];
	len = [ sheets(ii).bin.len ];
	
	writeMidi( 1, MTrk );
	writeMidi( 4, sum( len ) );
	
	for jj = 1:length( hexa )
		writeMidi( len(jj), hexa(jj) );
	end
	
end

fclose( fid );

end
