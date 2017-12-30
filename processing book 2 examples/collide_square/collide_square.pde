// Rotating Square
// declare global variables
// for moving square
float x, y, w;
float spdX, spdY, theta, rotSpd;
void setup() {
size(600, 600);
// initialize global variables
x = width/2;
y = height/2;
w = 150;
spdX = 2.1;
spdY = 1.5;
rotSpd = PI/180;
fill(0, 175, 175);
noStroke();
} // end setup
void draw() {
background(255, 127, 0);
pushMatrix();
translate(x, y);
rotate(theta);
rect(-w/2, -w/2, w, w);
collide();
popMatrix();
x += spdX;
y += spdY;
theta += rotSpd;
} // end draw
void collide() {
if (x > width-w/2) {
spdX *= -1;
rotSpd *= -1;
}
else if (x < w/2) {
spdX *= -1;
rotSpd *= -1;
}
if (y > height-w/2) {
spdY *= -1;
rotSpd *= -1;
}
else if (y < w/2) {
spdY *= -1;
rotSpd *= -1;
}
} // end collide