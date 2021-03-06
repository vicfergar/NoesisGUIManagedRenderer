#version 450

const float _82[16] = float[](0.059909999370574951171875, 0.077579997479915618896484375, 0.07231999933719635009765625, 0.0647599995136260986328125, 0.0557099990546703338623046875, 0.046039998531341552734375, 0.03655000030994415283203125, 0.02787999995052814483642578125, 0.02041999995708465576171875, 0.014379999600350856781005859375, 0.009720000438392162322998046875, 0.006310000084340572357177734375, 0.003940000198781490325927734375, 0.00236000004224479198455810546875, 0.001359999994747340679168701171875, 0.000750000006519258022308349609375);
const float _83[16] = float[](0.6655499935150146484375, 2.493710041046142578125, 4.4886798858642578125, 6.483660221099853515625, 8.4786396026611328125, 10.47362041473388671875, 12.46860027313232421875, 14.46360015869140625, 16.458599090576171875, 18.453609466552734375, 20.4486293792724609375, 22.4436492919921875, 24.438690185546875, 26.433750152587890625, 28.42881011962890625, 30.42388916015625);

layout(binding = 2, std140) uniform type_Buffer0
{
    float opacity;
} Buffer0;

layout(binding = 1, std140) uniform type_Buffer1
{
    vec4 textureSize;
} Buffer1;

layout(binding = 3, std140) uniform type_Buffer2
{
    float blurSize;
} Buffer2;

uniform sampler2D SPIRV_Cross_CombinedpatternpatternSampler;
uniform sampler2D SPIRV_Cross_CombinedimageimageSampler;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 1) in vec2 in_var_TEXCOORD1;
layout(location = 2) in vec4 in_var_TEXCOORD2;
layout(location = 0) out vec4 out_var_SV_Target0;

void main()
{
    vec4 _101;
    _101 = vec4(0.0);
    for (int _104 = 0; _104 < 16; )
    {
        vec2 _110 = vec2(Buffer2.blurSize * Buffer1.textureSize.z, 0.0) * _83[_104];
        _101 += ((texture(SPIRV_Cross_CombinedimageimageSampler, clamp(in_var_TEXCOORD1 + _110, in_var_TEXCOORD2.xy, in_var_TEXCOORD2.zw)) + texture(SPIRV_Cross_CombinedimageimageSampler, clamp(in_var_TEXCOORD1 - _110, in_var_TEXCOORD2.xy, in_var_TEXCOORD2.zw))) * _82[_104]);
        _104++;
        continue;
    }
    out_var_SV_Target0 = _101 * (Buffer0.opacity * texture(SPIRV_Cross_CombinedpatternpatternSampler, in_var_TEXCOORD0).w);
}

