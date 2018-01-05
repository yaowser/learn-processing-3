// TRIANGLE_STRIP Spiral
size(400, 400);
background(0);
smooth();
int x = width/2;
int y = height/2;
int outerRad = 160;
int innerRad = 200;
float px = 0, py = 0, angle = 0;
int pts = 36;
float rot = 360.0/pts;
int fillCol = 255;
int fillfade = fillCol/pts;
beginShape(TRIANGLE_STRIP);
for (int i=0; i<pts; i++) {
px = x+cos(radians(angle))*outerRad;
py = y+sin(radians(angle))*outerRad;
angle+=rot;
vertex(px, py);
px = x+cos(radians(angle))*innerRad;
py = y+sin(radians(angle))*innerRad;
vertex(px, py);
outerRad-=4;
innerRad-=4.25;
fill(fillCol);
fillCol-=fillfade;
angle+=rot;
}
endShape();