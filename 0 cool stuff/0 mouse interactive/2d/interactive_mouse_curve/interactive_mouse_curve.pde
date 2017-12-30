/*
Curves
Ira Greenberg, November 7, 2005
revised October 9, 2006
--------------------------------------
Interact with the curves by dragging
the anchors/control points
green curve = spline
blue curve = bezier
*/
int pts = 4;
int ptSize = 6;
float[]x = new float[4];
float[]y = new float[4];
boolean[]isDragSafe = new boolean[4];
void setup(){
size(300, 300);
smooth();
// fill coordinate arrays
x[0] = x[1] = 50;
x[2] = x[3] = width-50;
y[0] = height/2-50;
y[3] = height/2+50;
y[1] = y[2] = height/2;
//initialize dragging flags to false
for (int i=0; i<pts; i++){
isDragSafe[i] = false;
}
}
void draw(){
background(255);
noFill();
//draw curves and control handles
strokeWeight(2);
//spline curve
stroke(0, 200, 30);
curve (x[0], y[0],x[0], y[0], x[1], y[1], x[2], y[2]);
curve (x[0], y[0], x[1], y[1], x[2], y[2], x[3], y[3]);
curve (x[1], y[1], x[2], y[2], x[3], y[3], x[0], y[0]);
//bezier curve
stroke(0, 30, 200);
bezier (x[1], y[1],x[0], y[0], x[3], y[3], x[2], y[2]);
// draw bezier handles
strokeWeight(1);
stroke(100);
line(x[0], y[0], x[1], y[1]);
line(x[2], y[2], x[3], y[3]);
// draw anchor/control points
stroke(0);
fill(0);
for (int i=0; i<pts; i++){
if (i==0 || i==3){
fill(255, 100, 10);
rectMode(CENTER);
rect(x[i], y[i], ptSize, ptSize);
}
else {
fill(0);
ellipse(x[i], y[i], ptSize, ptSize);
}
}
// start dragging if flag true
for (int i=0; i<pts; i++){
if (isDragSafe[i]){
x[i] = mouseX;
y[i] = mouseY;
}
}
}
// release any point attached to the mouse
void mouseReleased (){
for (int i=0; i<pts; i++){
isDragSafe[i] = false;
}
}
// for dragg'n dem points
void mousePressed (){
for (int i=0; i<pts; i++){
if (mouseX>=x[i]-5 && mouseX<=x[i]+ptSize+5 &&
mouseY>=y[i]-5 && mouseY<=y[i]+ptSize+5){
isDragSafe[i] = true;
}
}
}
// show hand when over draggable points
void mouseMoved (){
cursor(ARROW);
for (int i=0; i<pts; i++){
if (mouseX>=x[i]-5 && mouseX<=x[i]+ptSize+5 &&
mouseY>=y[i]-5 && mouseY<=y[i]+ptSize+5){
cursor(HAND);
}
}
}