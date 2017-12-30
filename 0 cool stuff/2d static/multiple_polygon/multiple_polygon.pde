/*
Poly Pattern I
Ira Greenberg, November 26, 2005
revised October 18, 2006
pattern: table structure
*/
void setup(){
size(400, 400);
background(0);
smooth();
//you can change these values
int hGap = 12;
int wGap = 12;
int[]rads = { 3, 4, 5, 6, 7, 8 };
int randSize = 3;
int randPos = 3;
for (int j=0; j<=width; j+=wGap){
for (int i=0, radCntr=0; i<=height; i+=hGap, radCntr++){
makePoly(j+random(-randPos, randPos), i+randPos, rads[radCntr],
wGap/2+random(-randSize, randSize), 255, radCntr*.4, MITER);
// reset counter to avoid ArrayIndexOutOfBounds error
if (radCntr>rads.length-2){
radCntr = 0;
}
}
}
}
void makePoly(float x, float y, int points, float radius, 
int strokeCol, float strokeWt, int strokeJn){
float px=0, py=0;
float angle = 0;
stroke(strokeCol);
noFill();
strokeJoin(strokeJn);
strokeWeight(strokeWt);
beginShape();
for (int i=0; i<points; i++){
px = x+cos(radians(angle))*radius;
py = y+sin(radians(angle))*radius;
vertex(px, py);
angle+=360/points;
}
endShape(CLOSE);
}