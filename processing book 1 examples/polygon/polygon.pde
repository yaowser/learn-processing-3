/*
Polygon
Ira Greenberg, November 3, 2005
*/
// declare variables
int sides = 8; // change to create other polys
float angle;
float radius = 100;
float px, py, cx, cy;
float[]ptsX= new float[sides];
float[]ptsY= new float[sides];
//initialize sketch
void setup(){
size(200, 200, JAVA2D);
cx = width/2;
cy = height/2;
background(255);
// collect points to plot shape
for (int i = 0; i< sides; i++){
px = cx+cos(radians(angle))*radius;
py = cy+sin(radians(angle))*radius;
ptsX[i] = px;
ptsY[i] = py;
angle+=360/sides;
}
// call custom function
drawShape();
}
//custom function plots a polygon
void drawShape(){
noFill();
for (int i = 0; i< sides; i++){
// if last point, connect to initial point to close shape
if (i == sides-1){
line(ptsX[i], ptsY[i], ptsX[0], ptsY[0]);
}
else {
line(ptsX[i], ptsY[i], ptsX[i+1], ptsY[i+1]);
}
}
}