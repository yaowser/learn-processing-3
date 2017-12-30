// mouseReleased
// example 1
// declare x, y
float x, y;
// declare and initialize w, h
float w = 20.0, h = 20.0;
// rectangle fill color variable
color rectColor = color(255, 255, 255);
void setup(){
size(400, 400);
// initialize x, y
x = width/2.0;
y = height/2.0;
rectMode(CENTER);
}
void draw(){
background(255);
fill(rectColor);
rect(x, y, w, h);
}
void mousePressed() {
x = mouseX;
y = mouseY;
}
// randomly change fill color upon mouse release
void mouseReleased() {
rectColor = color(random(255), random(255), random(255));
}