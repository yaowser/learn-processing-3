// Rotating Square with Accurate Wall Collisions
// declare global variables
// for moving square
float x, y, w;
float spdX, spdY, theta, rotSpd;
// enables accurate wall collisions
float cornerRadiusOffset, dynamicRadius, collisionTheta;
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
popMatrix();
x += spdX;
y += spdY;
theta += rotSpd;
// check for wall collisions
collide();
} // end draw