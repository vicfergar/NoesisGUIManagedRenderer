struct VS_IN
{
	float4 pos : POSITION;
};

struct PS_IN
{
	float4 pos : SV_POSITION;
};

PS_IN VS( VS_IN input )
{
	PS_IN output = (PS_IN)0;
	
	output.pos = input.pos;
	
	return output;
}

float4 PS( PS_IN input ) : SV_Target
{
	return float4(1, 1, 1, 1);
}
