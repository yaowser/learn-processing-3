// Rotation of a Custom Cube Around the X-, Y-, and Z-Axes
// custom Cube reference variable
SpinnyCube c1;
// array to hold different face colors
color[]quadBG = new color[6];
void setup(){
size(400, 400, P3D);
quadBG[0] = color(175, 30, 30, 255);
quadBG[1] = color(30, 175, 30, 255);
quadBG[2] = color(30, 30, 175, 255);
quadBG[3] = color(175, 175, 30, 255);
quadBG[4] = color(175, 30, 175, 255);
quadBG[5] = color(175, 87, 30, 255);
//instantiate cube
c1 = new SpinnyCube(200, 200, 200);
}
void draw(){
background(100);
translate(width/2, height/2);
if (mousePressed){
//interactive rotation
c1.spinnyRotateX(mouseY);
c1.spinnyRotateY(mouseX);
}
else {
  //automatic rotation
c1.spinnyRotateX(frameCount*PI);
c1.spinnyRotateY(frameCount*PI/4);
c1.spinnyRotateZ(frameCount*PI/5);
}
//draw cube
noStroke();
c1.create(quadBG);
}
// SpinnyCube class
class SpinnyCube extends Cube{
float angleX, angleY, angleZ;
Point3D[] transformedVertices = new Point3D[24];
// default constructor
SpinnyCube(){
}
// constructor
SpinnyCube(float w, float h, float d){
// call superclass constructor
super(w, h, d);
}
// rotation method
void spinnyRotateXYZ(){
// temporary vertices arrays
Point3D[] rotatedVertices_XAxis = new Point3D[24];
Point3D[] rotatedVertices_YAxis = new Point3D[24];
Point3D[] rotatedVertices_ZAxis = new Point3D[24];
for (int i=0; i<24; i++){
// initialize temp vertices arrays
rotatedVertices_XAxis[i] = new Point3D();
rotatedVertices_YAxis[i] = new Point3D();
rotatedVertices_ZAxis[i] = new Point3D();
// rotation around x-axis
rotatedVertices_XAxis[i].x = vertices[i].x;
rotatedVertices_XAxis[i].y = cos(radians(angleX))* 
vertices[i].y - sin(radians(angleX))*vertices[i].z;
rotatedVertices_XAxis[i].z = sin(radians(angleX))* 
vertices[i].y + cos(radians(angleX))*vertices[i].z;
// rotation around y-axis
rotatedVertices_YAxis[i].y = rotatedVertices_XAxis[i].y;
rotatedVertices_YAxis[i].z = cos(radians(angleY))* 
rotatedVertices_XAxis[i].z - sin(radians(angleY))* 
rotatedVertices_XAxis[i].x;
rotatedVertices_YAxis[i].x = sin(radians(angleY))* 
rotatedVertices_XAxis[i].z + cos(radians(angleY))* 
rotatedVertices_XAxis[i].x;
// rotation around z-axis
rotatedVertices_ZAxis[i].x = cos(radians(angleZ))* 
rotatedVertices_YAxis[i].x - sin(radians(angleZ))* 
rotatedVertices_YAxis[i].y;
rotatedVertices_ZAxis[i].y = sin(radians(angleZ))* 
rotatedVertices_YAxis[i].x + cos(radians(angleZ))* 
rotatedVertices_YAxis[i].y;
rotatedVertices_ZAxis[i].z = rotatedVertices_YAxis[i].z;
}
// update transformedVertices arrays
transformedVertices = rotatedVertices_ZAxis;
}
// assign rotation angles for each axis
void spinnyRotateX(float angle){
angleX = angle;
}
void spinnyRotateY(float angle){
angleY = angle;
}
void spinnyRotateZ(float angle){
angleZ = angle;
}
/* SpinnyCube (subclass) create() methods will
override Cube (superclass) create() methods. */
void create(){
// draw cube
spinnyRotateXYZ();
stroke(0);
for (int i=0; i<6; i++){
beginShape(QUADS);
for (int j=0; j<4; j++){
vertex(transformedVertices[j+4*i].x, transformedVertices[j+ 
4*i].y, transformedVertices[j+4*i].z);
}
endShape();
}
}
void create(color[]quadBG){
// draw cube
spinnyRotateXYZ();
for (int i=0; i<6; i++){
fill(quadBG[i]);
beginShape(QUADS);
for (int j=0; j<4; j++){
vertex(transformedVertices[j+4*i].x, transformedVertices[j+ 
4*i].y, transformedVertices[j+4*i].z);
}
endShape();
}
}
}