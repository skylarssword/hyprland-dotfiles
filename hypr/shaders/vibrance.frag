#version 300 es

precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 fragColor;

void main() {
    vec4 color = texture(tex, v_texcoord);

    // Saturation
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    color.rgb = mix(vec3(gray), color.rgb, 1.15);

    // Simple vibrance (boost muted colors more)
    float mx = max(max(color.r, color.g), color.b);
    float mn = min(min(color.r, color.g), color.b);
    float amt = (mx - mn) * (-0.15);
    color.rgb = mix(color.rgb, vec3(mx), amt);

    // Contrast
    color.rgb = (color.rgb - 0.5) * 1.10 + 0.5;

    // Brightness
    color.rgb *= 1.03;

    fragColor = color;
}
