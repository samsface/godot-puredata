extends SubViewportContainer

@onready var subviewport_ = $SubViewport

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Bus.config_service.graphics_quality_changed.connect(_invalidate_graphics_quality)
	_invalidate_graphics_quality()

func _invalidate_graphics_quality() -> void:
	match Bus.config_service.graphics_quality:
		ConfigService.GraphicsQuality.HIGH:
			subviewport_.msaa_3d = Window.MSAA_8X
			subviewport_.screen_space_aa = Window.SCREEN_SPACE_AA_FXAA
			subviewport_.use_taa = false
			subviewport_.scaling_3d_scale = 0.5
			get_tree().call_group("light", "set_visible", true)
		ConfigService.GraphicsQuality.LOW:
			subviewport_.msaa_3d = Window.MSAA_DISABLED
			subviewport_.screen_space_aa = Window.SCREEN_SPACE_AA_DISABLED
			subviewport_.use_taa = false
			subviewport_.scaling_3d_scale = 0.5
			get_tree().call_group("light", "set_visible", false)
		ConfigService.GraphicsQuality.POTATO:
			subviewport_.msaa_3d = Window.MSAA_DISABLED
			subviewport_.screen_space_aa = Window.SCREEN_SPACE_AA_DISABLED
			subviewport_.use_taa = false
			subviewport_.scaling_3d_scale = 0.25
			get_tree().call_group("light", "set_visible", false)
