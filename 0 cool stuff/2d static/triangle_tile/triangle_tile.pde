/*
Tessellated Plane
Ira Greenberg, December 30, 2005
*/
void setup(){
size(400, 400);
smooth();
tesselate(6, 20);
}
void tesselate(int points, int radius){
/* catch and handle out of
range point count */
if (points<=5){
points = 4;
}
else {
points = 6;
}
// eventually add some more patterns
switch(points){
case 4:
for (int i = 0, k = 0; i<=width+radius; i+=radius*2, k++){
for (int j = 0; j<=height+radius; j+=radius*2){
drawPoly(i-radius, j-radius, points, 0, radius);
drawPoly(i, j, points, 0, radius);
}
}
break;
case 6:
for (float i = 0, k = 0; i<=width+radius; i+=radius*1.5, k++){
for (float j = 0; j<=height+radius*2; j+=(cos(radians(30))* 
radius)*2){
if (k%2==0){
drawPoly(i, j-cos(radians(30))*radius, points, 0, radius);
}
else{
drawPoly(i, j, points, 0, radius);
}
}
}
break;
}
}
// draw triangle fan
void drawPoly(float x, float y, int pts, float initAngle, float rad){
strokeWeight(1.5);
float px = 0, py = 0;
float angle = initAngle;
// needs to rotate clockwise
beginShape(TRIANGLE_FAN);
vertex(x, y);
for (int i=0; i<=pts; i++){
fill(255/pts*i);
px = x+cos(radians(angle))*rad;
py = y+sin(radians(angle))*rad;
vertex(px, py);
angle+= 360/pts;
}
}