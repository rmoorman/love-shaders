uniform float time;
varying vec2 vBlurOffsets[14];

vec4 position(mat4 transformProjection, vec4 vertexPosition){
  vBlurOffsets[ 0] = VertexTexCoord.xy + vec2(0.0, -0.028);
  vBlurOffsets[ 1] = VertexTexCoord.xy + vec2(0.0, -0.024);
  vBlurOffsets[ 2] = VertexTexCoord.xy + vec2(0.0, -0.020);
  vBlurOffsets[ 3] = VertexTexCoord.xy + vec2(0.0, -0.016);
  vBlurOffsets[ 4] = VertexTexCoord.xy + vec2(0.0, -0.012);
  vBlurOffsets[ 5] = VertexTexCoord.xy + vec2(0.0, -0.008);
  vBlurOffsets[ 6] = VertexTexCoord.xy + vec2(0.0, -0.004);
  vBlurOffsets[ 7] = VertexTexCoord.xy + vec2(0.0,  0.004);
  vBlurOffsets[ 8] = VertexTexCoord.xy + vec2(0.0,  0.008);
  vBlurOffsets[ 9] = VertexTexCoord.xy + vec2(0.0,  0.012);
  vBlurOffsets[10] = VertexTexCoord.xy + vec2(0.0,  0.016);
  vBlurOffsets[11] = VertexTexCoord.xy + vec2(0.0,  0.020);
  vBlurOffsets[12] = VertexTexCoord.xy + vec2(0.0,  0.024);
  vBlurOffsets[13] = VertexTexCoord.xy + vec2(0.0,  0.028);
  return transformProjection * vertexPosition;
}
