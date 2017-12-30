class hexagon extends widget {
int nSides = 6; // a hexagon has six sides
float r; // the size of the hexagon
float rot; // its orientation (rotation)
PVector speed; // speed at which it travels
hexagon() { // Default Constructor
this(new PVector(random(width), random(height)), 30, color(0));
} // hexagon()
hexagon(PVector loc, float s, color c) {
super(loc, s, c);
r = sz/2;
rot = 0;
speed = new PVector(random(-2, 2), random(-2, 2));
} // hexagon()
void setSpeed(PVector s) {
s.mult(-2);
speed = s;
} // setSpeed()
void display() {
float x1, y1;
float theta = rot;
noStroke();
fill(col);
beginShape(); // Draw the hexagon
for (int i = 0; i <nSides; i++) {
x1 = location.x + r*cos(theta);
y1 = location.y + r*sin(theta);
vertex(x1, y1);
theta += PI/3;
}
endShape(CLOSE);
} // display()
void move() {
rot += 0.01;
location.add(speed);
bounce();
} // move()
void bounce() {
if (location.x > (width-r)) { // bounce against the right edge
location.x = width-r;
speed.x = -speed.x;
}
if (location.x < r) { // bounce against the left edge
location.x = r;
speed.x = -speed.x;
}
if (location.y > (height-r)) { // bounce against the bottom edge
location.y = height-r;
speed.y = -speed.y;
}
if (location.y < r) { // bounce against the top edge
location.y = r;
speed.y = -speed.y;
}
}
}