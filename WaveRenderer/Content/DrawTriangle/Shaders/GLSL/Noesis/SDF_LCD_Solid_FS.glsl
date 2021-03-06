#version 450

layout(binding = 1, std140) uniform type_Buffer1
{
    vec4 textureSize;
} Buffer1;

uniform sampler2D SPIRV_Cross_CombinedglyphsglyphsSampler;

layout(location = 0) in vec4 in_var_COLOR;
layout(location = 1) in vec2 in_var_TEXCOORD1;
layout(location = 2) in vec2 in_var_TEXCOORD4;
layout(location = 0) out vec4 out_var_SV_Target0;
layout(location = 1) out vec4 out_var_SV_Target1;

void main()
{
    vec2 _45 = dFdx(in_var_TEXCOORD4);
    vec2 _50 = (_45 * Buffer1.textureSize.zw) * 0.3333333432674407958984375;
    float _67 = length(_45);
    float _73 = (-0.64999997615814208984375) * (1.0 - ((clamp(1.0 / _67, 0.125, 0.25) - 0.125) * 8.0));
    float _74 = 0.64999997615814208984375 * _67;
    vec3 _79 = smoothstep(vec3(_73 - _74), vec3(_73 + _74), (vec3(texture(SPIRV_Cross_CombinedglyphsglyphsSampler, in_var_TEXCOORD1 - _50).x, texture(SPIRV_Cross_CombinedglyphsglyphsSampler, in_var_TEXCOORD1).x, texture(SPIRV_Cross_CombinedglyphsglyphsSampler, in_var_TEXCOORD1 + _50).x) - vec3(0.501960813999176025390625)) * 7.96875);
    float _83 = _79.y;
    out_var_SV_Target0 = vec4((in_var_COLOR.xyz * 1.0) * _79, _83);
    out_var_SV_Target1 = vec4(_79 * in_var_COLOR.w, _83);
}

