%CACOFONIX creates a midi file from a set of Note arrays.
%	cacofonix( files, ... ) specify the output file.
%
%	cacofonix( ..., mainSheet, ... ) (without playable notes) defines a
%	main sheet.
%
%	cacofonix( ..., sheet, ... ) (with playable notes) defines a piano
%	sheet.
%
%	cacofonix( ..., instrument, sheet1, sheet2, ... ) defines sheets for a
%	particular instrument.
%
%	cacofonix( ..., 'Tempo', tempo, ... ) sets the default tempo
%
%	cacofonix( ..., 'Velocity', velocities, ... ) maps plain dynamics to
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

deltaArpeggio = 0.15;

crescendoSampling = 0.25;

tempoSample = 10;

pitchSampling = 0.01;
nbMinSampling = 20;

deltaTimeTicks = prod( [ 2 2 2 2 2 3 3 5 ] );

deltaSustain = 0.001;

deltaStartAndEndTrack = 0.001;

persistent finishAlert
if isempty( finishAlert )
	y = []; Fs = [];
	load train
	finishAlert = struct( 'y', y/10, 'Fs', Fs );
	clear y Fs
end

%% Instruments

persistent INSTRUMENTS PERCUSSIONS DRUMKITS
if isempty( INSTRUMENTS )
	
	INSTRUMENTS = [ ...
		struct( 'name', 'Piano',						'patch', 0,		'bank', 0 )
		struct( 'name', 'Acoustic Grand Piano',			'patch', 0,		'bank', 0 )
		struct( 'name', 'Wide Acoustic Grand Piano',	'patch', 0,		'bank', 1 )
		struct( 'name', 'Dark Acoustic Grand Piano',	'patch', 0,		'bank', 2 )
		struct( 'name', 'Bright Acoustic Piano',		'patch', 1,		'bank', 0 )
		struct( 'name', 'Wide Bright Acoustic Piano',	'patch', 1,		'bank', 1 )
		struct( 'name', 'Electric Grand Piano',			'patch', 2,		'bank', 0 )
		struct( 'name', 'Wide Electric Grand Pinao',	'patch', 2,		'bank', 1 )
		struct( 'name', 'Honky-tonk Piano',				'patch', 3,		'bank', 0 )
		struct( 'name', 'Wide Honky-tonk Piano',		'patch', 3,		'bank', 1 )
		struct( 'name', 'Rhodes Piano',					'patch', 4,		'bank', 0 )
		struct( 'name', 'Detuned Electric Piano 1',		'patch', 4,		'bank', 1 )
		struct( 'name', 'Electric Piano 1 Variation',	'patch', 4,		'bank', 2 )
		struct( 'name', '60s Electric Piano',			'patch', 4,		'bank', 3 )
		struct( 'name', 'Chorused Electric Piano',		'patch', 5,		'bank', 0 )
		struct( 'name', 'Detuned Electric Piano 2',		'patch', 5,		'bank', 1 )
		struct( 'name', 'Electric Piano 2 Variation',	'patch', 5,		'bank', 2 )
		struct( 'name', 'Electric Piano Legend',		'patch', 5,		'bank', 3 )
		struct( 'name', 'Electric Piano Phase',			'patch', 5,		'bank', 4 )
		struct( 'name', 'Harpsichord',					'patch', 6,		'bank', 0 )
		struct( 'name', 'Coupled Harpsichord',			'patch', 6,		'bank', 1 )
		struct( 'name', 'Wide Harpsichord',				'patch', 6,		'bank', 2 )
		struct( 'name', 'Open Harpsichord',				'patch', 6,		'bank', 3 )
		struct( 'name', 'Clavinet',						'patch', 7,		'bank', 0 )
		struct( 'name', 'Pulse Clavinet',				'patch', 7,		'bank', 1 )
		struct( 'name', 'Celesta',						'patch', 8,		'bank', 0 )
		struct( 'name', 'Glockenspiel',					'patch', 9,		'bank', 0 )
		struct( 'name', 'Music Box',					'patch', 10,	'bank', 0 )
		struct( 'name', 'Vibraphone',					'patch', 11,	'bank', 0 )
		struct( 'name', 'Wet Vibraphone',				'patch', 11,	'bank', 1 )
		struct( 'name', 'Marimba',						'patch', 12,	'bank', 0 )
		struct( 'name', 'Wide Marimba',					'patch', 12,	'bank', 1 )
		struct( 'name', 'Xylophone',					'patch', 13,	'bank', 0 )
		struct( 'name', 'Tubular Bell',					'patch', 14,	'bank', 0 )
		struct( 'name', 'Church Bell',					'patch', 14,	'bank', 1 )
		struct( 'name', 'Carillon',						'patch', 14,	'bank', 2 )
		struct( 'name', 'Santur',						'patch', 15,	'bank', 0 )
		struct( 'name', 'Hammond Organ',				'patch', 16,	'bank', 0 )
		struct( 'name', 'Detuned Organ',				'patch', 16,	'bank', 1 )
		struct( 'name', '60s Organ',					'patch', 16,	'bank', 2 )
		struct( 'name', 'Organ 4',						'patch', 16,	'bank', 3 )
		struct( 'name', 'Percussive Organ',				'patch', 17,	'bank', 0 )
		struct( 'name', 'Detuned Organ 2',				'patch', 17,	'bank', 1 )
		struct( 'name', 'Organ 5',						'patch', 17,	'bank', 2 )
		struct( 'name', 'Rock Organ',					'patch', 18,	'bank', 0 )
		struct( 'name', 'Church Organ 1',				'patch', 19,	'bank', 0 )
		struct( 'name', 'Church Organ 2',				'patch', 19,	'bank', 1 )
		struct( 'name', 'Church Organ 3',				'patch', 19,	'bank', 2 )
		struct( 'name', 'Reed Organ',					'patch', 20,	'bank', 0 )
		struct( 'name', 'Puff Organ',					'patch', 20,	'bank', 1 )
		struct( 'name', 'French Accordion',				'patch', 21,	'bank', 0 )
		struct( 'name', 'Italian Accordion',			'patch', 21,	'bank', 1 )
		struct( 'name', 'Harmonica',					'patch', 22,	'bank', 0 )
		struct( 'name', 'Bandoneon',					'patch', 23,	'bank', 0 )
		struct( 'name', 'Nylon-String Guitar',			'patch', 24,	'bank', 0 )
		struct( 'name', 'Ukulele',						'patch', 24,	'bank', 1 )
		struct( 'name', 'Open Nylon Guitar',			'patch', 24,	'bank', 2 )
		struct( 'name', 'Nylon Guitar 2',				'patch', 24,	'bank', 3 )
		struct( 'name', 'Steel-String Guitar',			'patch', 25,	'bank', 0 )
		struct( 'name', '12-String Guitar',				'patch', 25,	'bank', 1 )
		struct( 'name', 'Mandolin',						'patch', 25,	'bank', 2 )
		struct( 'name', 'Steel + Body',					'patch', 25,	'bank', 3 )
		struct( 'name', 'Jazz Guitar',					'patch', 26,	'bank', 0 )
		struct( 'name', 'Hawaiian Guitar',				'patch', 26,	'bank', 1 )
		struct( 'name', 'Clean Electric Guitar',		'patch', 27,	'bank', 0 )
		struct( 'name', 'Chorus Guitar',				'patch', 27,	'bank', 1 )
		struct( 'name', 'Mid Tone Guitar',				'patch', 27,	'bank', 2 )
		struct( 'name', 'Muted Electric Guitar',		'patch', 28,	'bank', 0 )
		struct( 'name', 'Funk Guitar',					'patch', 28,	'bank', 1 )
		struct( 'name', 'Funk Guitar 2',				'patch', 28,	'bank', 2 )
		struct( 'name', 'Jazz Man',						'patch', 28,	'bank', 3 )
		struct( 'name', 'Overdriven Guitar',			'patch', 29,	'bank', 0 )
		struct( 'name', 'Guitar Pinch',					'patch', 29,	'bank', 1 )
		struct( 'name', 'Distortion Guitar',			'patch', 30,	'bank', 0 )
		struct( 'name', 'Feedback Guitar',				'patch', 30,	'bank', 1 )
		struct( 'name', 'Distortion Rtm Guitar',		'patch', 30,	'bank', 2 )
		struct( 'name', 'Guitar Harmonics',				'patch', 31,	'bank', 0 )
		struct( 'name', 'Guitar Feedback',				'patch', 31,	'bank', 1 )
		struct( 'name', 'Acoustic Bass',				'patch', 32,	'bank', 0 )
		struct( 'name', 'Fingered Bass',				'patch', 33,	'bank', 0 )
		struct( 'name', 'Finger Slap',					'patch', 33,	'bank', 1 )
		struct( 'name', 'Picked Bass',					'patch', 34,	'bank', 0 )
		struct( 'name', 'Fretless Bass',				'patch', 35,	'bank', 0 )
		struct( 'name', 'Slap Bass 1',					'patch', 36,	'bank', 0 )
		struct( 'name', 'Slap Bass 2',					'patch', 37,	'bank', 0 )
		struct( 'name', 'Synth Bass 1',					'patch', 38,	'bank', 0 )
		struct( 'name', 'Synth Bass 101',				'patch', 38,	'bank', 1 )
		struct( 'name', 'Synth Bass 3',					'patch', 38,	'bank', 2 )
		struct( 'name', 'Clavi Bass',					'patch', 38,	'bank', 3 )
		struct( 'name', 'Hammer',						'patch', 38,	'bank', 4 )
		struct( 'name', 'Synth Bass 2',					'patch', 39,	'bank', 0 )
		struct( 'name', 'Synth Bass 4',					'patch', 39,	'bank', 1 )
		struct( 'name', 'Rubber Bass',					'patch', 39,	'bank', 2 )
		struct( 'name', 'Attack Pulse',					'patch', 39,	'bank', 3 )
		struct( 'name', 'Violin',						'patch', 40,	'bank', 0 )
		struct( 'name', 'Slow Violin',					'patch', 40,	'bank', 1 )
		struct( 'name', 'Viola',						'patch', 41,	'bank', 0 )
		struct( 'name', 'Cello',						'patch', 42,	'bank', 0 )
		struct( 'name', 'Contrabass',					'patch', 43,	'bank', 0 )
		struct( 'name', 'Tremolo Strings',				'patch', 44,	'bank', 0 )
		struct( 'name', 'Pizzicato Strings',			'patch', 45,	'bank', 0 )
		struct( 'name', 'Harp',							'patch', 46,	'bank', 0 )
		struct( 'name', 'Yang Qin',						'patch', 46,	'bank', 1 )
		struct( 'name', 'Timpani',						'patch', 47,	'bank', 0 )
		struct( 'name', 'String Ensemble',				'patch', 48,	'bank', 0 )
		struct( 'name', 'Orchestra Strings',			'patch', 48,	'bank', 1 )
		struct( 'name', '60s Strings',					'patch', 48,	'bank', 2 )
		struct( 'name', 'Slow String Ensemble',			'patch', 49,	'bank', 0 )
		struct( 'name', 'Synth Strings 1',				'patch', 50,	'bank', 0 )
		struct( 'name', 'Synth Strings 3',				'patch', 50,	'bank', 1 )
		struct( 'name', 'Synth Strings 2',				'patch', 51,	'bank', 0 )
		struct( 'name', 'Choir Aahs',					'patch', 52,	'bank', 0 )
		struct( 'name', 'Choir Aahs 2',					'patch', 52,	'bank', 1 )
		struct( 'name', 'Voice Oohs',					'patch', 53,	'bank', 0 )
		struct( 'name', 'Humming',						'patch', 53,	'bank', 1 )
		struct( 'name', 'Synth Voice',					'patch', 54,	'bank', 0 )
		struct( 'name', 'Analog Voice',					'patch', 54,	'bank', 1 )
		struct( 'name', 'Orchestra Hit',				'patch', 55,	'bank', 0 )
		struct( 'name', 'Bass Hit',						'patch', 55,	'bank', 1 )
		struct( 'name', '6th Hit',						'patch', 55,	'bank', 2 )
		struct( 'name', 'Euro Hit',						'patch', 55,	'bank', 3 )
		struct( 'name', 'Trumpet',						'patch', 56,	'bank', 0 )
		struct( 'name', 'Dark Trumpet',					'patch', 56,	'bank', 1 )
		struct( 'name', 'Trombone',						'patch', 57,	'bank', 0 )
		struct( 'name', 'Trombone 2',					'patch', 57,	'bank', 1 )
		struct( 'name', 'Bright Trombone',				'patch', 57,	'bank', 2 )
		struct( 'name', 'Tuba',							'patch', 58,	'bank', 0 )
		struct( 'name', 'Muted Trumpet',				'patch', 59,	'bank', 0 )
		struct( 'name', 'Muted Trumpet 2',				'patch', 59,	'bank', 1 )
		struct( 'name', 'French Horns',					'patch', 60,	'bank', 0 )
		struct( 'name', 'French Horn 2',				'patch', 60,	'bank', 1 )
		struct( 'name', 'Brass Section 1',				'patch', 61,	'bank', 0 )
		struct( 'name', 'Brass Section 2',				'patch', 61,	'bank', 1 )
		struct( 'name', 'Synth Brass 1',				'patch', 62,	'bank', 0 )
		struct( 'name', 'Synth Brass 3',				'patch', 62,	'bank', 1 )
		struct( 'name', 'Analog Brass 1',				'patch', 62,	'bank', 2 )
		struct( 'name', 'Jump Brass',					'patch', 62,	'bank', 3 )
		struct( 'name', 'Synth Brass 2',				'patch', 63,	'bank', 0 )
		struct( 'name', 'Synth Brass 4',				'patch', 63,	'bank', 1 )
		struct( 'name', 'Analog Brass 2',				'patch', 63,	'bank', 2 )
		struct( 'name', 'Soprano Sax',					'patch', 64,	'bank', 0 )
		struct( 'name', 'Alto Sax',						'patch', 65,	'bank', 0 )
		struct( 'name', 'Tenor Sax',					'patch', 66,	'bank', 0 )
		struct( 'name', 'Baritone Sax',					'patch', 67,	'bank', 0 )
		struct( 'name', 'Oboe',							'patch', 68,	'bank', 0 )
		struct( 'name', 'English Horn',					'patch', 69,	'bank', 0 )
		struct( 'name', 'Bassoon',						'patch', 70,	'bank', 0 )
		struct( 'name', 'Clarinet',						'patch', 71,	'bank', 0 )
		struct( 'name', 'Piccolo',						'patch', 72,	'bank', 0 )
		struct( 'name', 'Flute',						'patch', 73,	'bank', 0 )
		struct( 'name', 'Recorder',						'patch', 74,	'bank', 0 )
		struct( 'name', 'Pan Flute',					'patch', 75,	'bank', 0 )
		struct( 'name', 'Bottle Blow',					'patch', 76,	'bank', 0 )
		struct( 'name', 'Shakuhachi',					'patch', 77,	'bank', 0 )
		struct( 'name', 'Whistle',						'patch', 78,	'bank', 0 )
		struct( 'name', 'Ocarina',						'patch', 79,	'bank', 0 )
		struct( 'name', 'Square Lead',					'patch', 80,	'bank', 0 )
		struct( 'name', 'Square Wave',					'patch', 80,	'bank', 1 )
		struct( 'name', 'Sine Wave',					'patch', 80,	'bank', 2 )
		struct( 'name', 'Saw Lead',						'patch', 81,	'bank', 0 )
		struct( 'name', 'Saw Wave',						'patch', 81,	'bank', 1 )
		struct( 'name', 'Doctor Solo',					'patch', 81,	'bank', 2 )
		struct( 'name', 'Natural Lead',					'patch', 81,	'bank', 3 )
		struct( 'name', 'Sequenced Saw',				'patch', 81,	'bank', 4 )
		struct( 'name', 'Synth Calliope',				'patch', 82,	'bank', 0 )
		struct( 'name', 'Chiffer Lead',					'patch', 83,	'bank', 0 )
		struct( 'name', 'Charang',						'patch', 84,	'bank', 0 )
		struct( 'name', 'Wire Lead',					'patch', 84,	'bank', 1 )
		struct( 'name', 'Solo Synth Vox',				'patch', 85,	'bank', 0 )
		struct( 'name', '5th Saw Wave',					'patch', 86,	'bank', 0 )
		struct( 'name', 'Bass & Lead',					'patch', 87,	'bank', 0 )
		struct( 'name', 'Delayed Lead',					'patch', 87,	'bank', 1 )
		struct( 'name', 'Fantasia Pad',					'patch', 88,	'bank', 0 )
		struct( 'name', 'Warm Pad',						'patch', 89,	'bank', 0 )
		struct( 'name', 'Sine Pad',						'patch', 89,	'bank', 1 )
		struct( 'name', 'Polysynth Pad',				'patch', 90,	'bank', 0 )
		struct( 'name', 'Space Voice Pad',				'patch', 91,	'bank', 0 )
		struct( 'name', 'Itopia',						'patch', 91,	'bank', 1 )
		struct( 'name', 'Bowed Glass Pad',				'patch', 92,	'bank', 0 )
		struct( 'name', 'Metal Pad',					'patch', 93,	'bank', 0 )
		struct( 'name', 'Halo Pad',						'patch', 94,	'bank', 0 )
		struct( 'name', 'Sweep Pad',					'patch', 95,	'bank', 0 )
		struct( 'name', 'Ice Rain',						'patch', 96,	'bank', 0 )
		struct( 'name', 'Soundtrack',					'patch', 97,	'bank', 0 )
		struct( 'name', 'Crystal',						'patch', 98,	'bank', 0 )
		struct( 'name', 'Synth Mallet',					'patch', 98,	'bank', 1 )
		struct( 'name', 'Atmosphere',					'patch', 99,	'bank', 0 )
		struct( 'name', 'Brightness',					'patch', 100,	'bank', 0 )
		struct( 'name', 'Goblin',						'patch', 101,	'bank', 0 )
		struct( 'name', 'Echo Drops',					'patch', 102,	'bank', 0 )
		struct( 'name', 'Echo Bell',					'patch', 102,	'bank', 1 )
		struct( 'name', 'Echo Pan',						'patch', 102,	'bank', 2 )
		struct( 'name', 'Star Theme',					'patch', 103,	'bank', 0 )
		struct( 'name', 'Sitar',						'patch', 104,	'bank', 0 )
		struct( 'name', 'Sitar 2',						'patch', 104,	'bank', 1 )
		struct( 'name', 'Banjo',						'patch', 105,	'bank', 0 )
		struct( 'name', 'Shamisen',						'patch', 106,	'bank', 0 )
		struct( 'name', 'Koto',							'patch', 107,	'bank', 0 )
		struct( 'name', 'Taisho Koto',					'patch', 107,	'bank', 1 )
		struct( 'name', 'Kalimba',						'patch', 108,	'bank', 0 )
		struct( 'name', 'Bagpipe',						'patch', 109,	'bank', 0 )
		struct( 'name', 'Fiddle',						'patch', 110,	'bank', 0 )
		struct( 'name', 'Shanai',						'patch', 111,	'bank', 0 )
		struct( 'name', 'Tinkle Bell',					'patch', 112,	'bank', 0 )
		struct( 'name', 'Agogo',						'patch', 113,	'bank', 0 )
		struct( 'name', 'Steel Drums',					'patch', 114,	'bank', 0 )
		struct( 'name', 'Woodblock',					'patch', 115,	'bank', 0 )
		struct( 'name', 'Castanets',					'patch', 115,	'bank', 1 )
		struct( 'name', 'Taiko',						'patch', 116,	'bank', 0 )
		struct( 'name', 'Concert Bass Drum',			'patch', 116,	'bank', 1 )
		struct( 'name', 'Melodic Tom 1',				'patch', 117,	'bank', 0 )
		struct( 'name', 'Melodic Tom 2',				'patch', 117,	'bank', 1 )
		struct( 'name', 'Synth Drum',					'patch', 118,	'bank', 0 )
		struct( 'name', '808 Tom',						'patch', 118,	'bank', 1 )
		struct( 'name', 'Electric Percussion',			'patch', 118,	'bank', 2 )
		struct( 'name', 'Reverse Cymbal',				'patch', 119,	'bank', 0 )
		struct( 'name', 'Guitar Fret Noise',			'patch', 120,	'bank', 0 )
		struct( 'name', 'Guitar Cut Noise',				'patch', 120,	'bank', 1 )
		struct( 'name', 'String Slap',					'patch', 120,	'bank', 2 )
		struct( 'name', 'Breath Noise',					'patch', 121,	'bank', 0 )
		struct( 'name', 'Flute Key Click',				'patch', 121,	'bank', 1 )
		struct( 'name', 'Seashore',						'patch', 122,	'bank', 0 )
		struct( 'name', 'Rain',							'patch', 122,	'bank', 1 )
		struct( 'name', 'Thunder',						'patch', 122,	'bank', 2 )
		struct( 'name', 'Wind',							'patch', 122,	'bank', 3 )
		struct( 'name', 'Stream',						'patch', 122,	'bank', 4 )
		struct( 'name', 'Bubble',						'patch', 122,	'bank', 5 )
		struct( 'name', 'Bird',							'patch', 123,	'bank', 0 )
		struct( 'name', 'Dog',							'patch', 123,	'bank', 1 )
		struct( 'name', 'Horse-Gallop',					'patch', 123,	'bank', 2 )
		struct( 'name', 'Bird 2',						'patch', 123,	'bank', 3 )
		struct( 'name', 'Telephone 1',					'patch', 124,	'bank', 0 )
		struct( 'name', 'Telephone 2',					'patch', 124,	'bank', 1 )
		struct( 'name', 'Door Creaking',				'patch', 124,	'bank', 2 )
		struct( 'name', 'Door Closing',					'patch', 124,	'bank', 3 )
		struct( 'name', 'Scratch',						'patch', 124,	'bank', 4 )
		struct( 'name', 'Wind Chimes',					'patch', 124,	'bank', 5 )
		struct( 'name', 'Helicopter',					'patch', 125,	'bank', 0 )
		struct( 'name', 'Car-Engine',					'patch', 125,	'bank', 1 )
		struct( 'name', 'Car-Stop',						'patch', 125,	'bank', 2 )
		struct( 'name', 'Car-Pass',						'patch', 125,	'bank', 3 )
		struct( 'name', 'Car-Crash',					'patch', 125,	'bank', 4 )
		struct( 'name', 'Siren',						'patch', 125,	'bank', 5 )
		struct( 'name', 'Train',						'patch', 125,	'bank', 6 )
		struct( 'name', 'Jetplane',						'patch', 125,	'bank', 7 )
		struct( 'name', 'Starship',						'patch', 125,	'bank', 8 )
		struct( 'name', 'Burst Noise',					'patch', 125,	'bank', 9 )
		struct( 'name', 'Applause',						'patch', 126,	'bank', 0 )
		struct( 'name', 'Laughing',						'patch', 126,	'bank', 1 )
		struct( 'name', 'Screaming',					'patch', 126,	'bank', 2 )
		struct( 'name', 'Punch',						'patch', 126,	'bank', 3 )
		struct( 'name', 'Heart Beat',					'patch', 126,	'bank', 4 )
		struct( 'name', 'Footsteps',					'patch', 126,	'bank', 5 )
		struct( 'name', 'Gun Shot',						'patch', 127,	'bank', 0 )
		struct( 'name', 'Machine Gun',					'patch', 127,	'bank', 1 )
		struct( 'name', 'Lasergun',						'patch', 127,	'bank', 2 )
		struct( 'name', 'Explosion',					'patch', 127,	'bank', 3 ) ];

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
	
	DRUMKITS = [ ...
		struct( 'name', 'Standard',				'program', 0 )
		struct( 'name', 'Room',					'program', 8 )
		struct( 'name', 'Power',				'program', 16 )
		struct( 'name', 'Electronic',			'program', 24 )
		struct( 'name', 'TR-808',				'program', 25 )
		struct( 'name', 'Jazz',					'program', 32 )
		struct( 'name', 'Brush',				'program', 40 )
		struct( 'name', 'Orchestra',			'program', 48 )
		struct( 'name', 'Sound FX',				'program', 56 )
		struct( 'name', 'CM-64/CM-32L',			'program', 127 ) ];
	
