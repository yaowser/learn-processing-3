/*
Poly Pattern III
Ira Greenberg, November 26, 2005
revised October 18, 2006
Pattern: PolyStar
*/
void setup(){
size(400, 400);
background(random(255));
smooth();
float ang = 0;
int steps = int(random(30, 200));
for (int i=0; i<steps; i++){
makePolyStar(width/2, height/2, int(random(3, 10)), 
ang+=360/steps, random(-width/2, width/2), 
random(-width/2, width/2), int(random(255)), 
random(.25, 5), MITER);
}
}
void makePolyStar(float x, float y, int points, float initAngle, 
float radius, float radius2, int strokeCol, float strokeWt, 
int strokeJn){
float px=0, py=0;
float angle = initAngle;
float initRadius = radius;
float halfRadius = radius2;
stroke(strokeCol);
noFill();
strokeJoin(strokeJn);
strokeWeight(strokeWt);
beginShape();
// if 2nd radius create polystar
// else create regular poly
if (radius2 !=0){
points*=2;
}
for (int i=0; i<points; i++){
//alternates radius length if polystar
if (radius2 != 0 && i%2 == 0){
radius = halfRadius;
}
else {
radius = initRadius;
}
px = x+cos(radians(angle))*radius;
py = y+sin(radians(angle))*radius;
vertex(px, py);
angle+=360/points;
}
endShape(CLOSE);
}