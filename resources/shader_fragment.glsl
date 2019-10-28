#version 330 core
out vec4 color;
in vec3 vertex_normal;
in vec3 vertex_pos;
uniform vec3 materialColor;
uniform vec3 campos;
uniform float a;
uniform float pw;
void main()
{
//diffuse
vec3 n = normalize(vertex_normal);
vec3 lp = vec3(0, 0, 10);
vec3 ld = normalize(lp - vertex_pos);
float diffFactor = clamp(dot(n,ld), 0, 1);
//specular
vec3 lightclr = vec3(1, 1, 1);
vec3 cd = normalize(campos - vertex_pos);
vec3 h = normalize(cd+ld);
float spec = dot(n,h);
spec = clamp(spec,0,1);
spec = pow(spec, pw);

color = vec4(materialColor * 0.2 + materialColor * diffFactor * 0.8 + lightclr*spec*3, a);
}