end

%% ### INPUTS

%% Only display available programs

if nargin >= 1 && ischar( filepath ) && strcmpi( filepath, '-instruments' )
	if nargin == 1
		displayInstruments( INSTRUMENTS( [ INSTRUMENTS.bank ] == 0 ) );
	elseif nargin == 2 && ischar( varargin{1} ) && strcmpi( varargin{1}, '-level2' )
		displayInstruments( INSTRUMENTS );
	else
		throwError( 'CACOFONIX:UnexpectedArgument', 'Unexpected argument' );
	end
	return
end
if nargin >= 1 && ischar( filepath ) && strcmpi( filepath, '-percussions' )
	if nargin == 1
		displayPercussions( PERCUSSIONS(9:55) );
	elseif nargin >= 2 && ischar( varargin{1} ) && strcmpi( varargin{1}, '-level2' )
		displayPercussions( PERCUSSIONS );
	else
		throwError( 'CACOFONIX:UnexpectedArgument', 'Unexpected argument' );
	end
	return
end
if nargin >= 1 && ischar( filepath ) && strcmpi( filepath, '-drumkits' )
	if nargin == 1
		displayDrumkits( DRUMKITS );
	else
		throwError( 'CACOFONIX:UnexpectedArgument', 'Unexpected argument' );
	end
	return
