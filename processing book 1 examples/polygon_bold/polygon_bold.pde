/*
Poly Maker
Ira Greenberg, November 26, 2005
revised October 18, 2006
*/
void setup(){
size(400, 400);
background(0);
smooth();
noFill();
makePoly(width/2, height/2, 9, 150, 255, 8, MITER);
}
void makePoly(int x, int y, int points, float radius, 
int strokeCol, float strokeWt, int strokeJn){
float px=0, py=0;
float angle = 0;
stroke(strokeCol);
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