/*
Poly Pattern II
Ira Greenberg, November 26, 2005
revised October 18, 2006
pattern: spiral
*/
void setup(){
size(400, 400);
background(0);
smooth();
float radius = 0, radius2 = 0;
float x = 0, y = 0;
float ang = 0;
while(x<width*1.5){
y = height/2+sin(radians(ang))*radius;
x = width/2+cos(radians(ang))*radius;
makePoly(x, y, 8, radius2, int(radius2*30), 6, BEVEL);
// you can change these values
ang+=1.1;
radius+=.059;
radius2+=.0016;
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