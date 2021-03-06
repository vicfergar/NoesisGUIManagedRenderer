#version 450

const float _63[9] = float[](0.10854999721050262451171875, 0.13134999573230743408203125, 0.104060001671314239501953125, 0.072159998118877410888671875, 0.0438000001013278961181640625, 0.02328000031411647796630859375, 0.01083000004291534423828125, 0.0044100000523030757904052734375, 0.001569999963976442813873291015625);
const float _64[9] = float[](0.662930011749267578125, 2.4790399074554443359375, 4.462319850921630859375, 6.445680141448974609375, 8.42916965484619140625, 10.41281032562255859375, 12.39663982391357421875, 14.38070011138916015625, 16.365009307861328125);

layout(binding = 1, std140) uniform type_Buffer1
{
    vec4 textureSize;
} Buffer1;

layout(binding = 3, std140) uniform type_Buffer2
{
    float blurSize;
} Buffer2;

uniform sampler2D SPIRV_Cross_CombinedimageimageSampler;

layout(location = 0) in vec4 in_var_COLOR;
layout(location = 1) in vec2 in_var_TEXCOORD1;
layout(location = 2) in vec4 in_var_TEXCOORD2;
layout(location = 0) out vec4 out_var_SV_Target0;

void main()
{
    vec4 _75;
    _75 = vec4(0.0);
    for (int _78 = 0; _78 < 9; )
    {
        vec2 _84 = vec2(0.0, Buffer2.blurSize * Buffer1.textureSize.w) * _64[_78];
        _75 += ((texture(SPIRV_Cross_CombinedimageimageSampler, clamp(in_var_TEXCOORD1 + _84, in_var_TEXCOORD2.xy, in_var_TEXCOORD2.zw)) + texture(SPIRV_Cross_CombinedimageimageSampler, clamp(in_var_TEXCOORD1 - _84, in_var_TEXCOORD2.xy, in_var_TEXCOORD2.zw))) * _63[_78]);
        _78++;
        continue;
    }
    out_var_SV_Target0 = _75;
}

