extends Control

@export_file("*.tscn") var first_level_scene: String

# Rutas de nodos
@onready var texture_rect: TextureRect = $MarginContainer/VBoxContainer/CenterContainer/TextureRect
@onready var text_label: RichTextLabel = $MarginContainer/VBoxContainer/RichTextLabel
@onready var next_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/NextButton
@onready var skip_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/SkipButton
@onready var music_player: AudioStreamPlayer2D = $StoryMusicPlayer # <-- Referencia a la música


# Datos de la historia (Las 4 escenas dramáticas y poéticas)
var story_data: Array[Dictionary] = [
	{
		"image": preload("res://assets/art/pictures/Escena1.jpg"),
		"text": "Hubo un tiempo en que mi mundo cabía en la risa clara de mis hijos y en la voz cálida de mi compañera al atardecer... Pero el destino arrancó el compás de nuestros días en un parpadeo de fuego y furia. El silencio que dejaron es un peso tan denso que me ahoga."
	},
	{
		"image": preload("res://assets/art/pictures/Escena1.jpg"),
		"text": "Atrapado en esta noche perpetua, busqué consuelo en los cantos antiguos. Los mitos hablan de los Gemelos Sagrados y de cómo desafiaron las fauces de Xibalbá. Sé que son solo cuentos... pero cuando el alma se muere en vida, hasta una leyenda se vuelve la única verdad."
	},
	{
		"image": preload("res://assets/art/pictures/Escena1.jpg"),
		"text": "Ahora me encuentro aquí, al borde de la gran garganta de la tierra. Ninguna advertencia, ninguna tinta sobre el papel me preparó para este frío que atraviesa los huesos. El inframundo no es un relato; es una presencia viva que me espera."
	},
	{
		"image": preload("res://assets/art/pictures/Escena1.jpg"),
		"text": "No sé qué monstruos habitan en las profundidades ni si mi frágil cuerpo resistirá. Pero si el precio de volver a escuchar su voz es caminar por el valle de los muertos... Iré a buscarte, aunque tenga que arrancarle el corazón al mismo Xibalbá."
	}
]

var current_index: int = 0

func _ready() -> void:
	# Conectar señales de los botones
	next_button.pressed.connect(_on_next_pressed)
	skip_button.pressed.connect(_on_skip_pressed)
	
	# Reproducir música de la cinemática al arrancar
	if music_player and music_player.stream:
		music_player.play()
	
	# Reproducir animación de entrada inicial (fundido desde negro)
	
	# Mostrar la primera diapositiva
	load_slide(current_index)
	if not await Fader.fade_out():
		return

func load_slide(index: int) -> void:
	if index < story_data.size():
		# Cambiar imagen y texto
		texture_rect.texture = story_data[index]["image"]
		text_label.text = story_data[index]["text"]
		
		# Efecto de máquina de escribir con Tween
		text_label.visible_characters = 0
		var tween = create_tween()
		tween.tween_property(text_label, "visible_characters", text_label.text.length(), 10.0) # Ajustado a 2 segundos para lectura cómoda
	else:
		finish_story()

func _on_next_pressed() -> void:
	current_index += 1
	if current_index < story_data.size():
		load_slide(current_index)
	else:
		finish_story()

func _on_skip_pressed() -> void:
	finish_story()

func finish_story() -> void:
	# Deshabilitar botones para evitar múltiples clics
	next_button.disabled = true
	skip_button.disabled = true
	
	# Opcional: Desvanecer la música poco a poco (Fade out de audio)
	if music_player and music_player.playing:
		var audio_tween = create_tween()
		audio_tween.tween_property(music_player, "volume_db", -80.0, 1.5) # Baja el volumen a silencio en 1.5s
		music_player.stop()
	# Reproducir desvanecimiento visual a negro
	if not await Fader.fade_in():
		return	
	
	# Cambiar al primer nivel del juego
	if first_level_scene:
		get_tree().change_scene_to_file(first_level_scene)
	else:
		print("Error: No se ha asignado la escena del primer nivel.")
