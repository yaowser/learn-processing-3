// mousePressed variable
// example 2
// declare x, y
float x, y;
// declare and initialize w, h
float w = 20.0, h = 20.0;
void setup(){
size(400, 400);
// initialize x, y
x = width/2.0;
y = height/2.0;
rectMode(CENTER);
}
void draw(){
background(255);
rect(x, y, w, h);
if (mousePressed){
x = mouseX;
y = mouseY;
}
}