end

	function displayInstruments( instru )
		
		function displayGroup( title, instru )
			fprintf( ' \n - %s -\n', upper(title) );
			fprintf( ' \t%s\n', instru.name );
		end
		
		patchs = [ instru.patch ];
		dispGroup = @( title, s, e )displayGroup( title, instru( s <= patchs & patchs <= e ) );
		
		dispGroup( 'Piano', 0, 7 );
		dispGroup( 'Chromatic Percussion', 8, 15 );
		dispGroup( 'Organ', 16, 23 );
		dispGroup( 'Guitar', 24, 31 );
		dispGroup( 'Bass', 32, 39 );
		dispGroup( 'Orchestra Solo', 40, 47 );
		dispGroup( 'Orchestra Ensemble', 48, 55 );
		dispGroup( 'Brass', 56, 63 );
		dispGroup( 'Reed', 64, 71 );
		dispGroup( 'Wind', 72, 79 );
		dispGroup( 'Synth Lead', 80, 87 );
		dispGroup( 'Synth Pad', 88, 95 );
		dispGroup( 'Synth Sound FX', 96, 103 );
		dispGroup( 'Ethnic', 104, 111 );
		dispGroup( 'Percussive', 112, 119 );
		dispGroup( 'Sound Effect', 120, 127 );
		fprintf( '\n' );
		
	end
	function displayPercussions( percu )
		fprintf( '\n' );
		fprintf( ' \t%s\n', percu.name );
		fprintf( '\n' );
	end
	function displayDrumkits( drums )
		fprintf( '\n' );
		fprintf( ' \t%s\n', drums.name );
		fprintf( '\n' );
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

