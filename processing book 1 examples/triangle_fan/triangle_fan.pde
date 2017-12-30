//TRIANGLE_FAN
size(400, 400);
smooth();
strokeWeight(1.5);
float px = 0, py = 0;
float angle = 0;
float radius = 150;
int pts = 8;
int x = width/2;
int y = height/2;
// needs to rotate clockwise
beginShape(TRIANGLE_FAN);
vertex(x, y);
for (int i=0; i<=pts; i++){
px = x+cos(radians(angle))*radius;
py = y+sin(radians(angle))*radius;
vertex(px, py);
angle+=360/pts;
}