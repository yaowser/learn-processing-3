// regular polygon
size(400, 400);
smooth();
float px, py, angle = 0, radius = 150;
int sides = 8;
beginShape();
for (int i=0; i<sides; i++){
px = width/2+cos(radians(angle))*radius;
py = height/2+sin(radians(angle))*radius;
vertex(px, py);
angle+=360.0/sides;
}
endShape(CLOSE);