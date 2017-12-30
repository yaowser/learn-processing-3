// Hybrid Shape 2
size(600, 600);
curveTightness(-.4);
smooth();
strokeWeight(10);
float sides = 8;
float angle = 360.0/sides/2;
float px = 0, py = 0;
float cx = 0, cy = 0;
float ang = 360.0/(sides+sides/2.0);
float ang2 = ang/2.0;
float rad1 = 250.0;
float rad2 = rad1*2.0;
int x = width/2;
int y = height/2;
beginShape();
for (int i=0; i<sides; i++){
cx = x+cos(radians(angle))*rad2;
cy = y+sin(radians(angle))*rad2;
curveVertex(cx, cy);
px = x+cos(radians(angle))*rad1;
py = y+sin(radians(angle))*rad1;
curveVertex(px, py);
angle+=ang;
px = x+cos(radians(angle))*rad1;
py = y+sin(radians(angle))*rad1;
curveVertex(px, py);
cx = x+cos(radians(angle))*rad2;
cy = y+sin(radians(angle))*rad2;
curveVertex(cx, cy);
px = x+cos(radians(angle))*rad1;
py = y+sin(radians(angle))*rad1;
vertex(px, py);
angle+=ang2;
px = x+cos(radians(angle))*rad1;
py = y+sin(radians(angle))*rad1;
vertex(px, py);
}
endShape(CLOSE);