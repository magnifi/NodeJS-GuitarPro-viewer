'use strict';

midiInstruments = """acoustic grand
contrabass
lead 7 (fifths)
bright acoustic
tremolo strings
lead 8 (bass+lead)
electric grand
pizzicato strings
pad 1 (new age)
honky-tonk
orchestral harp
pad 2 (warm)
electric piano 1
timpani
pad 3 (polysynth)
electric piano 2
string ensemble 1
pad 4 (choir)
harpsichord
string ensemble 2
pad 5 (bowed)
clav
synthstrings 1
pad 6 (metallic)
celesta
synthstrings 2
pad 7 (halo)
glockenspiel
choir aahs
pad 8 (sweep)
music box
voice oohs
fx 1 (rain)
vibraphone
synth voice
fx 2 (soundtrack)
marimba
orchestra hit
fx 3 (crystal)
xylophone
trumpet
fx 4 (atmosphere)
tubular bells
trombone
fx 5 (brightness)
dulcimer
tuba
fx 6 (goblins)
drawbar organ
muted trumpet
fx 7 (echoes)
percussive organ
french horn
fx 8 (sci-fi)
rock organ
brass section
sitar
church organ
synthbrass 1
banjo
reed organ
synthbrass 2
shamisen
accordion
soprano sax
koto
harmonica
alto sax
kalimba
concertina
tenor sax
bagpipe
acoustic guitar (nylon)
baritone sax
fiddle
acoustic guitar (steel)
oboe
shanai
electric guitar (jazz)
english horn
tinkle bell
electric guitar (clean)
bassoon
agogo
electric guitar (muted)
clarinet
steel drums
overdriven guitar
piccolo
woodblock
distorted guitar
flute
taiko drum
guitar harmonics
recorder
melodic tom
acoustic bass
pan flute
synth drum
electric bass (finger)
blown bottle
reverse cymbal
electric bass (pick)
shakuhachi
guitar fret noise
fretless bass
whistle
breath noise
slap bass 1
ocarina
seashore
slap bass 2
lead 1 (square)
bird tweet
synth bass 1
lead 2 (sawtooth)
telephone ring
synth bass 2
lead 3 (calliope)
helicopter
violin
lead 4 (chiff)
applause
viola
lead 5 (charang)
gunshot
cello
lead 6 (voice)""".split "\n"

angular.module('myMusicApp').directive 'gpTab', [() ->
	scope:
		gpTab: "="
	link: (scope, element, attrs) =>
		tracksDiv = angular.element "<div class='btn-group btn-group-sm'></div>"
		tracksDiv.bind 'click', (evt)->
			elm = evt.target
			idx = tracksDiv.find('.btn').index elm
			# idx = $(@).val()
			scope.tablature.setTrack(scope.song.tracks[idx])
		element.before tracksDiv
		load = ()=>
			window.scope = scope
			scope.factory = new alphatab.tablature.model.SongFactoryImpl()
			scope.options =
				context: alphatab.platform.PlatformFactory.SVG_CANVAS
				file: scope.gpTab
				staves: ["tablature"]
				track: 0
				error: "error loading song"
				zoom: 1.1
				width: 600
				height: 200
				autoSize: true
			songLoaded = (song)=>
				scope.song = song
				scope.tablature.setTrack(song.tracks[scope.options.track])
				tracksDiv.html ""
				for track, idx in song.tracks
					tracksDiv.append "<span class='btn btn-default'>#{track.name}</span>"
			loadFile = (url)=>
				alphatab.file.SongLoader.loadSong(url, scope.factory, songLoaded)

			element.html ''
			document.createElement('canvas')
			scope.canvas = $('<canvas width="'+scope.options.width+'" height="'+scope.options.height+'" class="alphaTabSurface"></canvas>')
			element.append scope.canvas
			scope.canvas = scope.canvas[0]

	         # create tablature
			scope.tablature = new alphatab.tablature.Tablature(scope.canvas, scope.options.error)
			# scope.tablature.setStaveSetting ''
			scope.tablature.autoSizeWidth = scope.options.autoSize
			scope.tablature.updateScale scope.options.zoom

			loadFile scope.gpTab

		scope.$watch 'gpTab', ()->
			console.log "GPTab change!!", scope.gpTab
			if scope.gpTab
				load()
		, true
]
