/*
Rotating Polyhedra
Ira Greenberg, November 3, 2005
*/
//declare variables
float rotY;
float rotX;
void setup(){
size (400, 400, P3D);
frameRate(30);
}
void draw(){
background(255);
/* ensures shapes are drawn at the
center of the display window. In addition,
mouse y postion controls the distance
the shapes are drawn along the z-axis.
As the shapes moves further into space,
they will diminish in size*/
translate(width/2, height/2, mouseY-100);
// rotate around Y and X axes
rotateY(rotY+=.05);
rotateX(rotX+=.1);
// mouse x position controls level
// of detail of sphere geometry
sphereDetail(mouseX/32);
fill(0);
stroke(255);
//draw sphere
sphere(30);
fill(50, 50, 50, 175);
noStroke();
//draw box
box(80);
noFill();
sphereDetail(8);
stroke(0);
// draw larger outer sphere
sphere(80);
}