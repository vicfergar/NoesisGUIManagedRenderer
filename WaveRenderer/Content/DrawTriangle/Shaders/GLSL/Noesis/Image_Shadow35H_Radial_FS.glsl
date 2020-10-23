#version 450

const float _74[9] = float[](0.10854999721050262451171875, 0.13134999573230743408203125, 0.104060001671314239501953125, 0.072159998118877410888671875, 0.0438000001013278961181640625, 0.02328000031411647796630859375, 0.01083000004291534423828125, 0.0044100000523030757904052734375, 0.001569999963976442813873291015625);
const float _75[9] = float[](0.662930011749267578125, 2.4790399074554443359375, 4.462319850921630859375, 6.445680141448974609375, 8.42916965484619140625, 10.41281032562255859375, 12.39663982391357421875, 14.38070011138916015625, 16.365009307861328125);

layout(binding = 2, std140) uniform type_Buffer0
{
    vec4 radialGrad[2];
    float opacity;
} Buffer0;

layout(binding = 1, std140) uniform type_Buffer1
{
    vec4 textureSize;
} Buffer1;

layout(binding = 3, std140) uniform type_Buffer2
{
    vec4 shadowColor;
    vec2 shadowOffset;
    float blurSize;
} Buffer2;

uniform sampler2D SPIRV_Cross_CombinedrampsrampsSampler;
uniform sampler2D SPIRV_Cross_CombinedshadowshadowSampler;
uniform sampler2D SPIRV_Cross_CombinedimageimageSampler;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 1) in vec2 in_var_TEXCOORD1;
layout(location = 2) in vec4 in_var_TEXCOORD2;
layout(location = 0) out vec4 out_var_SV_Target0;

void main()
{
    float _88 = (Buffer0.radialGrad[1].y * in_var_TEXCOORD0.x) - (Buffer0.radialGrad[1].z * in_var_TEXCOORD0.y);
    float _137;
    _137 = 0.0;
    for (int _140 = 0; _140 < 9; )
    {
        vec2 _146 = vec2(Buffer2.blurSize * Buffer1.textureSize.z, 0.0) * _75[_140];
        vec2 _151 = in_var_TEXCOORD1 - vec2(Buffer2.shadowOffset.x * Buffer1.textureSize.z, Buffer2.shadowOffset.y * Buffer1.textureSize.w);
        _137 += (_74[_140] * (texture(SPIRV_Cross_CombinedshadowshadowSampler, clamp(_151 + _146, in_var_TEXCOORD2.xy, in_var_TEXCOORD2.zw)).w + texture(SPIRV_Cross_CombinedshadowshadowSampler, clamp(_151 - _146, in_var_TEXCOORD2.xy, in_var_TEXCOORD2.zw)).w));
        _140++;
        continue;
    }
    vec4 _172 = texture(SPIRV_Cross_CombinedimageimageSampler, clamp(in_var_TEXCOORD1, in_var_TEXCOORD2.xy, in_var_TEXCOORD2.zw));
    out_var_SV_Target0 = (_172 + ((Buffer2.shadowColor * _137) * (1.0 - _172.w))) * (Buffer0.opacity * texture(SPIRV_Cross_CombinedrampsrampsSampler, vec2(((Buffer0.radialGrad[0].x * in_var_TEXCOORD0.x) + (Buffer0.radialGrad[0].y * in_var_TEXCOORD0.y)) + (Buffer0.radialGrad[0].z * sqrt((((Buffer0.radialGrad[0].w * in_var_TEXCOORD0.x) * in_var_TEXCOORD0.x) + ((Buffer0.radialGrad[1].x * in_var_TEXCOORD0.y) * in_var_TEXCOORD0.y)) - (_88 * _88))), Buffer0.radialGrad[1].w)).w);
}

