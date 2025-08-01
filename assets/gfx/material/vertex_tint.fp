#version 140

in vec2 var_texcoord0;
in vec3 var_color;

uniform sampler2D texture_sampler;
uniform fs_uniforms
{
    mediump vec4 tint;
};

out vec4 color_out;

void main()
{
    vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    vec4 tex0 = texture(texture_sampler, var_texcoord0.xy);
    //(tex.rgb)+(colorIN.rgb)*(1.0-tex.a)
    color_out = vec4(var_color * (1.0-tex0.a) + tex0.rgb  , 1.0) + tint_pm;
}