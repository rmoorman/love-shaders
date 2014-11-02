uniform float time;
varying vec2 vBlurOffsets[14];

vec4 position(mat4 transformProjection, vec4 vertexPosition){
  vBlurOffsets[ 0] = VertexTexCoord.xy + vec2(-0.028, 0.0);
  vBlurOffsets[ 1] = VertexTexCoord.xy + vec2(-0.024, 0.0);
  vBlurOffsets[ 2] = VertexTexCoord.xy + vec2(-0.020, 0.0);
  vBlurOffsets[ 3] = VertexTexCoord.xy + vec2(-0.016, 0.0);
  vBlurOffsets[ 4] = VertexTexCoord.xy + vec2(-0.012, 0.0);
  vBlurOffsets[ 5] = VertexTexCoord.xy + vec2(-0.008, 0.0);
  vBlurOffsets[ 6] = VertexTexCoord.xy + vec2(-0.004, 0.0);
  vBlurOffsets[ 7] = VertexTexCoord.xy + vec2( 0.004, 0.0);
  vBlurOffsets[ 8] = VertexTexCoord.xy + vec2( 0.008, 0.0);
  vBlurOffsets[ 9] = VertexTexCoord.xy + vec2( 0.012, 0.0);
  vBlurOffsets[10] = VertexTexCoord.xy + vec2( 0.016, 0.0);
  vBlurOffsets[11] = VertexTexCoord.xy + vec2( 0.020, 0.0);
  vBlurOffsets[12] = VertexTexCoord.xy + vec2( 0.024, 0.0);
  vBlurOffsets[13] = VertexTexCoord.xy + vec2( 0.028, 0.0);
  return transformProjection * vertexPosition;
}
