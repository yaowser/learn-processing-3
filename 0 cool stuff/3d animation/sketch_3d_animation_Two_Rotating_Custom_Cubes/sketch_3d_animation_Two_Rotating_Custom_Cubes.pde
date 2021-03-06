// Two Rotating Custom Cubes
// custom Cube reference variables
Cube c1, c2;
// array to hold different face colors
color[]quadBG = new color[6];
void setup(){
size(400, 400, P3D);
quadBG[0] = color(175, 30, 30, 150);
quadBG[1] = color(30, 175, 30, 150);
quadBG[2] = color(30, 30, 175, 150);
quadBG[3] = color(175, 175, 30, 150);
quadBG[4] = color(175, 30, 175, 150);
quadBG[5] = color(175, 87, 30, 150);
c1 = new Cube(200, 200, 200);
c2 = new Cube(100, 100, 100);
}
void draw(){
background(100);
translate(width/2, height/2);
rotateX(frameCount*PI/50);
rotateY(frameCount*PI/60);
// create larger colored cube
noStroke();
c1.create(quadBG);
// create inner black cube
fill(0, 200);
stroke(255);
c2.create();
}
// Updated custom Cube class
class Cube{
Point3D[] vertices = new Point3D[24];
float w, h, d;
// Constructors
// default constructor
Cube(){
}
// constructor 2
Cube(float w, float h, float d){
this.w = w;
this.h = h;
this.d = d;
// cube composed of 6 quads
//front
vertices[0] = new Point3D(-w/2,-h/2,d/2);
vertices[1] = new Point3D(w/2,-h/2,d/2);
vertices[2] = new Point3D(w/2,h/2,d/2);
vertices[3] = new Point3D(-w/2,h/2,d/2);
//left
vertices[4] = new Point3D(-w/2,-h/2,d/2);
vertices[5] = new Point3D(-w/2,-h/2,-d/2);
vertices[6] = new Point3D(-w/2,h/2,-d/2);
vertices[7] = new Point3D(-w/2,h/2,d/2);
//right
vertices[8] = new Point3D(w/2,-h/2,d/2);
vertices[9] = new Point3D(w/2,-h/2,-d/2);
vertices[10] = new Point3D(w/2,h/2,-d/2);
vertices[11] = new Point3D(w/2,h/2,d/2);
//back
vertices[12] = new Point3D(-w/2,-h/2,-d/2);
vertices[13] = new Point3D(w/2,-h/2,-d/2);
vertices[14] = new Point3D(w/2,h/2,-d/2);
vertices[15] = new Point3D(-w/2,h/2,-d/2);
//top
vertices[16] = new Point3D(-w/2,-h/2,d/2);
vertices[17] = new Point3D(-w/2,-h/2,-d/2);
vertices[18] = new Point3D(w/2,-h/2,-d/2);
vertices[19] = new Point3D(w/2,-h/2,d/2);
//bottom
vertices[20] = new Point3D(-w/2,h/2,d/2);
vertices[21] = new Point3D(-w/2,h/2,-d/2);
vertices[22] = new Point3D(w/2,h/2,-d/2);
vertices[23] = new Point3D(w/2,h/2,d/2);
}
void create(){
// draw cube
for (int i=0; i<6; i++){
beginShape(QUADS);
for (int j=0; j<4; j++){
vertex(vertices[j+4*i].x, vertices[j+4*i].y, 
vertices[j+4*i].z);
}
endShape();
}
}
void create(color[]quadBG){
// draw cube
for (int i=0; i<6; i++){
fill(quadBG[i]);
beginShape(QUADS);
for (int j=0; j<4; j++){
vertex(vertices[j+4*i].x, vertices[j+4*i].y, 
vertices[j+4*i].z);
}
endShape();
}
}
}
// This example requires the Point3D class.
class Point3D{
float x, y, z;
// constructors
Point3D(){
}
Point3D(float x, float y, float z){
this.x = x;
this.y = y;
this.z = z;
}
}