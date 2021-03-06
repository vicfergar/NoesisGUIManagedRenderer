#version 450

layout(binding = 2, std140) uniform type_Buffer0
{
    vec4 radialGrad[2];
    float opacity;
} Buffer0;

uniform sampler2D SPIRV_Cross_CombinedrampsrampsSampler;
uniform sampler2D SPIRV_Cross_CombinedglyphsglyphsSampler;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 1) in vec2 in_var_TEXCOORD1;
layout(location = 2) in vec2 in_var_TEXCOORD4;
layout(location = 0) out vec4 out_var_SV_Target0;

void main()
{
    float _57 = (Buffer0.radialGrad[1].y * in_var_TEXCOORD0.x) - (Buffer0.radialGrad[1].z * in_var_TEXCOORD0.y);
    float _98 = length(dFdx(in_var_TEXCOORD4));
    float _104 = (-0.64999997615814208984375) * (1.0 - ((clamp(1.0 / _98, 0.125, 0.25) - 0.125) * 8.0));
    float _105 = 0.64999997615814208984375 * _98;
    out_var_SV_Target0 = texture(SPIRV_Cross_CombinedrampsrampsSampler, vec2(((Buffer0.radialGrad[0].x * in_var_TEXCOORD0.x) + (Buffer0.radialGrad[0].y * in_var_TEXCOORD0.y)) + (Buffer0.radialGrad[0].z * sqrt((((Buffer0.radialGrad[0].w * in_var_TEXCOORD0.x) * in_var_TEXCOORD0.x) + ((Buffer0.radialGrad[1].x * in_var_TEXCOORD0.y) * in_var_TEXCOORD0.y)) - (_57 * _57))), Buffer0.radialGrad[1].w)) * (smoothstep(_104 - _105, _104 + _105, 7.96875 * (texture(SPIRV_Cross_CombinedglyphsglyphsSampler, in_var_TEXCOORD1).x - 0.501960813999176025390625)) * Buffer0.opacity);
}

