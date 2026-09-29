class_name MainMenu
extends Control

@onready var start_button = $MarginContainerButtons/VBoxContainer/StartButton as Button
@onready var options_button = $MarginContainerButtons/VBoxContainer/OptionsButton as Button
@onready var quit_button = $MarginContainerButtons/VBoxContainer/ExitButton as Button 

@onready var options_menu = $Options_Menu as OptionsMenu

@onready var margin_container_title = $MarginContainerTitle as MarginContainer
@onready var margin_container_buttons = $MarginContainerButtons as MarginContainer

@onready var menu_music_player: AudioStreamPlayer2D = $menu_music_player

# Called when the node enters the scene tree for the first time.
func _ready():
	if menu_music_player and not menu_music_player.playing:
		menu_music_player.play()
	
	Fader.fade_out()
	handle_connecting_signals()

func on_start_pressed() -> void:
	if not await Fader.fade_in():
		return
	if menu_music_player:
		var t = create_tween()
		t.tween_property(menu_music_player, "volume_db", -80.0, 1.5)
		await t.finished
		menu_music_player.stop()
		
	get_tree().change_scene_to_file("res://scenes/story_scene.tscn")

func on_options_pressed() -> void:
	if not await Fader.fade_in():
		return
	margin_container_title.visible = false;
	margin_container_buttons.visible = false;
	options_menu.set_process(true)
	options_menu.visible = true;
	if not await Fader.fade_out():
		return
	

func on_exit_pressed() -> void:
	get_tree().quit()
	
#Function for exit of Options menu 
func on_exit_options_menu() -> void:
	if not await Fader.fade_in():
		return
	margin_container_title.visible = true
	margin_container_buttons.visible = true
	options_menu.visible = false
	if not await Fader.fade_out():
		return

func handle_connecting_signals() -> void:
	start_button.button_down.connect(on_start_pressed)
	options_button.button_down.connect(on_options_pressed)
	quit_button.button_down.connect(on_exit_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu)
	
