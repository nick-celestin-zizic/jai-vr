cbuffer ModelViewProjectionConstantBuffer : register(b0) {
  matrix model;
  matrix view_proj[2]; // one for each eye
};

struct VS_Input {
    float3 pos : POSITION;
    float3 col : COLOR;
};

struct PS_Input {
    float4 pos : SV_POSITION;
    float4 col : COLOR;
};
/*
*/
PS_Input vs_main(VS_Input input, uint id : SV_InstanceID) {
  PS_Input output;

  float4 pos = float4(input.pos, 1.0f);
  pos = mul(pos, model);
  pos = mul(pos, view_proj[id]);
  
  //pos = mul(pos, Projection[id]);
  output.pos = pos;

  // Just pass through the color data
  output.col = float4(input.col, 1.0f);

  return output;
}

struct PS_Output {
  float4 color : SV_Target0;
};
PS_Output ps_main(PS_Input input) : SV_Target {
  PS_Output output;
  output.color = input.col;
  
  return output;
}