%% Drum kit

drumkitName = getOption( 'DrumKit', 'Standard' );
idx = find( strcmpi( drumkitName, { DRUMKITS.name } ) );
if isempty( idx )
	throwError( 'CACOFONIX:DRUMKIT', ...
		'Unexpected drum kit:%s', drumkitName );
end

drumKit = DRUMKITS( idx );

%% Sheets

args = varargin;
nbArgs = length( args );

sheets = struct( ...
	'name', {}, ...
	'notes', {}, ...
	'channel', {}, ...
	'instrument', {}, ...
	'events', {}, ...
	'bin', {} );

	function addGeneralSheet( notes )
		sheets = [ struct( ...
			'name', 'Main', ...
			'notes', notes, ...
			'channel', 0, ...
			'instrument', [], ...
			'events', [], ...
			'bin', [] ) sheets ];
	end
	function addSheetInstrument( notes, instrument, channel, numSheet )
		
		if nargin==3, numSheet = 1; end
		
		name = instrument.name;
		if numSheet > 1, name = sprintf( '%s (%d)', name, numSheet ); end
		if numSheet == 2
			sheets(end).name = sprintf( '%s (%d)', sheets(end).name, 1 );
		end
		
		if channel == -1, channel = getAFreeChannel(); end
		
		sheets = [ sheets struct( ...
			'name', name, ...
			'notes', notes, ...
			'channel', channel, ...
			'instrument', instrument, ...
			'events', [], ...
			'bin', [] ) ];
		
		addASheet = @( notes )addSheetInstrument( notes, instrument, channel, numSheet+1 );
		
	end
	function addSheetPercussion( notes, percussion, numSheet )
		
		if nargin==2, numSheet = 1; end
		
		name = percussion.name;
		if numSheet > 1, name = sprintf( '%s (%d)', name, numSheet ); end
		if numSheet == 2
			sheets(end).name = sprintf( '%s (%d)', sheets(end).name, 1 );
		end
		
		ton = percussion.ton; nbTon = length( ton );
		percu = cell( 1, nbTon );
		for iii = 1:nbTon
			percu{iii} = Note( '__SET_TONALITY__', ton(iii) );
		end
		percu = [ percu{:} ];
		
		sheets = [ sheets struct( ...
			'name', name, ...
			'notes', percu * notes, ...
			'channel', 9, ...
			'instrument', [], ...
			'events', [], ...
			'bin', [] ) ];
		
		addASheet = @( notes )addSheetPercussion( notes, percussion, numSheet+1 );
		
	end

