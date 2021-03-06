/* Interpolating a Bézier
curve within a convex hull
**************************
Click the screen a couple of
times to iteratively generate
the curve*/
int startingPoints = 3;
// Uses Java's Point class
Point[] bezier = new Point[startingPoints];
void setup(){
size(600, 400);
background(255);
smooth();
// create external bezier
bezier[0] = new Point(10, 390);
bezier[1] = new Point(300, 10);
bezier[2] = new Point(590, 390);
// plot initial convex hull
plot(bezier);
}
Point[] plotBezier(Point[] pts){
Point[] path = new Point[pts.length+1];
path[0] = pts[0];
for (int i=1; i<path.length-1; i++){
path[i] = new Point((pts[i-1].x+pts[i].x)/2, 
(pts[i-1].y+pts[i].y)/2);
}
path[path.length-1] = pts[pts.length-1];
plot(path);
return path;
}
void plot(Point[] pts){
/*** render hull ***/
if (pts.length==startingPoints){
noFill();
stroke(0);
strokeWeight(2);
//path
beginShape();
for (int i=0; i<pts.length; i++){
vertex(pts[i].x, pts[i].y);
}
endShape();
//points
fill(255);
for (int i=0; i<pts.length; i++){
if (i>0 && i<pts.length-1){
rectMode(CENTER);
// control point
rect(pts[i].x, pts[i].y, 12, 12);
}
else {
// anchor points
ellipse(pts[i].x, pts[i].y, 12, 12);
}
}
}
/*** render interpolated path ***/
else {
// path
noFill();
stroke(100);
strokeWeight(1);
beginShape();
for (int i=1; i<pts.length-1; i++){
vertex(pts[i].x, pts[i].y);
}
endShape();
// points
fill(0);
for (int i=1; i<pts.length-1; i++){
ellipse(pts[i].x, pts[i].y, 4, 4);
}
}
}
/* draw function required when
including mousePressed function*/
void draw(){}
void mousePressed(){
bezier = plotBezier(bezier);
}