#version 300 es

precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 fragColor;

void main() {
    vec4 color = texture(tex, v_texcoord);

    // black depth
    color.rgb = pow(color.rgb, vec3(1.15));

    // Saturation 
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    color.rgb = mix(vec3(gray), color.rgb, 1.30);

    // Stronger vibrance
    float mx = max(max(color.r, color.g), color.b);
    float mn = min(min(color.r, color.g), color.b);
    float sat = mx - mn;

    float vibrance = (1.0 - sat) * 0.35;
    color.rgb = mix(color.rgb, color.rgb * 1.15, vibrance);

    // contrast
    color.rgb = (color.rgb - 0.5) * 1.10 + 0.5;

    // brightness compensation
    color.rgb *= 1.02;

    // Prevent clipping
    color.rgb = clamp(color.rgb, 0.0, 1.0);

    fragColor = color;
}
