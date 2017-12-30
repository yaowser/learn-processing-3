// mouseDragged Example
float x, y;
// declare and initialize radius
float r = 5.0;
void setup(){
size(400, 400);
// initialize x, y
x = width/2.0;
y = height/2.0;
frameRate(30);
smooth();
noStroke();
}
void draw(){
// fading background
fill(0, 5);
rect(0, 0, width, height);
fill(255);
ellipse(x, y, r*2, r*2);
}
void mouseDragged() {
x = mouseX;
y = mouseY;
}