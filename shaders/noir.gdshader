shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_nearest;
uniform float contrast : hint_range(0.0, 3.0) = 1.2;
uniform float brightness : hint_range(-1.0, 1.0) = 0.0;

void fragment() {
    vec4 c = texture(screen_texture, SCREEN_UV);
    float gray = dot(c.rgb, vec3(0.299, 0.587, 0.114));
    
    // Apply contrast
    gray = (gray - 0.5) * contrast + 0.5;
    
    // Apply brightness
    gray = gray + brightness;
    
    // Clamp result
    gray = clamp(gray, 0.0, 1.0);
    
    COLOR = vec4(gray, gray, gray, c.a);
}