addASheet = @( notes )addSheetInstrument( notes, INSTRUMENTS(1), -1 );

firstSheetGeneral = false;

freeChannels = true( 1, 16 );
freeChannels( 10 ) = false;

	function chan = getAFreeChannel()
		chan = find( freeChannels, 1, 'first' ) - 1;
		if isempty( chan )
			throwError( 'CACOFONIX:NoMoreChannels', ...
				'The limit of channels is reached.' );
		end
		freeChannels( chan+1 ) = false;
	end

numArg = 1;
while numArg <= nbArgs
	
	if ischar( args{ numArg } )
		% 'Intrument'|'Percussion', notes
		
		name = args{ numArg };
		
		idxInstrument = find( strcmpi( name, { INSTRUMENTS.name } ), 1 );
		idxPercussion = find( strcmpi( name, { PERCUSSIONS.name } ), 1 );
		
		if isempty( idxInstrument ) && isempty( idxPercussion )
			throwError( 'CACOFONIX:UnexpectedArgument', ...
				'Unexpected argument: %s', name );
		end
		
		numArg = numArg + 1;
		if numArg > nbArgs || ~isa( args{numArg}, 'Note' )
			throwError( 'CACOFONIX:NoNoteObjets', ...
				'Note objects expected after %s', name );
		end
		
		notes = args{numArg};
		playableNotes = notes( [ notes.isNote ] & ~[ notes.isRest ] );
		isVoid = [ playableNotes.isVoid ];
		
		if ~isempty( idxInstrument ) && ~any( isVoid )
			% add instrument sheet
			
			addSheetInstrument( args{numArg}, INSTRUMENTS(idxInstrument), getAFreeChannel() );
			
		elseif ~isempty( idxPercussion ) && all( isVoid )
			% add percussion sheet
			
			addSheetPercussion( args{numArg}, PERCUSSIONS(idxPercussion) );
			
		else
			if ~isempty( idxInstrument )
				throwError( 'CACOFONIX:VoidNotes', ...
					'Unexpected void notes in the sheet of %s.', name );
			else
				throwError( 'CACOFONIX:VoidNotes', ...
					'Only void notes are authorized for the sheet %s.', name );
			end
			
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
			addGeneralSheet( notes );
		else
			addASheet( notes );
		end
		
	else
		throwError( 'CACOFONIX:UnexpectedArgument', 'Unexpected argument' );
	end
	
	numArg = numArg + 1;
	
