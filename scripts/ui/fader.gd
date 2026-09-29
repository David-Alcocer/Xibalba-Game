extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
var is_fading: bool = false

# Ahora retornan un booleano (true si empezó, false si fue rechazado)
func fade_in(duration: float = 0.3, extra_wait_time: float = 0.1) -> bool:
	if is_fading:
		return false
	
	is_fading = true
	color_rect.color.a = 0.0
	
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(color_rect, "color:a", 1.0, duration)
	
	await tween.finished
	await get_tree().create_timer(extra_wait_time).timeout
	
	is_fading = false
	return true


func fade_out(duration: float = 0.3, extra_wait_time: float = 0.1) -> bool:
	if is_fading:
		return false
		
	is_fading = true
	color_rect.color.a = 1.0
	
	await get_tree().create_timer(extra_wait_time).timeout
	
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(color_rect, "color:a", 0.0, duration)
	
	await tween.finished
	is_fading = false
	return true
