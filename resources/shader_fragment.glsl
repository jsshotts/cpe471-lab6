#version 330 core
out vec3 color;
in vec3 vertex_normal;
in vec3 vertex_pos;
uniform vec3 campos;
void main()
{
vec3 n = normalize(vertex_normal);
vec3 lp=vec3(100,10,100);
vec3 ld = normalize(vertex_pos - lp);
float diffuse = dot(n,ld);
color = vec3(1,0,0)*diffuse*0.7;

vec3 cd = normalize(vertex_pos - campos);
vec3 h = normalize(cd+ld);
float spec = dot(n,h);
spec = clamp(spec,0,1);
spec = pow(spec,5);
color += vec3(1,1,1)*spec*3;

}