end

% add a default Main sheet
if ~firstSheetGeneral
	addGeneralSheet( [] );
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
		str = sprintf( 'sheet %s', sheets( numCurrentSheet ).name );
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

BANK_MSB_INSTRUMENT = 121;
BANK_MSB_PERCUSSION = 120;

TRACK_NAME = 'TRACK_NAME';
NOTE_ON = 'NOTE_ON';
NOTE_OFF = 'NOTE_OFF';
BANK_MSB = 'BANK_MSB';
BANK_LSB = 'BANK_LSB';
PROGRAM = 'PROGRAM';
TEMPO = 'TEMPO';
VOLUME = 'VOLUME';
SUSTAIN = 'SUSTAIN';
MARKER = 'MARKER';
RPN_MSB = 'RPN_MSB';
RPN_LSB = 'RPN_LSB';
DATAENTRY_MSB = 'DATAENTRY_MSB';
DATAENTRY_LSB = 'DATAENTRY_LSB';
PITCH = 'PITCH';
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

%% PITCH

currentPitch = [deltaStartAndEndTrack 0]'; % [ -time- ; -pitch- ]

	function initPitch()
		currentPitch = [0 0]';
	end

	function addPitch( note )
		
		t0 = currentPitch(1,end); %max( currentTime, currentPitch(1,end) );
		p0 = currentPitch(2,end); %interp1( [ currentPitch(1,:) Inf ], [ currentPitch(2,:) 0 ], t0 );
		t1 = currentTime + note.delay;
		p1 = note.pitchValue;
		
		currentPitch( :, currentPitch(1,:) >= t0 ) = [];
		
		function t = getTimes()
			t = unique( [ t0:pitchSampling:t1 t1 ] );
			if length( t ) < nbMinSampling
				t = linspace( t0, t1, nbMinSampling );
			end
		end
		
		if t0 == t1
			t = t1;
			p = p1;
			
		else
			
			switch note.pitchTransition
				
				case 'none'
					t = [ t0 t1 ];
					p = [ p0 p1 ];
					
				case 'linear'
					t = getTimes();
					p = (p1-p0)*(t-t0)/(t1-t0) + p0;
					
				case 'quad'
					t = getTimes();
					p = (p1-p0)*((t-t0).^2)/((t1-t0)^2) + p0;
					
				case 'quad2'
					t = getTimes();
					p = (p0-p1)*((t-t1).^2)/((t0-t1)^2) + p1;
					
			end
			
		end
		
		currentPitch = [ currentPitch [ t; p ] ];
		
	end

	function addPitchEvents()
		
		if size(currentPitch,2)==1 && currentPitch(2,1)==0
			return
		end
		
		times = currentPitch(1,:);
		pitchs = currentPitch(2,:);
		
		maxRange = ceil( max( abs( pitchs ) ) );
		
		idx = [ false diff( times )==0 ];
		times( idx ) = [];
		pitchs( idx ) = [];
		
		pitchs = min( max( round(pitchs*8192/maxRange)+8192, 0 ), 16383 );
		idx = [ false diff( pitchs )==0 ];
		times( idx ) = [];
		pitchs( idx ) = [];
		
		addEvent( RPN_MSB, deltaStartAndEndTrack, 0 );
		addEvent( RPN_LSB, deltaStartAndEndTrack, 0 );
		addEvent( DATAENTRY_MSB, deltaStartAndEndTrack, maxRange );
		addEvent( DATAENTRY_LSB, deltaStartAndEndTrack, 0 );
		
		for i = 1:length( times )
			addEvent( PITCH, times(i), pitchs(i) );
		end
		
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
		
		if ~note.isRest
			
			tonality = getTonality( note );
			accent = note.accent;
			duration = note.duration;
			dynamics = getCurrentDynamics( note );
			isTied = note.isTied;
			isArpeggiated = note.isArpeggiated;
			
			isAdded = false;
			
			if isTied
				
				indexTime = roundDuration( [ notes(1:nbNotes).stop ] - currentTime ) == 0;
				if any( indexTime )
					
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
					
					if ~isAdded
						% prolongate all
						[ notes( indexTime ).stopPlay ] = deal( currentTime );
					end
					
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
				
			elseif note.defPitch
				addPitch( note );
				
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

