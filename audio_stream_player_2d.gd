extends AudioStreamPlayer2D

const level_music = preload("res://Voicy_chill guy music.mp3")

func play_music(music: AudioStream):
	if stream == music:
		return
	
	stream = music 
	play()

func play_music_level():
	play_music(level_music)

func transition_sound(stream: AudioStream):
	var _player = AudioStreamPlayer.new()
	_player.stream = stream 
	_player.name = "_player"
	add_child(_player)
	_player.play()
	
	await _player.finished
	_player.queue_free()
