/*
HoneyComb
Ira Greenberg, November 6, 2005
*/
// total polys
int polyCount;
// poly array
Poly[]pols;
// I created 2 radii to allow asymmetry
int rad1 = 10, rad2 = 10;
// change poly orientation
float initAng = 0;
void setup(){
size(400, 400);
background(255);
/* 1 extra cell is added to each row and
column to allow the honeycomb to bleed
off the display window */
polyCount = (width/(rad1*2) + 1) * (height/(rad2*2) + 1);
//create Poly array
pols = new Poly[polyCount];
for (int i=0; i<polyCount; i++){
// instantiate each Poly obj in pols array
pols[i] = new Poly(6, rad1, rad2, initAng);
}
}
void draw(){
background(255);
// counter keeps track of Poly count
int counter = 0;
// shift creates honeycomb pattern
// and bleed
int shiftx = rad1/2;
int shifty = rad2/2;
/* create rows and columns in honeycomb,
calling Poly drawPoly method for each
Poly obj*/
for (int i=shiftx; i<=width+shiftx; i+=rad1*2){
shifty*=-1;
for (int j=shifty; j<=height+shifty; j+=rad2*2){
pols[counter++].drawPoly(i, j);
}
}
}
/*Simple Poly class, plots any
regular polygon*/
class Poly {
int sides;
float r1, r2;
float angle;
Poly(int sides, int r1, int r2, float initAng){
this.sides = sides;
this.r1 = r1;
this.r2 = r2;
angle = initAng;
}
void drawPoly(int cx, int cy){
noStroke();
fill(cy, cx, 100);
float px= 0, py = 0;
beginShape();
for (int i=0; i<sides; i++){
px = cx+cos(radians(angle))*r1;
py = cy+sin(radians(angle))*r2;
vertex(px, py);
angle+=360/sides;
}
endShape(CLOSE);
}
}