drumKitProgramAdded = false;
maxDuration = deltaStartAndEndTrack;

% read sheets
for numCurrentSheet = 1:nbSheets
	
	initEvents();
	initNotes();
	initOctave();
	initDynamics();
	initMarker();
	initBarSync();
	initPitch();
	
	addEvent( TRACK_NAME, 0, sheets(numCurrentSheet).name );
	
	currentTime = deltaStartAndEndTrack;
	
	if ~isempty( sheets(numCurrentSheet).instrument )
		addEvent( BANK_MSB, currentTime, BANK_MSB_INSTRUMENT );
		addEvent( BANK_LSB, currentTime, sheets(numCurrentSheet).instrument.bank );
		addEvent( PROGRAM, currentTime, sheets(numCurrentSheet).instrument.patch );
		
	elseif numCurrentSheet > 1 && ~drumKitProgramAdded
		% add only at the first sheet
		addEvent( BANK_MSB, currentTime, BANK_MSB_PERCUSSION );
		addEvent( BANK_LSB, currentTime, 0 );
		addEvent( PROGRAM, currentTime, drumKit.program );
		drumKitProgramAdded = true;
		
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
	
	% add pitch whell events
	addPitchEvents()
	
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
if isempty( tempoEvt ) || tempoEvt(1).time > deltaStartAndEndTrack
	% add default tempo
	addEvent( TEMPO, deltaStartAndEndTrack, defaultTempo );
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
				
			case BANK_MSB
				[ bin(jj).hexa bin(jj).len ] = getHexa( ev.time, [ 176+channel 0 ], ev.arg1, 1 );
			case BANK_LSB
				[ bin(jj).hexa bin(jj).len ] = getHexa( ev.time, [ 176+channel 32 ], ev.arg1, 1 );
			case PROGRAM
				[ bin(jj).hexa bin(jj).len ] = getHexa( ev.time, 192+channel, ev.arg1, 1 );
				
			case MARKER
				marker = ev.arg1; lMarker = length( marker );
				[ bin(jj).hexa bin(jj).len] = getHexa( ev.time, [255 6 lMarker ], marker+0, ones(1,lMarker) );
				
			case RPN_MSB
				[ bin(jj).hexa bin(jj).len ] = getHexa( ev.time, [ 176+channel 101 ], ev.arg1, 1 );
			case RPN_LSB
				[ bin(jj).hexa bin(jj).len ] = getHexa( ev.time, [ 176+channel 100 ], ev.arg1, 1 );
			case DATAENTRY_MSB
				[ bin(jj).hexa bin(jj).len ] = getHexa( ev.time, [ 176+channel 6 ], ev.arg1, 1 );
			case DATAENTRY_LSB
				[ bin(jj).hexa bin(jj).len ] = getHexa( ev.time, [ 176+channel 38 ], ev.arg1, 1 );
				
			case PITCH
				valueStr = dec2bin( round( ev.arg1 ), 14 ); values = [ bin2dec(['0' valueStr(1:7)]) bin2dec(['0' valueStr(8:14)]) ];
				[ bin(jj).hexa bin(jj).len ] = getHexa( ev.time, 224+channel, values(2), 1, values(1), 1 );
				
			case TRACK_NAME
				name = ev.arg1; lName = length( name );
				[ bin(jj).hexa bin(jj).len] = getHexa( ev.time, [255 3 lName], name+0, ones(1,lName) );
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

%% ### FINISH ALERT

info = audiodevinfo();
if length( info.output ) > 0
	soundsc( finishAlert.y, finishAlert.Fs );
end

end
