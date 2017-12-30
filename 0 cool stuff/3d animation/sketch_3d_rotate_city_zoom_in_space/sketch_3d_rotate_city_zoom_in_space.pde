/*
FlyThrough
Ira Greenberg, November 8, 2005
*/
/*Need to import opengl library to use OPENGL
rendering mode. You can also try running
in P3D mode*/
import processing.opengl.*;
// images used for mapping
PImage ground, brick;
// camera move variables
float bank=2;
float bankAngle;
float bankSpeed = .7;
float vert = -600;
float zoom;
float vertSpeed = 1.5;
float heading;
float headingSpeed = -.75;
float pitch;
float pan;
float zoomSpeed = 1.6;
//structures
int bldgCount = 300;
BLDG[]bldgs = new BLDG[bldgCount];
BLDG plane;
void setup(){
size(600, 400, OPENGL);
noStroke();
textureMode(NORMAL);
//load image maps
ground = loadImage("ground2.jpg");
brick = loadImage("metal2.jpg");
//set up ground plane
plane = new BLDG(width*10, 0, width*10, 0, 60, 0, ground);
// instantiate bldgs
for (int i=0; i<bldgCount; i++){
  bldgs[i] = new BLDG(10+random(30), random(100, 840), 10+random(50),
random(-width*2, width*2), 60, random(-width*3, width*2), brick);
}
}
void draw(){
background(4, 4, 20);
// set camera and lights
camera(width/2.0+pan, height/2+vert, ((height/2.0+1500-zoom) /
tan(PI*60 / 360.0)), width/2.0+pan, height/2+vert, -8000, 0, 1, 0);
fill(200);
//set up some different colored lights
ambientLight(90, 65, 52);
pointLight(51, 102, 255, width/3, height/2, 100);
pointLight(200, 40, 60, width/1.5, height/2, -150);
pointLight(20, 220, 25, -200, -100, 300);
pointLight(110, 55, 40, width*4, height/2, 1000);
//draw ground plane
pushMatrix();
translate(width/2, height/2, -20);
rotateY(radians(heading));
rotateX(radians(pitch));
rotateZ(radians(bank));
plane.drawBLDG();
// draw buildings
for (int i=0; i<bldgCount; i++){
bldgs[i].drawBLDG();
}
popMatrix();
//moon
spotLight(255, 255, 10, 80, -300, -400, -1, 0, 0, PI/1.4, 2);
pushMatrix();
translate(-600, -1500, -100);
fill(75, 185, 40, 255);
sphere(75);
popMatrix();
//planet
pointLight(20, 220, 25, 2000, -4000, -2000);
pushMatrix();
translate(2500, -4700, -2200);
fill(100, 100, 180, 55);
sphere(3200);
popMatrix();
//camera moves
bank = sin(radians(bankAngle))*12;
bankAngle+=bankSpeed;
vert = -600 +zoom*.24;
zoom+=zoomSpeed;
if (zoom>2200 || zoom<-10) {
zoomSpeed*=-1;
}
heading+=headingSpeed;
}
//simple BLDG class
class BLDG {
//properties
float w, h, d;
float shiftX, shiftY, shiftZ;
PImage img;
//constructor
BLDG(float w, float h, float d, float shiftX,
float shiftY, float shiftZ, PImage img){
this.w = w;
this.h = h;
this.d = d;
this.shiftX = shiftX;
this.shiftY = shiftY;
this.shiftZ = shiftZ;
this.img = img;
}
//main bldg drawing method
void drawBLDG(){
beginShape(QUADS);
texture(img);
//front wall
vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ, 0, 0);
vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ, 1, 0);
vertex(w + shiftX, shiftY, -d/2 + shiftZ, 1, 1);
vertex(-w/2 + shiftX, shiftY, -d/2 + shiftZ, 0, 1);
//back wall
vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ, 0, 0);
vertex(w + shiftX, -h/2 + shiftY, d + shiftZ, 1, 0);
vertex(w + shiftX, shiftY, d + shiftZ, 1, 1);
vertex(-w/2 + shiftX, shiftY, d + shiftZ, 0, 1);
//left wall
vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ, 0, 0);
vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ, 1, 0);
vertex(-w/2 + shiftX, shiftY, d + shiftZ, 1, 1);
vertex(-w/2 + shiftX, shiftY, -d/2 + shiftZ, 0, 1);
//right wall
vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ, 0, 0);
vertex(w + shiftX, -h/2 + shiftY, d + shiftZ, 1, 0);
vertex(w + shiftX, shiftY, d + shiftZ, 1, 1);
vertex(w + shiftX, shiftY, -d/2 + shiftZ, 0, 1);
//roof
vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ, 0, 0);
vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ, 1, 0);
vertex(w + shiftX, -h/2 + shiftY, d + shiftZ, 1, 1);
vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ, 0, 1);
endShape();
}
}